// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
ThisBuild / version      := "0.1.0"
ThisBuild / scalaVersion := "2.13.12"
ThisBuild / organization := "io.axizero"

// Publication metadata. Every publish target wants these and Maven Central
// rejects a POM without them; setting them here commits to no destination and
// needs no credentials, so `publishLocal` and a future release agree on what
// the artifact says about itself.
ThisBuild / description :=
  "Configurable AXI4 / AXI4-Lite / AXI3 interconnect generator, with AXI4-Stream utility cores, in SpinalHDL"
ThisBuild / homepage := Some(url("https://github.com/lcapossio/axiZero"))
ThisBuild / licenses := Seq("MIT" -> url("https://opensource.org/licenses/MIT"))
ThisBuild / scmInfo := Some(
  ScmInfo(
    url("https://github.com/lcapossio/axiZero"),
    "scm:git:https://github.com/lcapossio/axiZero.git"
  )
)
ThisBuild / developers := List(
  Developer(
    id = "lcapossio",
    name = "Leonardo Capossio",
    email = "hello@bard0.com",
    url = url("https://github.com/lcapossio")
  )
)
ThisBuild / semanticdbEnabled := true
ThisBuild / semanticdbVersion := scalafixSemanticdb.revision

val spinalVersion = "1.14.2"

lazy val root = project
  .in(file("."))
  .settings(
    name := "axiZero",
    libraryDependencies ++= Seq(
      "com.github.spinalhdl" %% "spinalhdl-core" % spinalVersion,
      "com.github.spinalhdl" %% "spinalhdl-lib"  % spinalVersion,
      compilerPlugin("com.github.spinalhdl" %% "spinalhdl-idsl-plugin" % spinalVersion),
      "com.github.spinalhdl" %% "spinalhdl-sim"  % spinalVersion % Test,
      "org.scalatest"        %% "scalatest"       % "3.2.17"     % Test
    ),
    Compile / scalaSource := baseDirectory.value / "hw" / "spinal",
    Test    / scalaSource := baseDirectory.value / "hw" / "sim",
    fork := true,
    // Always pass coverageDataDir to the forked test JVM.
    // scoverage-runtime writes measurements there when instrumentation is active;
    // when coverage is disabled the property is ignored at runtime.
    Test / javaOptions += s"-Dscoverage_data_dir=${(Test / coverageDataDir).value.getAbsolutePath}",
    // Enable via: sbt -Dcoverage=true ...
    // The scalac plugin must be active at project load time; runtime session overrides
    // (the `coverage` command) don't re-evaluate scalacOptions.
    coverageEnabled          := sys.props.getOrElse("coverage", "false") == "true",
    coverageHighlighting     := true,
    coverageOutputCobertura  := false,
    coverageOutputHTML       := true,
    coverageOutputXML        := false
  )

// ---------------------------------------------------------------------------
// vexZero — VexRiscv example SoC (optional)
//
// Needs the pinned VexRiscv submodule:
//   git submodule update --init third_party/VexRiscv
//
// `root` neither depends on nor aggregates this project, so a checkout without
// the submodule compiles, tests, formats and lints exactly as before. Build it
// explicitly:
//   sbt vexZero/test
//   sbt "vexZero/runMain vexzero.gen.VexZeroSocGen"
//
// VexRiscv is compiled from source here rather than pulled from Maven Central
// (it publishes no artifact) and with this build's Scala / SpinalHDL versions
// rather than its own, so the two halves of the SoC share one classpath.
// ---------------------------------------------------------------------------
lazy val vexRiscvSource = settingKey[File]("VexRiscv submodule Scala sources")
lazy val checkVexRiscv  = taskKey[Unit]("Fail with a usable message if the submodule is missing")

lazy val vexZero = project
  .in(file("hw/examples/vexriscv"))
  .dependsOn(root)
  .settings(
    name := "vexZero",
    libraryDependencies ++= Seq(
      "com.github.spinalhdl" %% "spinalhdl-core" % spinalVersion,
      "com.github.spinalhdl" %% "spinalhdl-lib"  % spinalVersion,
      compilerPlugin("com.github.spinalhdl" %% "spinalhdl-idsl-plugin" % spinalVersion),
      "com.github.spinalhdl" %% "spinalhdl-sim"  % spinalVersion % Test,
      "org.scalatest"        %% "scalatest"      % "3.2.17"      % Test,
      // vexriscv.plugin.YamlPlugin — part of the sources compiled below.
      "org.yaml"             %  "snakeyaml"      % "1.8"
    ),
    vexRiscvSource := (ThisBuild / baseDirectory).value /
      "third_party" / "VexRiscv" / "src" / "main" / "scala",
    checkVexRiscv := {
      val dir = vexRiscvSource.value
      if (!dir.isDirectory)
        sys.error(
          s"VexRiscv sources not found at $dir\n" +
            "Run: git submodule update --init third_party/VexRiscv"
        )
    },
    Compile / compile := (Compile / compile).dependsOn(checkVexRiscv).value,
    Compile / unmanagedSourceDirectories :=
      Seq(baseDirectory.value / "spinal", vexRiscvSource.value),
    Test / unmanagedSourceDirectories := Seq(baseDirectory.value / "sim"),
    coverageEnabled := false,
    fork            := true,
    // Forked JVMs default to this project's base directory. Run them from the
    // repository root instead, so generator output and simWorkspace land in the
    // same places the root project uses.
    Compile / run / baseDirectory := (ThisBuild / baseDirectory).value,
    Test / baseDirectory          := (ThisBuild / baseDirectory).value
  )

// Run: sbt -Dcoverage=true coverageTest
// (coverage=true must be set at JVM startup so scalacOptions are evaluated correctly)
addCommandAlias("coverageTest", "test; coverageReport")
