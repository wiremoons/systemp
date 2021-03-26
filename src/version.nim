## Linux Computer CPU Temperature Display (systemp)
##
## SOURCE FILE: version.nim
##
## Created by Simon Rowe <simon@wiremoons.com> on 26 Apr 2020
## Source code available from GitHub: https://github.com/wiremoons/systemp.git
## 
## Small utility to display a Linux computers CPU temperature called: 'systemp'
##
## MIT License
## Copyright (c) 2020 Simon Rowe
##

import strformat, os, strutils

proc showVersion*() =
  ##
  ## PROCEDURE: showVersion
  ## Input: none required
  ## Returns: outputs version information for the application and quits program
  ## Description: display the app version, build kind, build date, compiler
  ## version, plus license information sources, and sources repos.
  ##
  const ver = when defined(release): "release" else: "debug"
  const buildV = fmt"Built as '{ver}' using Nim compiler version: '{NimVersion}'"
  const NimblePkgVersion {.strdefine.} = "Unknown"
  let appName = extractFilename(getAppFilename())
  let hostData = fmt"{capitalizeAscii(hostOS)} ({toUpperAscii(hostCPU)})"

  echo fmt"""

'{appName}' is version: '{NimblePkgVersion}' running on '{hostData}' ({hostCPU}).
Compiled on: {CompileDate} @ {CompileTime} UTC.
Copyright (c) 2020 Simon Rowe.

{buildV}.

For licenses and further information visit:
   - systemp application     :  https://github.com/wiremoons/systemp/
   - Nim language & compiler :  https://github.com/nim-lang/Nim/

All is well.
"""
  quit 0

# Allow module to be run standalone for tests
when isMainModule:
  showVersion()
