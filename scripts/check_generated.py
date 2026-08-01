#!/usr/bin/env python3
# Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT
"""check_generated.py — verify tracked netlists match what the generators emit.

Run the generators first, then this script.  It compares every tracked file
under ``generated/`` against the version committed in ``HEAD`` and fails if any
of them drifted, which means the checked-in netlist no longer matches the
generator that is supposed to produce it.

Why not a plain ``git diff --exit-code``: SpinalHDL stamps the *project's* git
commit into every netlist header::

    // Generator : SpinalHDL v1.14.2    git head : 78f29dc...
    // Git hash  : 31d5695b79e4859fbfe51a570cafa927c2b8908e

That ``Git hash`` line changes on every commit whether or not the RTL did, so a
raw diff would fail permanently and teach everyone to ignore it.  It is the one
line normalised away.  The ``Generator`` line is deliberately *not* normalised:
when the SpinalHDL version moves, the tracked netlists genuinely are stale and
the check should say so.
"""

import subprocess
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[1]
GENERATED = "generated"

VOLATILE_PREFIX = "// Git hash"


def normalise(text: str) -> list[str]:
    """Drop the per-commit hash line so only real RTL changes compare."""
    return [ln for ln in text.splitlines() if not ln.startswith(VOLATILE_PREFIX)]


def git(*args: str) -> subprocess.CompletedProcess:
    return subprocess.run(
        ["git", *args],
        cwd=REPO_ROOT,
        capture_output=True,
        text=True,
    )


def tracked_netlists() -> list[str]:
    out = git("ls-files", f"{GENERATED}/*.v")
    if out.returncode != 0:
        print(f"ERROR: git ls-files failed: {out.stderr.strip()}", file=sys.stderr)
        sys.exit(2)
    return out.stdout.split()


def main() -> int:
    files = tracked_netlists()
    if not files:
        print("ERROR: no tracked netlists found under generated/", file=sys.stderr)
        return 2

    stale, missing = [], []
    for path in files:
        committed = git("show", f"HEAD:{path}")
        if committed.returncode != 0:
            missing.append(path)
            continue
        on_disk = REPO_ROOT / path
        if not on_disk.is_file():
            missing.append(path)
            continue
        if normalise(committed.stdout) != normalise(on_disk.read_text(encoding="utf-8")):
            stale.append(path)

    for path in missing:
        print(f"  MISSING  {path}")
    for path in stale:
        print(f"  STALE    {path}")

    if stale or missing:
        print(
            f"\n{len(stale) + len(missing)} of {len(files)} tracked netlists do not "
            "match the generators.\n"
            "Regenerate and commit:\n"
            "  python3 scripts/axizero.py generate scripts/example.yaml "
            "--output generated\n"
            '  sbt "runMain axizero.gen.AxiZeroGen"',
            file=sys.stderr,
        )
        return 1

    print(f"All {len(files)} tracked netlists match the generators.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
