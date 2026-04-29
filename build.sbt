// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
ThisBuild / version      := "0.1.0"
ThisBuild / scalaVersion := "2.13.12"
ThisBuild / organization := "io.axizero"
ThisBuild / semanticdbEnabled := true
ThisBuild / semanticdbVersion := scalafixSemanticdb.revision

val spinalVersion = "1.10.1"

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

// Run: sbt -Dcoverage=true coverageTest
// (coverage=true must be set at JVM startup so scalacOptions are evaluated correctly)
addCommandAlias("coverageTest", "test; coverageReport")
