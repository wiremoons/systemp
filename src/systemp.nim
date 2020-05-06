## Linux Computer CPU Temperature Display (systemp)
##
## SOURCE FILE: systemp.nim
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

# import Nim modules
import cpuinfo, strformat, os, strutils, times, nativesockets
# import local app modules
import dbgUtils, version, help

debug "application runing..."

# check to make sure the app is being run on Linux
debug "checking the program is running on Linux OS"
when not defined(linux):
  debug "program NOT running on Linux OS - aborting"
  echo "ERROR: This program requires the Linux OS to run"
  quit -2
debug "Linux OS detected... continuing run"

let args = commandLineParams()

# check if the user wanted any command line options
if paramCount() > 0:
  case args[0]
  of "-h", "--help":
    debug "proc 'showHelp() executing"
    showHelp()
  of "-v", "--version":
    debug "proc 'showVersion() executing"
    showVersion()
  else:
    echo "\nERROR: Unknown command line parameter given - see options below:\n"
    showHelp()


# Example outputs for reference :
#'pi4server' Linux rel 4.19.97-v7l+ (armv7l) @ Sun Apr 26 14:04:13 2020
#CPU => 41.00 °C
#
#'surfacemoons' Linux 5.4.0-26-generic (AMD64 8 cores) @ 2020-04-26 19:40:35
#CPU => 41.00 °C


# get processor count and CPU type:
let hostProc = 
  if countProcessors() > 0 :
    debug "identified processor cores"
    fmt"({toUpper(hostCPU)} {countProcessors()} cores)"
  else:
    debug "no processor cores found"
    fmt"({toUpper(hostCPU)})"

# get OS name and capitilise it
let osName = capitalizeAscii(hostOS)

# current day, date, and time locally
let curDT = now().format("ddd dd MMM yyyy HH:mm:ss")

# get the computers hostname 
var hostName : string = ""
try:
  debug "calling: 'getHostName()'"
  hostName = getHostname()
except:
  debug "exception when calling: 'getHostName()'"
  let
    e = getCurrentException()
    msg = getCurrentExceptionMsg()
  write(stderr,fmt"\nERROR: Exception when requesting hostname: '{repr(e)}' with message: '{msg}'\n")

# get the operating system version
# 1. /proc/sys/kernel/osrelease
let osRel = 
  if fileExists("/proc/sys/kernel/osrelease"):
    debug "reading from: '/proc/sys/kernel/osrelease'"
    readFile("/proc/sys/kernel/osrelease").strip()
  else:
    ""

# get the system temperature
# 1. /sys/class/thermal/thermal_zone0/temp
let sysTemp : float = 
  if fileExists("/sys/class/thermal/thermal_zone0/temp"):
    debug "reading from: '/sys/class/thermal/thermal_zone0/temp'"
    parseInt(readFile("/sys/class/thermal/thermal_zone0/temp").strip()) / 1000
  else:
    0

# output the information collected to the screen
echo fmt"""'{hostName}' {osName} {osRel} {hostProc} @ {curDT}
CPU => {sysTemp:3.1f} °C """

# program ends
quit 0
