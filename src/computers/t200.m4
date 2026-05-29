divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title], [Toshiba T200 Tablet])
define([iwz_section], [computers])
divert(0)include([header.m4])

iwz_sect([Introduction])

iwz_block_pcspec([CPU], [486 DX2 40MHz], [RAM], [4MB + 4MB Expansion Card], [Video], [], [Hard Disk], [1GB Compact Flash], [Ports], [1x PS/2, 1x RS-232/DE-9, VGA/DE-15, Parallel/Proprietary, External Floppy/Proprietary, 72-pin Port Replicator Expansion])

iwz_sect([Disk Limitations])

iwz_p([The BIOS does not seem to recognize disks over 1GB, but even this is rather generous for the time period.])

iwz_img(
   [/images/t200/cf_adapter.jpg],
   [Photograph of the back compartment of the T200 tablet computer. The service panel is removed exposing a Compact Flash card in an adapter attached to the IDE connector with multiple angled multi-row pin extenders.])

iwz_img(
   [/images/t200/orig_disk.jpg],
   [Photograph of a computer hard disk. It has the peculiar characteristic of an IDE connector pointed perpendicular to its length, unlike most disks.])

iwz_p([A somewhat stranger limitation is the physical configuration of the hard disk. The drive is smaller than a standard 2.5" disk and its connector is oriented in a direction orthogonal to the length of the drive, which is very unusual. This necessitated the use of 2.0mm-pitch dual-row angled male-female extensions to fit a standard Compact Flash reader inside of the chassis. A standard 2.5" hard drive seems to be out of the question due to the physical size constraint.])

iwz_sect([Display])

iwz_p([The display backlight may be turned on or off using the pen controls on the silkscreen bezel. It's a classic passive monochrome LCD similar to what you would see on an early PDA or calculator.])

iwz_img(
   [/images/t200/simcity_light.jpg],
   [Photograph of a Toshiba tablet computer. The screen backlight is on and SimCity for Windows is visible running on the computer.])

iwz_img(
   [/images/t200/simcity_dark.jpg],
   [Photograph of a Toshiba tablet computer. The screen backlight is off but it's an old-timey reflective monochrome LCD so SimCity for Windows is still visible running on the computer.])

iwz_sect([Pen Computing])

iwz_p([The display requires the use of a special pen. There is a fold-out compartment for the pen on the side of the unit. The pen also does not seem to need a battery. The BIOS may be configured with the pen, which is useful since there is no built-in keyboard.])

iwz_img(
   [/images/t200/lcd_back.jpg],
   [Photograph of a computer circuit board attached to the rear of the display inside of the tablet chassis. A chip with the marking "Wacom W6003F" is prominently featured on the board, among others.])

iwz_p([The tablet seems to be made by Wacom and, as there is no keyboard, is essential to controlling the device. There is a PS/2 port to attach an external keyboard, but this is unwieldy.])

iwz_p([Driver support is iffy. Currently, the most reliable way seems to be to install MS-DOS and Windows 3.1 on the Compact Flash card in another PC and then overwrite the installations with the contents of iwz_a([https://archive.org/details/t200_20240329], [this partial dump]). This contains some spurious program groups and paths but these are simple to clean up.])

iwz_sect([Motherboard])

iwz_p([For completeness and reference, here are some images of the motherboard:])

iwz_img(
   [/images/t200/motherboard_front.jpg],
   [Photograph of a computer circuit board. Large plastic sheets conceal the PCMCIA card slots and a variety of large passive components assumed to be part of the power supply occupy the upper-left portion of the board. A linear connector in the middle connects it to the display board above.])

iwz_img(
   [/images/t200/motherboard_front.jpg],
   [Photograph of the other side of the same computer circuit board while it is still mounted in the tablet chassis. A 486 CPU is visible, along with a number of custom Toshiba chips.])

include([footer.m4])

