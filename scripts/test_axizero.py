#!/usr/bin/env python3
# Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
"""Unit tests for the axizero.py YAML front end.

Run with:  python scripts/test_axizero.py

These exercise the Scala emitters and the config validator directly, so they
need neither sbt nor a JDK and finish in well under a second.  The end-to-end
generate is covered separately by the CI smoke test.
"""

import contextlib
import importlib.util
import io
import re
import unittest
from pathlib import Path

_HERE = Path(__file__).resolve().parent


def _load_axizero():
    spec = importlib.util.spec_from_file_location("axizero", _HERE / "axizero.py")
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


A = _load_axizero()

FULL = {"name": "T", "type": "full"}


def _validate(design):
    """Run the validator, returning the message it exits with (or None)."""
    err = io.StringIO()
    try:
        with contextlib.redirect_stderr(err):
            A._validate_design(design, 0)
    except SystemExit:
        return err.getvalue()
    return None


class RegSliceSkid(unittest.TestCase):
    """reg_slice_skid reaches MasterPort.regSliceSkid / SlavePort.regSliceSkid."""

    def test_absent_by_default(self):
        # A port that does not ask for it must generate what it generated
        # before the option existed -- no mention of the field at all.
        for port_type in ("lite", "full", "axi3"):
            m = {"type": port_type, "addr_width": 32, "data_width": 32, "reg_slice": True}
            self.assertNotIn("regSliceSkid", A._gen_master_port(m, FULL, 32), port_type)
        s = {"base": "0x0", "size": "0x1000", "data_width": 32, "reg_slice": True}
        self.assertNotIn("regSliceSkid", A._gen_slave_port(s, FULL, 32, 4))

    def test_emitted_on_every_master_flavour(self):
        for port_type in ("lite", "full", "axi3"):
            m = {
                "type": port_type, "addr_width": 32, "data_width": 32,
                "reg_slice": True, "reg_slice_skid": True,
            }
            out = A._gen_master_port(m, FULL, 32)
            self.assertIn("regSliceSkid = true", out, port_type)

    def test_emitted_on_slave(self):
        s = {
            "base": "0x0", "size": "0x1000", "data_width": 32,
            "reg_slice": True, "reg_slice_skid": True,
        }
        self.assertIn("regSliceSkid = true", A._gen_slave_port(s, FULL, 32, 4))

    def test_axi3_cfg_still_last(self):
        # axi3Cfg is the odd one out: it must stay after regSliceSkid so the
        # emitted argument order still matches the MasterPort case class.
        m = {
            "type": "axi3", "addr_width": 32, "data_width": 32,
            "reg_slice": True, "reg_slice_skid": True,
        }
        out = A._gen_master_port(m, FULL, 32)
        self.assertLess(out.index("regSliceSkid"), out.index("axi3Cfg"))

    def test_fields_stay_aligned(self):
        # The longer field name has to move the whole block, not sit out of
        # line with it.
        m = {"addr_width": 32, "data_width": 32, "reg_slice": True, "reg_slice_skid": True}
        # Top-level arguments only.  A nested Axi4Config brings its own lines
        # with their own indentation, and they are not part of this block's
        # alignment -- textwrap.dedent leaves them shallower, not deeper.
        eq = [
            line.index(" = ")
            for line in A._gen_master_port(m, FULL, 32).splitlines()
            if re.match(r"^ {4}[A-Za-z]\w* +=", line)
        ]
        self.assertEqual(len(eq), 4, f"expected 4 arguments, got {eq}")
        self.assertEqual(len(set(eq)), 1, f"= columns not aligned: {eq}")


class RegSliceSkidValidation(unittest.TestCase):

    def _design(self, master_extra=None, slave_extra=None):
        m = {"addr_width": 32, "data_width": 32}
        m.update(master_extra or {})
        s = {"base": "0x0", "size": "0x1000", "data_width": 32}
        s.update(slave_extra or {})
        return {"name": "T", "type": "full", "masters": [m], "slaves": [s]}

    def test_accepted_with_reg_slice(self):
        d = self._design({"reg_slice": True, "reg_slice_skid": True},
                         {"reg_slice": True, "reg_slice_skid": True})
        self.assertIsNone(_validate(d))

    def test_rejected_without_reg_slice(self):
        for where in ("master", "slave"):
            extra = {"reg_slice_skid": True}
            d = self._design(extra if where == "master" else None,
                             extra if where == "slave" else None)
            msg = _validate(d)
            self.assertIsNotNone(msg, where)
            self.assertIn("needs 'reg_slice: true'", msg)
            self.assertIn(where, msg)

    def test_rejected_when_not_a_bool(self):
        d = self._design({"reg_slice": True, "reg_slice_skid": "yes"})
        msg = _validate(d)
        self.assertIsNotNone(msg)
        self.assertIn("must be true or false", msg)


class AddressMapReach(unittest.TestCase):
    """A region no master can address is refused here, not at elaboration."""

    def _design(self, base, size, master_aw=32, extra_master=None):
        masters = [{"addr_width": master_aw, "data_width": 32}]
        if extra_master:
            masters.append(extra_master)
        return {
            "name": "T", "type": "full", "masters": masters,
            "slaves": [{"base": base, "size": size, "data_width": 32}],
        }

    def test_map_ending_at_the_top_is_allowed(self):
        # The bound is inclusive: a map reaching exactly 2**32 is legal, and is
        # the case that used to break the crossbar's decode.
        self.assertIsNone(_validate(self._design("0x80000000", "0x80000000")))

    def test_region_past_every_master_is_refused(self):
        msg = _validate(self._design("0x10000", "0x1000", master_aw=16))
        self.assertIsNotNone(msg)
        self.assertIn("master address space", msg)

    def test_widest_master_decides(self):
        # A slave above the narrow master but within the wide one is a
        # legitimate mixed-width map; the narrow master decodes it as a
        # constant rather than the config being wrong.
        d = self._design("0x10000", "0x1000", master_aw=16,
                         extra_master={"addr_width": 32, "data_width": 32})
        self.assertIsNone(_validate(d))


class SlaveOverlap(unittest.TestCase):
    """Two slaves on the same address decode one-hot with two bits set."""

    def _design(self, *regions):
        return {
            "name": "T", "type": "full",
            "masters": [{"addr_width": 32, "data_width": 32}],
            "slaves": [{"base": b, "size": z, "data_width": 32} for b, z in regions],
        }

    def test_disjoint_regions_are_fine(self):
        self.assertIsNone(_validate(
            self._design(("0x0", "0x1000"), ("0x1000", "0x1000"))))

    def test_identical_regions_are_refused(self):
        msg = _validate(self._design(("0x0", "0x1000"), ("0x0", "0x1000")))
        self.assertIsNotNone(msg)
        self.assertIn("overlaps with", msg)

    def test_a_region_nested_inside_another_is_refused(self):
        # 0x0000..0x2000 swallows 0x1000..0x1400 whole; neither endpoint of the
        # inner region is outside the outer one, so an endpoint-only compare
        # would let this through.
        msg = _validate(self._design(("0x0", "0x2000"), ("0x1000", "0x400")))
        self.assertIsNotNone(msg)
        self.assertIn("overlaps with", msg)

    def test_reg_slice_must_be_a_bool(self):
        d = self._design(("0x0", "0x1000"))
        d["masters"][0]["reg_slice"] = "yes"
        msg = _validate(d)
        self.assertIsNotNone(msg)
        self.assertIn("'reg_slice' must be true or false", msg)


class IdThreads(unittest.TestCase):
    """id_threads reaches AxiZeroConfig.idThreads, and only when it differs."""

    def _design(self, **extra):
        d = {
            "name": "T", "type": "full",
            "masters": [{"addr_width": 32, "data_width": 32, "id_width": 4}],
            "slaves": [{"base": "0x0", "size": "0x1000", "data_width": 32}],
        }
        d.update(extra)
        return d

    def test_default_is_not_emitted(self):
        # The Scala default is 2, so a design that does not ask must generate
        # exactly what it generated before the option existed.
        for d in (self._design(max_outstanding=4), self._design(max_outstanding=4, id_threads=2)):
            self.assertNotIn("idThreads", A._gen_design_block(d))

    def test_a_different_value_is_emitted(self):
        out = A._gen_design_block(self._design(max_outstanding=4, id_threads=1))
        self.assertIn("idThreads         = 1", out)

    def test_zero_is_refused(self):
        msg = _validate(self._design(id_threads=0))
        self.assertIsNotNone(msg)
        self.assertIn("'id_threads' must be a positive integer", msg)

    def test_a_non_integer_is_refused(self):
        msg = _validate(self._design(id_threads="two"))
        self.assertIsNotNone(msg)
        self.assertIn("'id_threads' must be a positive integer", msg)

    def test_a_boolean_is_refused(self):
        # bool is a subclass of int in Python, so a bare isinstance check lets
        # `id_threads: true` through and writes `idThreads = True` into the
        # generated Scala, which does not compile.
        for key in ("id_threads", "max_outstanding"):
            msg = _validate(self._design(**{key: True}))
            self.assertIsNotNone(msg, f"'{key}: true' was accepted")
            self.assertIn("must be a positive integer", msg)

    def test_a_boolean_port_width_is_refused(self):
        # Same hole, one level down: these widths go straight into the port
        # templates, so `data_width: true` emits `dataWidth = True`.
        for key in ("addr_width", "data_width", "id_width"):
            for kind in ("masters", "slaves"):
                d = self._design()
                d[kind][0][key] = True
                msg = _validate(d)
                self.assertIsNotNone(msg, f"{kind}[0].{key}: true was accepted")
                self.assertIn("must be a non-negative integer", msg)

    def test_a_boolean_weight_is_refused(self):
        d = self._design(arbitration="weighted_round_robin", weights=[True])
        msg = _validate(d)
        self.assertIsNotNone(msg, "weights: [true] was accepted")
        self.assertIn("must be a positive integer", msg)


class ExistingConfigsUnchanged(unittest.TestCase):
    """A config that does not use the option generates what it always did."""

    def test_example_yaml_has_no_skid(self):
        import yaml
        designs = yaml.safe_load((_HERE / "example.yaml").read_text(encoding="utf-8"))["designs"]
        self.assertNotIn("regSliceSkid", A.generate_scala(designs))

    def test_example_yaml_has_no_id_threads(self):
        import yaml
        designs = yaml.safe_load((_HERE / "example.yaml").read_text(encoding="utf-8"))["designs"]
        self.assertNotIn("idThreads", A.generate_scala(designs))


if __name__ == "__main__":
    unittest.main(verbosity=2)
