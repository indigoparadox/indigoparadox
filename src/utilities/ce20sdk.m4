divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title], [Windows CE 2 SDK])
define([iwz_section], [utilities])
divert(0)include([header.m4])

iwz_sect([Getting the Compiler])

iwz_p([As of this writing, the compilers are available in a bundle available at iwz_a([https://archive.org/details/wce-20-dev-20240825.tar], [The Internet Archive]). They have been extracted from various installers/disc images so that you don't have to. Please see the instructions for use below.])

iwz_sect([Creating a Makefile])

iwz_p([The examples below outline arguments to pass to the command-line compilers included in the Windows CE 2.0 SDK in the form of GNU Makefiles. The Makefiles call the compilers through wine, which should be installed beforehand.])

iwz_p([The examples assume a source code file called iwz_filename([example.c]) and a Windows resource file called iwz_filename([example.rc]) and they output an executable called iwz_filename([example.exe]).])

iwz_p([The examples also assume that you have extracted the tarball linked above and placed it somewhere (e.g. under iwz_filename([/opt])) and stored that location in the environment variable iwz_var([$WCE20DEV]) (e.g. iwz_func([export WCE20DEV=/opt/wce20dev])).])

iwz_p([While Makefiles may not be useful on their own, hopefully these will provide a rough outline as to how to use the compilers included in the SDK.])

iwz_subsect([Example for SH3])

iwz_p([This example demonstrates a basic Makefile for compiling a Windows CE 2.0 program for the SH3 CPU.])

iwz_diff(
   [Makefile.SH3], [
   iwz_diffl([], [1], [example.exe: obj/example.o obj/example.res])
   iwz_diffl([], [2], [	wine $(WCE20DEV)/BIN/LINK.EXE /LIBPATH:$(WCE20DEV)/LIB/wce200/HPC/wcesh/ /machine:SH3 $^ /OUT:$@])
   iwz_diffl([], [3], [])
   iwz_diffl([], [4], [obj/%.o: %.c])
   iwz_diffl([], [5], [	wine $(WCE20DEV)/BIN/SHCL.EXE /D "SH3" /D "_SH3_" /c /Fo$@ $<])
   iwz_diffl([], [6], [])
   iwz_diffl([], [7], [obj/%.res: %.rc])
   iwz_diffl([], [8], [	wine $(WCE20DEV)/BIN/RC.EXE /l 0x409 /r /d "SH3" /d "_SH3_" /d "_WIN32_WCE" /d "UNICODE" /fo $@ $<])
])

iwz_subsect([Example for MIPS])

iwz_block_construction

include([footer.m4])

