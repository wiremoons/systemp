# Package

version       = "1.0.1"
author        = "Simon Rowe"
description   = "Utility to display a Linux computers CPU temperature."
license       = "MIT"
srcDir        = "src"
bin           = @["systemp"]
binDir        = "bin"

# Dependencies
requires "nim >= 1.2.0"

# Tasks

# builds a 'release' optmised version
task release, "Builds a release version":
  echo("\nRelease Build...\n")
  exec("nimble build -d:release --passC:-march=native")

# builds a 'debug' version
task debug, "Builds a debug version":
  echo("\nDebug Build\n")
  exec("nimble build -d:debug --lineDir:on --debuginfo --debugger:native")

# pre runner for 'exec' to first carry out a 'debug' build
before exec:
  exec("nimble debug")

# runs the 'debug' version
task exec, "Builds and runs a debug version":
  echo("\nDebug Run\n")
  exec("./bin/systemp")
