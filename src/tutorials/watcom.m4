divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title], [Crossdev with OpenWatcom])
define([iwz_section], [tutorials])
divert(0)include([header.m4])

iwz_sect([Introduction])

iwz_p([OpenWatcom may be underappreciated today, but it was the premier compiler of years past. Even now, it is still very useful as a compiler that can process relatively modern source code into executables for many 16-bit or otherwise discontinued platforms.])

iwz_p([This tutorial will cover the basics of setting up OpenWatcom under GNU/Linux and compiling a simple program for several platforms.])

iwz_sect([Setting Up])

iwz_p([For starters, you need the OpenWatcom compiler. This can be found at the iwz_a([https://www.openwatcom.org/],[OpenWatcom website]). You may also want iwz_a([http://groups.di.unipi.it/~nids/docs/watcom_glut_sdl.html],[SDL and GLUT for OpenWatcom]) and/or iwz_a([https://matejhorvat.si/en/dos/allegwat/index.htm], [Allegro 4 for OpenWatcom]), if you use those libraries.])

iwz_p([For convenience's sake, we have also added some custom-build OpenWatcom debian packages to iwz_a([https://codeberg.org/indigoparadox/-/packages?q=watcom&type=],[our Codeberg package repositories]). Please click on one of those and follow the instructions to install the apt keyring if you wish to use those. They may require adding i386 multilib support to your Debian installation.])

iwz_p([Once OpenWatcom is installed, you may note the directories under its installation path. Directories of particular interest include:])

binl
binw
binnt
lib286
lib386
h

iwz_sect([Basic Usage])

iwz_p([The watcom compiler is split into iwz_filename([wcc]) for 16-bit programs and iwz_filename([wcc386]) for 32-bit programs. Please note that most target operating systems supported by OpenWatcom can run either. For example: Windows 3.x can run 16-bit Windows programs, and DOS can run 32-bit programs that use a DOS extender.])

iwz_p([Once the individual code translation units are compiled, they can then be linked together with iwz_filename([wlink]). Some programs for Windows or OS/2 may with to use a resource file, to provide icons, localized strings, or other resources. This resource file must be compiled from a .rc as well, with iwz_filename([wrc]), before being included in the linking process. Writing .rc files is beyond the scope of this article, but many other resources on writing Windows resource files are available.])

iwz_p([The next section includes some examples for common target platforms, along with an explanation of how they work. These examples are in GNU make format, and assume iwz_var([$WATCOM]) is defined in your shell as the path to your OpenWatcom installation (e.g. iwz_filename([/opt/watcom])).])

iwz_sect([Makefiles])

iwz_p([Makefiles allow for multi-stage compiling of complicated programs, compiling only the pieces that have changed since the last time they were compiled. OpenWatcom comes with its own "wmake" utility for this, but if you only use it on Linux then you may be better off using GNU make, instead, as this has a more portable and modern syntax with more features.])

iwz_p([Again, these are just some common examples. You can find more information on building for other systems using the iwz_a([https://open-watcom.github.io/open-watcom-v2-wikidocs/lguide.html#The_SYSTEM_Directive],[OpenWatcom Linker User Guide]), the system linker blocks defined in iwz_filename([$WATCOM/binl/wlink.lnk]), and the command help viewable by running either iwz_filename([wcc]) or iwz_filename([wcc386]) with no arguments.])

iwz_subsect([Windows 3.x 16-bit])

iwz_p([Building for 16-bit Windows 3.x has a number of pitfalls, especially related to memory usage. These are beyond the scope of this article, but you may find the .map file generated with the "option map" option to be useful in finding globals to shift into other segments (e.g. with iwz_func([__based( __segname( "xxx" ) )])). The system type for Windows 3.x is "windows" and the header files are located in iwz_filename([$WATCOM/h/win]).])

iwz_diff(
   [Makefile.win16],
   iwz_diffl([],[],[# = Compile Invidiual Source Files =])
   iwz_diffl([],[],[# -zm and -ml should ease memory pressure a 16-bit Windows program will face.])
   iwz_diffl([],[],[# Also note that we chop the .c off of the filename[,] as wcc assumes the .c.])
   iwz_diffl([],[],[%.o: %.c])
   iwz_diffl([],[],[    wcc -zm -ml -bt=windows -i=$(WATCOM)/h -i=$(WATCOM)/h/win -fo="$@" "$(<:%.c=%)"])
   iwz_diffl([],[],[#])
   iwz_diffl([],[],[# = Compile Resource File =])
   iwz_diffl([],[],[resrc.res: resrc.rc])
   iwz_diffl([],[],[    wrc -r $< -bt=windows -fo=$@])
   iwz_diffl([],[],[#])
   iwz_diffl([],[],[# = Link Compiled Files =])
   iwz_diffl([],[],[# Use the | to make sure resrc.res is built[,] but not include it in $^.])
   iwz_diffl([],[],[# We can then pull in the resource file manually.])
   iwz_diffl([],[],[# Additionally[,] option map will generate a .map file to help debug segment usage.])
   iwz_diffl([],[],[program.exe: $(subst .c[,].o[,]$(C_FILES)) | resrc.res])
   iwz_diffl([],[],[    wlink name $@ option dosseg option map fil {$^} resource resrc.res])
)

iwz_subsect([Windows 3.x 32-bit])

iwz_p([This target is somewhat less common, but can be less frustrating to write and build if you wish to support Windows 3.x and know your program will only ever run on a 386 or newer. It is somewhat analogous to using a DOS extender, but for Windows programs. Win386 programs use a flat memory model, but do not require a separate runtime like Win32s. This alleviates a lot of issues with memory usage and segmentation. These use the same headers as Windows 3.x 16-bit programs, along with the "win386" system type..])

iwz_diff(
   [Makefile.win386],
   iwz_diffl([],[],[# = Compile Invidiual Source Files =])
   iwz_diffl([],[],[# -zm and -ml should ease memory pressure a 16-bit Windows program will face.])
   iwz_diffl([],[],[# Also note that we chop the .c off of the filename[,] as wcc assumes the .c.])
   iwz_diffl([],[],[%.o: %.c])
   iwz_diffl([],[],[    wcc -zm -ml -bt=windows -i=$(WATCOM)/h -i=$(WATCOM)/h/win -fo="$@" "$(<:%.c=%)"])
   iwz_diffl([],[],[#])
   iwz_diffl([],[],[# = Compile Intermediate File =])
   iwz_diffl([],[],[# The linker stage here is only an intermediate stage.])
   iwz_diffl([],[],[# It creates a .rex file which then must be bound with the built-in runtime to create a .exe file below.])
   iwz_diffl([],[],[program.rex: $(subst .c[,].o[,]$(C_FILES))])
   iwz_diffl([],[],[	wlink name $@ system win386 fil {$^}])
   iwz_diffl([],[],[#])
   iwz_diffl([],[],[# = Link Compiled Files =])
   iwz_diffl([],[],[# Note that binding the .exe file uses the .rc file directly. wrc is not used!])
   iwz_diffl([],[],[program.exe: program.rex])
	iwz_diffl([],[],[    wbind "$<" -s "$(WATCOM)/binw/win386.ext" -R resrc.rc "$@"])
)

iwz_subsect([Windows NT/9x 32-bit])

iwz_p([Building for Windows NT is slightly simpler, as you don' have to worry so much about the memory model and debugging segment usage, while also not having to tack a runtime onto the front of the program. Note that 32-bit Windows programs built this way can also run in Windows 9x (provided they only use API functions available in those operating systems). The system type for Windows NT is just "nt" and the header files are located in iwz_filename([$WATCOM/h/nt]).])

iwz_diff(
   [Makefile.winnt],
   iwz_diffl([],[],[# = Compile Invidiual Source Files =])
   iwz_diffl([],[],[# Note that we are using the 32-bit wcc[,] wcc386.])
   iwz_diffl([],[],[# Again[,] note that we chop the .c off of the filename[,] as wcc assumes the .c.])
   iwz_diffl([],[],[%.o: %.c])
   iwz_diffl([],[],[    wcc386 -bt=nt -i=$(WATCOM)/h -i=$(WATCOM)/h/nt -fo="$@" "$(<:%.c=%)"])
   iwz_diffl([],[],[#])
   iwz_diffl([],[],[# = Compile Resource File =])
   iwz_diffl([],[],[resrc.res: resrc.rc])
   iwz_diffl([],[],[    wrc -r $< -bt=nt -fo=$@])
   iwz_diffl([],[],[#])
   iwz_diffl([],[],[# = Link Compiled Files =])
   iwz_diffl([],[],[# Use the | to make sure resrc.res is built[,] but not include it in $^.])
   iwz_diffl([],[],[# We can then pull in the resource file manually.])
   iwz_diffl([],[],[program.exe: $(subst .c[,].o[,]$(C_FILES)) | resrc.res])
   iwz_diffl([],[],[    wlink name $@ fil {$^} resource resrc.res])
)

iwz_subsect([DOS 16-bit])

iwz_p([This target is very simple. It uses the bare headers in iwz_filename([$WATCOM/h]) and generates a map file for segment debugging. There are a number of DOS extenders you can use to write 32-bit DOS programs, but those are beyond the scope of this article (for now). You can find more information on them in the wlink user guide and linker block definition file iwz_filename([$WATCOM/binl/wlink.lnk]).])

iwz_diff(
   [Makefile.dos16],
   iwz_diffl([],[],[# = Compile Invidiual Source Files =])
   iwz_diffl([],[],[# Note that we just use the headers in $(WATCOM)/h.])
   iwz_diffl([],[],[# Again[,] note that we chop the .c off of the filename[,] as wcc assumes the .c.])
   iwz_diffl([],[],[%.o: %.c])
   iwz_diffl([],[],[    wcc -bt=dos -i=$(WATCOM)/h -fo="$@" "$(<:%.c=%)"])
   iwz_diffl([],[],[#])
   iwz_diffl([],[],[# = Link Compiled Files =])
   iwz_diffl([],[],[# Again[,] option map will generate a .map file to help debug segment usage.])
   iwz_diffl([],[],[program.exe: $(subst .c[,].o[,]$(C_FILES))])
   iwz_diffl([],[],[    wlink name $@ option dosseg option map fil {$^}])
)

iwz_sect([Conclusion])

iwz_p([Once again, we must emphasize that this is a quick and basic tutorial on getting up and running with OpenWatcom. OpenWatcom supports many more options, and even operating systems like RDOS or OS/2 which we have not covered here. Hopefully this is enough information to get you up and running for now, but please feel free to iwz_let_us_know if you have questions or suggestions for more details! Thanks for reading!])

include([footer.m4])
