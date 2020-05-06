## Linux Computer CPU Temperature Display (systemp)
##
## SOURCE FILE: version.nim
##
## Created by Simon Rowe <simon@wiremoons.com> on 26 Apr 2020
## Source code available from GitHub: https://github.com/wiremoons/systemp.git
## 
## Small utliity to display a Linix computers CPU temperature called: 'systemp'
##
## MIT License
## Copyright (c) 2020 Simon Rowe
##
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to
# deal in the Software without restriction, including without limitation the
# rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
# sell copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
# IN THE SOFTWARE.
#

import strformat, os

proc showVersion*() =
  ##
  ## PROCEDURE: showVersion
  ## Input: none required
  ## Returns: outputs version information for the application and quits program
  ## Description: display the app version, build kind, build date, compiler
  ## version, plus license information sources.
  ##
  const ver = when defined(release): "release" else: "debug"
  const buildV = fmt"Build is: {ver} using Nim compiler version: {NimVersion}"
  const NimblePkgVersion {.strdefine.} = "Unknown"
  let appName = extractFilename(getAppFilename())

  echo fmt"""

'{appName}' is version: '{NimblePkgVersion}' running on '{hostOS}' ({hostCPU}).
Copyright (c) 2020 Simon Rowe.

Compiled on: {CompileDate} @ {CompileTime} UTC.
{buildV}.

For licenses and further information visit:
   - systemp application     :  https://github.com/wiremoons/systemp/
   - Nim language & compiler :  https://github.com/nim-lang/Nim/

All is well.
"""
  quit 0
