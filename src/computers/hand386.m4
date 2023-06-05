divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title], [Hand386])
define([iwz_section], [computers])
divert(0)include([header.m4])

iwz_sect([Introduction])

iwz_p([The Hand386 is a weird little guy from China that was offered for a limited time on Ali Express. It uses (apparently) recycled industrial 386 SoCs and a purpose-build motherboard to create a portable, battery-powered retro gaming handheld device. We have experienced some quality issues so far, but we love a weird little guy and this little guy is rather weird, indeed!])

iwz_sect([Sound Chip])

iwz_p([The sound chip is an interesting case: it is a(n apparently) genuine OPL-3 chip. For most DOS games, this can be selected as Ad Lib music with no digital sound.])

iwz_p([That's right, there is no digital/PCM sound production in the traditional sense! The included Windows 95 only has a MIDI driver installed, with no mixer or PCM device.])

iwz_img(
   [/images/hand386/hand386-win95-mcid.jpg],
   [Windows 95 Multimedia devices list... there are no digital audio devices listed, only the OPL-3.])

iwz_p([However, the OPL-3 does have some tricks up its sleeve! Programs that know how to, can upload samples as MIDI instruments and play them as sound effects. The device includes a VGM player which plays VGM files using custom instruments, and Wolfenstein 3D, which uses this method to play sound effects and voices.])

iwz_sect([VESA Driver])

iwz_img(
   [/images/hand386/hand386-sc2k.jpg],
   [SimCity 2000 for DOS title screen displayed on a big monitor hooked up to the Hand386 over a messy desk. The screen is... not *too* dark...])

iwz_p([Some games may require a VESA driver. A VESA driver compatible with the built-in chipset is included as iwz_filename([C:\VESA.COM])! This works with e.g. SimCity 2000. (Thanks to iwz_a([https://bitbang.social/@polpo], [Ian Scott]) for pointing this out!)])

iwz_sect([ISA Bus])

iwz_p([There is an optional ISA bus module. So far, experimental results are as follows:])

iwz_img(
   [/images/hand386/hand386-isa-noser.jpg],
   [Closeup of Hand386 connected to ISA bus with no card inserted. Highlighted on the screen, the BIOS status is showing "Serial Port(s): None, Parallel Port(s): None"])

iwz_img(
   [/images/hand386/hand386-isa-ser.jpg],
   [Closeup of Hand386 connected to ISA bus with I/O card inserted. Highlighted on the screen, the BIOS status is showing "Serial Port(s): 3F8, Parallel Port(s): 378"])

iwz_p([The BIOS shows the serial and parallel ports from a multi-I/O card when it is installed. When the card is removed, the BIOS complains about an invalid floppy drive, until the floppy drive is disabled in BIOS setup.])

iwz_p([Attempting to boot with a 3Com 3c509 network card inserted simply does not work. It leads to a blue "VGA" screen on the internal display, indicating a failure to start booting. This invites further investigation with a port-80 card (TODO).])

iwz_sect([Defects])

iwz_suml([
   iwz_suml_item(
      [Shorted keyboard PS/2 port],
      [The external keyboard didn't work (and the internal keyboard stopped working!) when the included PS/2 and VGA dongle was plugged into the Hand386. This was found to be because of a solder short in the dongle, itself. Taking solder wick and rosin to soak the excess solder out of the PS/2 connections on the dongle seemed to fix this.])
])

iwz_sect([Startup Menu])

iwz_p([It is possible to use the menu feature built in to DOS 7 to create a startup menu, making the device somewhat easier/quicker to use. The startup files iwz_filename(CONFIG.SYS) and iwz_filename(AUTOEXEC.BAT) below demonstrate some examples (both included with the handheld and not). They are examples, but you should be able to pick up the general pattern to use them.])

iwz_subsect([CONFIG.SYS])

iwz_p([The menu items are defined in iwz_filename(CONFIG.SYS) by defining a iwz_var([[[MENU]]]) block. Each iwz_var([MENUITEM]) is a comma-separated pair, where the item to the left of the comma (e.g. iwz_var([DOSP]) in the first item below) defines the name of the block that will be called both in the rest of the iwz_filename([CONFIG.SYS]) and in the iwz_filename([AUTOEXEC.BAT]) below. The rest of the text after the comma is the name of the menu item (e.g. iwz_var([(OS) DOS Prompt]), in the same example item).])

iwz_diff([CONFIG.SYS], [
   iwz_diffl([], [1], [[[MENU]]])
   iwz_diffl([], [2], [MENUITEM=DOSP,(OS) DOS Prompt])
   iwz_diffl([], [3], [MENUITEM=WIN95,(OS) Windows 95])
   iwz_diffl([], [4], [MENUITEM=DOOM,(Game) DOOM])
   iwz_diffl([], [5], [MENUITEM=WOLF3D,(Game) Wolfenstein 3D])
   iwz_diffl([], [6], [MENUITEM=TYRIAN,(Game) Tyrian])
   iwz_diffl([], [7], [MENUITEM=SC2K,(Game) SimCity 2000])
   iwz_diffl([], [8], [MENUITEM=TIE,(Game) TIE Fighter])
   iwz_diffl([], [9], [ ])
   iwz_diffl([], [10], [[[DOSP]]])
   iwz_diffl([], [11], [DEVICE=C:\WINDOWS\HIMEM.SYS])
   iwz_diffl([], [12], [DEVICE=C:\WINDOWS\EMM386.EXE NOEMS])
   iwz_diffl([], [13], [DOS=HIGH,UMB,AUTO])
   iwz_diffl([], [14], [DEVICEHIGH=C:\WINDOWS\SETVER.EXE])
   iwz_diffl([], [15], [SHELL=C:\COMMAND.COM C:\ /P /E:640])
   iwz_diffl([], [16], [REM DEVICEHIGH=C:\DOS71\DISPLAY.SYS CON=(,,1)])
   iwz_diffl([], [17], [DEVICE=C:\CH375DOS.SYS @260 %2])
   iwz_diffl([], [18], [ ])
   iwz_diffl([], [19], [[[WIN95]]])
   iwz_diffl([], [20], [DEVICE=C:\WINDOWS\HIMEM.SYS])
   iwz_diffl([], [21], [DEVICE=C:\WINDOWS\EMM386.EXE NOEMS])
   iwz_diffl([], [22], [DOS=HIGH,UMB,AUTO])
   iwz_diffl([], [23], [DEVICEHIGH=C:\WINDOWS\SETVER.EXE])
   iwz_diffl([], [24], [SHELL=C:\COMMAND.COM C:\ /P /E:640])
   iwz_diffl([], [25], [DEVICE=C:\CH375DOS.SYS @260 %2])
   iwz_diffl([], [26], [ ])
   iwz_diffl([], [27], [[[DOOM]]])
   iwz_diffl([], [28], [DEVICE=C:\WINDOWS\HIMEM.SYS])
   iwz_diffl([], [29], [DEVICE=C:\WINDOWS\EMM386.EXE NOEMS])
   iwz_diffl([], [30], [ ])
   iwz_diffl([], [31], [[[WOLF3D]]])
   iwz_diffl([], [32], [DEVICE=C:\WINDOWS\HIMEM.SYS])
   iwz_diffl([], [33], [DEVICE=C:\WINDOWS\EMM386.EXE NOEMS])
   iwz_diffl([], [34], [ ])
   iwz_diffl([], [35], [[[TYRIAN]]])
   iwz_diffl([], [36], [DEVICE=C:\WINDOWS\HIMEM.SYS])
   iwz_diffl([], [37], [DEVICE=C:\WINDOWS\EMM386.EXE NOEMS])
   iwz_diffl([], [38], [ ])
   iwz_diffl([], [39], [[[SC2K]]])
   iwz_diffl([], [40], [DEVICE=C:\WINDOWS\HIMEM.SYS])
   iwz_diffl([], [41], [DEVICE=C:\WINDOWS\EMM386.EXE NOEMS])
   iwz_diffl([], [42], [ ])
   iwz_diffl([], [43], [[[TIE]]])
   iwz_diffl([], [44], [DEVICE=C:\WINDOWS\HIMEM.SYS])
   iwz_diffl([], [45], [DEVICE=C:\WINDOWS\EMM386.EXE 2048])
   iwz_diffl([], [46], [FILES=30])
])

iwz_p([If you are already familiar with this feature, you may note that we are not using a [[COMMON]] block, which would allow us to define some of the repeating items only once. This is so that we have control over the order in which they load (and in some items prevent their loading altogether!)])

iwz_subsect([AUTOEXEC.BAT])

iwz_p([This is fairly simple: just goto the label defined in iwz_var([%CONFIG%]), which is defined by the iwz_func([MENUITEM]) selected in iwz_filename([CONFIG.SYS]).])

iwz_diff([AUTOEXEC.BAT], [
   iwz_diffl([], [1], [@ECHO OFF])
   iwz_diffl([], [2], [PROMPT $P$G])
   iwz_diffl([], [3], [ ])
   iwz_diffl([], [4], [GOTO %CONFIG%])
   iwz_diffl([], [5], [ ])
   iwz_diffl([], [6], [:DOSP])
   iwz_diffl([], [7], [ECHO Now you are in MS-DOS 7.10 prompt. Type 'HELP' for help.])
   iwz_diffl([], [8], [ECHO.])
   iwz_diffl([], [9], [PATH=C:\DOS71;C:\DOS71\norton])
   iwz_diffl([], [10], [GOTO END])
   iwz_diffl([], [11], [ ])
   iwz_diffl([], [12], [:WIN95])
   iwz_diffl([], [13], [PATH=C:\WINDOWS;C:\WINDOWS\COMMAND;C:\DOS71;C:\DOS71\norton])
   iwz_diffl([], [14], [WIN])
   iwz_diffl([], [15], [GOTO END])
   iwz_diffl([], [16], [ ])
   iwz_diffl([], [17], [:DOOM])
   iwz_diffl([], [18], [CD GAME\DOOM])
   iwz_diffl([], [19], [DOOM])
   iwz_diffl([], [20], [GOTO END])
   iwz_diffl([], [21], [ ])
   iwz_diffl([], [22], [:WOLF3D])
   iwz_diffl([], [23], [CD GAME\WOLF3D])
   iwz_diffl([], [24], [WOLF3D])
   iwz_diffl([], [25], [GOTO END])
   iwz_diffl([], [26], [ ])
   iwz_diffl([], [27], [:TYRIAN])
   iwz_diffl([], [28], [CD GAME\TYRIAN])
   iwz_diffl([], [29], [TYRIAN])
   iwz_diffl([], [30], [GOTO END])
   iwz_diffl([], [31], [ ])
   iwz_diffl([], [32], [:SC2K])
   iwz_diffl([], [33], [C:\VESA.COM])
   iwz_diffl([], [34], [C:\CTMOUSE.EXE])
   iwz_diffl([], [35], [CD GAME\SC2000])
   iwz_diffl([], [36], [SC2000])
   iwz_diffl([], [37], [GOTO END])
   iwz_diffl([], [38], [ ])
   iwz_diffl([], [39], [:TIE])
   iwz_diffl([], [40], [CD GAME\TIE])
   iwz_diffl([], [41], [TIE])
   iwz_diffl([], [42], [GOTO END])
   iwz_diffl([], [43], [ ])
   iwz_diffl([], [44], [:END])
])

include([footer.m4])
