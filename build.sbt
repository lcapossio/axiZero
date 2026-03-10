// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
ThisBuild / version      := "0.1.0"
ThisBuild / scalaVersion := "2.13.12"
ThisBuild / organization := "io.axizero"

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
    fork := true
  )
