## Linux Computer CPU Temperature Display (systemp)
##
## SOURCE FILE: help.nim
##
## Created by Simon Rowe <simon@wiremoons.com> on 26 Apr 2020
## Source code available from GitHub: https://github.com/wiremoons/systemp.git
## 
## Small utliity to display a Linix computers CPU temperature called: 'systemp'
##
## MIT License
## Copyright (c) 2020 Simon Rowe
##

import strformat, os

proc showHelp*() =
  ##
  ## PROCEDURE: showHelp
  ## Input: none required
  ## Returns: outputs help information to the display then quits the program
  ## Description: display command line help information requested by the user
  ##
  let appName = extractFilename(getAppFilename())
  echo fmt"""
Purpose
¯¯¯¯¯¯¯
 Use the '{appName}' application to display the current CPU
 temperature of the Linux computer it is run on.

Usage
¯¯¯¯¯
Run '{appName}' with:

    Flag                 Description                       Default Value
    ¯¯¯¯                 ¯¯¯¯¯¯¯¯¯¯¯                       ¯¯¯¯¯¯¯¯¯¯¯¯¯
    -h | --help          display help information          false
    -v | --version       display program version           false
"""
  quit 0
