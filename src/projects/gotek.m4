divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title], [Gotek Floppy Mods])
define([iwz_section], [projects])
divert(0)include([header.m4])

iwz_sect([Introduction])

iwz_p([The iwz_a_amazon([https://www.amazon.com/dp/B088ZT7J7G], [GoTek USB floppy emulator]) is a device that allows one to connect floppy disk images stored on a USB stick to a physical IBM PC floppy disk interface. This is a device we use ubiquitously in our retrocomputing pursuits, and this page is a record of the modifications and procedures we use in conjunction with the custom iwz_a_repo([flashfloppy], [keirf], [flashfloppy]) firmware on this device.])

iwz_sect([Hardware Modification])

iwz_p([Most of these modifications are taken from the iwz_a([https://github.com/keirf/FlashFloppy/wiki/Hardware-Mods], [FlashFloppy Wiki]), though the information has been condensed based on a "standard" build that we do for every Gotek that we use.])

iwz_p([The information here applies to the current revision of the Gotek floppy emulator as of this writing, using the Artery microcontroller and with the jogdial header present... older revisions do not have the jogdial header and newer revisions may have other issues. iwz_b([Make sure the headers in the diagram below are available! Check the wiki if in doubt!])])

iwz_p([Please note that it may be advisable to iwz_a_anchor([#4-Firmware-Flashing], [flash the firmware]) first, as plugging in the USB cable for that may cause the speaker to emit a constant, irritating screech until firmware is flashed. iwz_b([These modifications REQUIRE the FlashFloppy firmware to be used!])])

iwz_subsect([Bill of Materials])

iwz_list([
   iwz_li([iwz_a_amazon([https://www.amazon.com/dp/B07QBP1W5L],
      [Electronic Buzzer])])
   iwz_li([iwz_a_amazon([https://www.amazon.com/dp/B09MZ8DW4R],
      [OLED Display])])
   iwz_li([iwz_a_amazon([https://www.amazon.com/gp/product/B07T3672VK],
      [Rotary Dial])])
   iwz_li([2n3904 NPN Transistor])
   iwz_li([1k Resistor])
])

iwz_subsect([Diagram])

iwz_img(
   [/images/gotek/gotek-diagram.png],
   [Diagram of the GoTek mainboard, with the jumper/connection blocks called out with their pins highlighted in colors that correspond to the pins on an additional rotary dial, OLED display, and speaker (with transistor for amplification).])

iwz_sect([Photos])

iwz_img(
   [/images/gotek/gotek-front.jpg],
   [Front view of our modified Gotek floppy emulator.])

iwz_img(
   [/images/gotek/gotek-inside.jpg],
   [Top view of the inside of one of our modified Gotek floppy emulators.])

iwz_sect([Flashing and Software])

iwz_subsect([Firmware Flashing])

iwz_p([This is fairly standard, according to the iwz_a([https://github.com/keirf/FlashFloppy/wiki/Firmware-Programming], [FlashFloppy Wiki]). The script below will flash a Gotek connected via a double-A-ended USB cable and with the jumper wire installed as per the FlashFloppy wiki page.])

iwz_p([If the firmware does not flash with this procedure, make sure you have the jumper wire installed and try running the script several times!])

iwz_diff(
   [flashfloppy.sh], [
   iwz_diffl([], [1], [#!/bin/sh])
   iwz_diffl([], [2], [])
   iwz_diffl([], [3], [DFU_FILE="$1"])
   iwz_diffl([], [4], [])
   iwz_diffl([], [5], [# First, run the unprotect command (needs -D, even tho it doesn't use the file).])
   iwz_diffl([], [6], [# This will probably generate an error, but it's fine.])
   iwz_diffl([], [7], [sudo dfu-util -s :unprotect:force -D $DFU_FILE -a 0])
   iwz_diffl([], [8], [])
   iwz_diffl([], [9], [sleep 3])
   iwz_diffl([], [10], [])
   iwz_diffl([], [11], [# Perform the actual flash.])
   iwz_diffl([], [12], [sudo dfu-util -D $DFU_FILE -a 0])
])

iwz_subsect([Companion Software])

iwz_p([Once FlashFloppy is running, the OLED display should show the current version when power is applied. The iwz_a_repo([vfloppy], [indigoparadox], [vfloppy]) repository contains some scripts for working with floppy images from ZIP files and directories on the Linux command line via mtools.])

iwz_sect([References])

iwz_refs([
   iwz_ref([https://github.com/keirf/flashfloppy/wiki/Hardware-Mods], [Hardware Mods - keirf/flashfloppy Wiki])
   iwz_ref([https://github.com/keirf/flashfloppy/wiki/Firmware-Programming], [Firmware Programming - keirf/flashfloppy Wiki])
])

include([footer.m4])
