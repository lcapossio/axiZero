# Contributing to axiZero

Thank you for your interest in contributing! Bug reports, feature requests, and pull requests are all welcome.

## Getting started

1. Fork the repository and create a branch from `main`.
2. Follow the build instructions in the README to set up the toolchain (Java 21+, sbt, Verilator 5.x).
3. Run the test suite before and after your change:
   ```bash
   sbt test
   ```
   All 85 SpinalSim tests must pass.  Also run the cocotb suite:
   ```bash
   python3 sim/cocotb_gen/run_all.py
   ```
   All 27 cocotb tests must pass.

## Pull request guidelines

- Keep PRs focused — one logical change per PR.
- Add or update simulation tests in `hw/sim/axizero/sim/` if your change affects RTL behaviour.
- Update `CHANGELOG.md` with a brief description under `## Unreleased`.
- Regenerate any affected pre-built Verilog in `generated/` using `python scripts/axizero.py generate`.

## Reporting bugs

Please open a GitHub issue and include:
- A minimal YAML config or Scala snippet that reproduces the problem.
- The generated Verilog (or a link to it) if it looks wrong.
- Simulator / tool versions.

## License

By submitting a pull request you agree that your contribution will be licensed under the [MIT License](LICENSE).
