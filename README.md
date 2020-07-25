[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/hyperium/hyper/master/LICENSE) ![systemp](https://github.com/wiremoons/systemp/workflows/systemp/badge.svg?branch=master) 

# systemp

A command line (CLI) utility program to display a Linux computers CPU 
temperature called: 'systemp'.

The program is written in [Nim](https://nim-lang.org/).

The program currently only works on Linux based systems as it uses the `/proc` 
file system to obtain the current CPU temperature.


## Programs Purpose

The program was written to check up on the current temperature of a couple of 
Raspberry Pi 4B computers. 

I already had a similar tool written in C called [rpi-temp](https://github.com/wiremoons/rpi-temp). 
This however only works with the Raspbian version of Linux, so did not work 
when running the my Raspberry Pi on Ubuntu 64bit ARM Linux instead. So I 
re-created a tool that worked with any Debian based Linux, such as Debian, 
Ubuntu, and Raspbian. It also works with other non Raspberry Pi computer too. 


## Using the Program

When run, the command outputs the following information, the details of which 
will vary depnding on the computers archticture. Below is the output from a 
Raspberry Pi 4B:
```
'pi4server' Linux 4.19.97-v7l+ (ARM 4 cores) @ Wed 06 May 2020 20:46:14
CPU => 33.1 °C 
```

Output is similar when run from Ubuntu 20.04 Linux running on a Microsoft Surface:

```
'surfacemoons' Linux 5.4.0-29-generic (AMD64 8 cores) @ Wed 06 May 2020 20:44:56
CPU => 26.8 °C
```

The tool is often used with `ssh` to cycle through the different computers and 
output each of their current CPU temperatures to screen. This is done by first 
create a bash alias, and saving it in the `~/.bash_aliases` file. The alias I 
use is below:

```bash
alias alltemps='ssh -q simon@pi4server.local ~/GenIsys-Pi4/assets/systemp && ssh -q simon@pi4moons.local ~/GenIsys-Pi4/assets/systemp && ssh -q simon@pi4mobi.local ~/GenIsys-Pi4/assets/systemp'
```

When the above bash alias is run with the command `alltemps` the output is 
as follows:

```
'pi4server' Linux 4.19.97-v7l+ (ARM 4 cores) @ Wed 06 May 2020 20:46:14
CPU => 33.1 °C 
'pi4moons' Linux 4.19.97-v7l+ (ARM 4 cores) @ Wed 06 May 2020 20:46:15
CPU => 32.1 °C 
'pi4mobi' Linux 4.19.97-v7l+ (ARM 4 cores) @ Wed 06 May 2020 20:46:16
CPU => 32.6 °C 
```

The tool also has a brief help output obtained with the command: `systemp -h` or `systemp --help`:

```
Purpose
¯¯¯¯¯¯¯
 Use the 'systemp' application to display the current CPU
  temperature of the Linux computer it is run on.

  Usage
  ¯¯¯¯¯
  Run 'systemp' with:

  Flag                 Description                       Default Value
  ¯¯¯¯                 ¯¯¯¯¯¯¯¯¯¯¯                       ¯¯¯¯¯¯¯¯¯¯¯¯¯
  -h | --help          display help information          false
  -v | --version       display program version           false
```

As indicated by the above help screen output, the version information for the 
program can also be checked with the command: `systemp -v` or `systemp --version`:

```
'systemp' is version: '1.0.3' running on 'Linux (ARM64)' (arm64).
Compiled on: 2020-07-24 @ 21:16:09 UTC.
Copyright (c) 2020 Simon Rowe.

Built as 'release' using Nim compiler version: '1.2.4'.

For licenses and further information visit:
   - systemp application     :  https://github.com/wiremoons/systemp/
   - Nim language & compiler :  https://github.com/nim-lang/Nim/

All is well.
```

## Building 'systemp'

Nim supports many operating systems and hardware platforms, but this particular 
program will only work on a Linux based system as it uses the `/proc` file 
system to obtain the current CPU temperature.

To build 'systemp' from source on a Linux based system, the following steps 
can be used:

1. Install the Nim compiler and a C compiler such as gcc or CLang. More 
information on installing Nim can be found here: [Nim Download](https://nim-lang.org/install.html).
2. Once Nim is installed on your system, you can clone this GitHub repo with 
the command: `git clone https://github.com/wiremoons/systemp.git`
3. Then in the cloned code directory for `systemp` use Nimble to build a 
release version with the command: `nimble release`. Other Nimble build commands 
can be seen by runing: `nimble tasks`.
4. The compiled binary of `systemp` can now be found in the `./bin` sub 
directory. Just copy it somewhere in you path, and it should work when run.

## License

The application is provided under the MIT open source license. A copy of the 
MIT license file is [here](./LICENSE).

