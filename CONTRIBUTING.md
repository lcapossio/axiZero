# Contributing to axiZero

Thank you for your interest in contributing! Bug reports, feature requests, and pull requests are all welcome.

## Getting started

1. Fork the repository and create a branch from `main`.
2. Follow the build instructions in the README to set up the toolchain (Java 21+, sbt, Verilator 5.x).
3. Run the test suite before and after your change:
   ```bash
   sbt test              # the crossbar, adapters and stream cores
   sbt vexZero/test      # the VexRiscv example SoC
   python3 sim/cocotb_gen/run_all.py   # the generated Verilog
   python3 scripts/test_axizero.py     # the YAML generator
   ```
   Every test must pass. The counts are in the README; a change that adds tests should
   update them there.
4. Format before you push — CI checks it, for main and test sources alike:
   ```bash
   sbt scalafmtAll Test/scalafmtAll vexZero/scalafmtAll vexZero/Test/scalafmtAll
   ```
5. If your change touches the RTL or the generator, regenerate the pre-built Verilog and
   confirm nothing else moved:
   ```bash
   python3 scripts/axizero.py generate scripts/example.yaml --output generated
   python3 scripts/check_generated.py
   ```

## Pull request guidelines

- Keep PRs focused — one logical change per PR.
- Add or update simulation tests in `hw/sim/axizero/sim/` if your change affects RTL behaviour.
- Update `CHANGELOG.md` with a brief description under `## Unreleased`.

## Reporting bugs

Please open a GitHub issue and include:
- A minimal YAML config or Scala snippet that reproduces the problem.
- The generated Verilog (or a link to it) if it looks wrong.
- Simulator / tool versions.

## License

By submitting a pull request you agree that your contribution will be licensed under the [MIT License](LICENSE).
