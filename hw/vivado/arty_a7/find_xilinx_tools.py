#!/usr/bin/env python3
# Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
"""
find_xilinx_tools.py - Auto-detect Vivado, xsdb, and mb-gcc across platforms.

Searches PATH first, then common AMD/Xilinx install locations on Windows and
Linux. All three HW test runners (run_wrr_test, run_qos_test,
run_qos_stress_test) import from here instead of hardcoding paths.

Usage from a sibling script::

    from find_xilinx_tools import find_vivado, find_xsdb, find_mbgcc
"""

import os
import platform
import re
from pathlib import Path

_IS_WIN = platform.system() == "Windows"

# Common AMD / Xilinx install roots (newest versions tend to be picked first).
_SEARCH_ROOTS = [
    Path("C:/AMDDesignTools"),       # AMD unified installer (2024+)
    Path("C:/Xilinx"),               # Legacy Xilinx installer
    Path("/tools/Xilinx"),           # Linux convention
    Path("/opt/Xilinx"),             # Linux convention
]


def _exe_names(base: str) -> list[str]:
    """Return candidate executable names for *base* (e.g. 'vivado')."""
    if _IS_WIN:
        return [f"{base}.bat", f"{base}.exe", base]
    return [base]


def _search_path(names: list[str]) -> Path | None:
    """Search the system PATH for any of *names*."""
    for dir_ in os.environ.get("PATH", "").split(os.pathsep):
        for exe in names:
            candidate = Path(dir_) / exe
            if candidate.is_file():
                return candidate
    return None


def _version_dirs() -> list[Path]:
    """Return version directories (e.g. ``2025.2``) sorted newest-first."""
    dirs: list[Path] = []
    for root in _SEARCH_ROOTS:
        if not root.is_dir():
            continue
        for child in root.iterdir():
            if child.is_dir() and re.match(r"\d{4}\.\d", child.name):
                dirs.append(child)
    dirs.sort(key=lambda p: p.name, reverse=True)
    return dirs


# ── Public API ───────────────────────────────────────────────────────────────

def find_vivado() -> Path | None:
    """Return the path to ``vivado(.bat)`` or *None*."""
    names = _exe_names("vivado")
    hit = _search_path(names)
    if hit:
        return hit
    for vdir in _version_dirs():
        for sub in (vdir / "Vivado" / "bin", vdir / "bin"):
            for exe in names:
                c = sub / exe
                if c.is_file():
                    return c
    return None


def find_xsdb() -> Path | None:
    """Return the path to ``xsdb(.bat)`` or *None*."""
    names = _exe_names("xsdb")
    hit = _search_path(names)
    if hit:
        return hit
    for vdir in _version_dirs():
        for sub in (vdir / "Vitis" / "bin", vdir / "bin"):
            for exe in names:
                c = sub / exe
                if c.is_file():
                    return c
    return None


def find_mbgcc() -> Path | None:
    """Return the path to ``mb-gcc(.exe)`` or *None*."""
    names = _exe_names("mb-gcc")
    hit = _search_path(names)
    if hit:
        return hit
    # mb-gcc lives under Vitis/gnu/microblaze/<platform>/bin/
    plat_dirs = ["nt", "lin64", "lin"] if _IS_WIN else ["lin64", "lin", "nt"]
    for vdir in _version_dirs():
        for plat in plat_dirs:
            for exe in names:
                c = vdir / "Vitis" / "gnu" / "microblaze" / plat / "bin" / exe
                if c.is_file():
                    return c
    return None


def _env_override(env_var: str, finder):
    """Use *env_var* if set, otherwise call *finder*."""
    val = os.environ.get(env_var)
    if val:
        p = Path(val)
        if p.is_file():
            return p
    return finder()


def require_tools() -> tuple[Path, Path, Path]:
    """Find all three tools or exit with an error message.

    Honours ``VIVADO_BIN``, ``XSDB_BIN``, ``MBGCC_BIN`` env vars as
    overrides.  Returns ``(vivado, xsdb, mbgcc)`` paths.
    """
    vivado = _env_override("VIVADO_BIN", find_vivado)
    xsdb = _env_override("XSDB_BIN", find_xsdb)
    mbgcc = _env_override("MBGCC_BIN", find_mbgcc)
    missing = []
    if not vivado:
        missing.append("vivado")
    if not xsdb:
        missing.append("xsdb")
    if not mbgcc:
        missing.append("mb-gcc")
    if missing:
        print(f"*** Could not find: {', '.join(missing)}")
        print("    Searched PATH and common AMD/Xilinx install locations.")
        print("    Set VIVADO_BIN / XSDB_BIN / MBGCC_BIN env vars to override.")
        raise SystemExit(1)
    return vivado, xsdb, mbgcc


if __name__ == "__main__":
    v, x, m = require_tools()
    print(f"vivado: {v}")
    print(f"xsdb:   {x}")
    print(f"mb-gcc: {m}")
