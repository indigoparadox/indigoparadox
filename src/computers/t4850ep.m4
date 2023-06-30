divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title], [Tandy 4850 EP])
define([iwz_section], [computers])
divert(0)include([header.m4])

iwz_img(
   [/images/t4850ep/t4850ep-front-20230620.jpg],
   [The front bezel of our modded Tandy 4850 EP. The 3.25-inch bays have a CompactFlash card reader and a GoTek USB floppy emulator modded with a rotary encoder and OLED screen. The 5.25-inch bay has a classic 8x IDE CD-ROM drive.])

iwz_sect([Introduction])

iwz_block_pcspec([CPU], [486 DX2 55MHz], [RAM], [16MB], [Video], [WD90C30-LR VGA 1MB], [Hard Disk], [2GB CompactFlash], [Ports], [2xPS/2, 2xRS-232/DE-9, VGA/DE-15, Parallel/DB-25, Ethernet/RJ-45/BNC/AUI])

iwz_p([The Tandy 4850 EP is a somewhat rarer Tandy model. It adheres to the standards of its day more closely than the earlier Tandy 1000 series, eschewing Tandy graphics and sound and Deskmate in favor of VGA and Windows.])

iwz_p([This unit came into our possession with a Pro Audio Spectrum 16 sound card, as well as Windows 95. This ran fairly well on the 486 DX2 55MHz CPU, albeit stuck in 256 colors with the built-in Western Digital video chip. It does seem that the video RAM was upgraded to 1MB at some point (SW1P6 is set to OFF per iwz_a([http://ftp.oldskool.org/pub/tvdog/tandy1000/faxback/01013.txt], [Tandy faxback 01013])).])

iwz_p([During our stewardship of the machine, we have replaced the original floppy with a modded GoTek floppy emulator and upgraded the accompanying Sony external CD-ROM drive to an internal 52X IDE unit.])

iwz_sect([BIOS Images])

iwz_p([Unlike earlier Tandy computers, the 4850 EP does not have an operating system or file system in ROM. It uses the Phoenix BIOS and, fortunately, it does have the setup utility in ROM. The BIOS is limited to a maximum hard disk size of 512 MB, but this can be worked around with disk extender software. Here are iwz_a([/images/t4850ep/t4850ep-bios.zip], [the Tandy 4850 EP BIOS images]).])

iwz_sect([Inside Pictures])

iwz_p([In the interest of completeness and in no particular order, here are the insides of the Tandy 4850 EP. Please hover your mouse cursor over each picture for a brief description of the image.])

iwz_img(
   [/images/t4850ep/t4850ep-inside-l.jpg],
   [The left half of the motherboard of the Tandy 4850 EP, in front of the risers. ROM chips and GALs are visible.])

iwz_img(
   [/images/t4850ep/t4850ep-inside-r.jpg],
   [The right half of the motherboard of the Tandy 4850 EP. Many chips are visible. The 486 is under a small, black heatsink. The keyboard fuse has been replaced with an awkward large fuse holder.])

iwz_sect([Keyboard Fuse Replacement])

iwz_p([The large fuse holder of questionable efficacy in the motherboard picture in the previous section is not the original keyboard fuse. The original looked like this:])

iwz_img(
   [/images/t4850ep/t4850ep-kb-fuse.jpg],
   [Closeup of the original Tandy 4850 EP keyboard fuse. A tiny, inconspicuous yellow-green cylinder.])

iwz_p([Unfortunately, the original fuse blew at some point during the last 20 years or so. This is why you should always turn the computer off and ground yourself before attaching a PS/2-style keyboard!])

iwz_p([While the questionable idea of using a generic fuse holder and fuse of similar specs that we had lying around was ours, the idea to check the fuse because the PC was acting like no keyboard was attached came from iwz_a([https://ccrvb.com/@yestergearpc], [Adam Brisebois]) (thanks, Adam!)])

iwz_sect([XT-IDE Universal BIOS and Large Drives])

iwz_p([The Tandy 4850 EP has a 512MB disk size limitation in its BIOS. Previously, this was worked around using Dynamic Drive Overlay software. In this case, it also has a 3Com 3c509b-C Ethernet ISA card with a free boot ROM socket. This afforded us the opportunity to avoid DDO software altogether by using iwz_a([https://www.xtideuniversalbios.org/binaries/], [the latest version of the XT-IDE Universal BIOS]) (r625 at the time of this writing).])

iwz_subsect([Procedure])

iwz_suml([
   iwz_suml_item(
      [3c509b Configuration],
      [This was done on the Tandy with the 3c509b installed, using iwz_cmd([3C5X9CFG.EXE]) from the iwz_a([http://ohlandl.ipv7.net/NIC/3com_529.html], [EtherDisk 6.1]) collection. Most of the defaults were kept, but the boot ROM size was set to 16KB (even though our physical ROM was 64KB, see the section on flashing, below). We were also forced to disable Plug-and-Play support by Windows issues (see iwz_a_anchor([#5-Troubleshooting], [Troubleshooting]), below).])
   iwz_suml_item(
      [XT-IDE Configuration],
      [With some experimentation, we found the optimal settings to be those indicated in the images below. Configuration was performed in DOSBox on our host PC using iwz_filename([XTIDECFG.COM]) and written to iwz_filename([IDE_386L.BIN])
         iwz_img(
            [/images/t4850ep/dosbox-xtidecfg-ctrl.png],
            [Controller configuration: device type is 16-bit, base address is 1F0h, control address is 3F0h, IRQ is enabled and set to 14.])
         iwz_img(
            [/images/t4850ep/dosbox-xtidecfg-drive.png],
            [Drive configuration: block transfers enabled, CHS translation set to auto, write cache disabled, and no user-specified CHS or LBA.])])
   iwz_suml_item(
      [XT-IDE Flashing],
      [Before flashing, it was necessary to pad the ROM using iwz_a_ipage([/utilities/rompad.html], [ROMPAD]). The 3c509b was configured for a 16KB ROM, the actual physical ROM chip we were using was 64KB, and the ROM file was 12KB, so the command we used was iwz_cmd([./rompad ide_386l.bin ide_pad.bin 16 64]). We then burned this to our ROM chip using a TL866 and the iwz_cmd([minipro]) package.])
])

iwz_subsect([Troubleshooting])

iwz_p([With the XT-IDE BIOS in place, we installed DOS 6, Windows 3.1 (in iwz_filename([C:\WIN31]) and Windows 95 (in iwz_filename([C:\WIN95]). After the first couple reboots for setup, subsequent boots tended to fail with a iwz_errorm([Windows Protection Error]).])

iwz_p([We suspected the XT-IDE BIOS, but a logged boot (available from the F8 menu) showed that the boot was failing after the 3c509b driver was loading. Disabling the 3c509b driver allowed Windows to boot. Finding another network driver would be a pain, so we first tried the drivers from the 3com EtherDisk, with the same result. Finally, we disabled PnP mode using the iwz_cmd([3C5X9CFG.EXE]) utility and installed the driver using the Windows 95 "detect hardware" option.])

iwz_p([This worked, and now we have consistent booting with network access!])

iwz_sect([References])

iwz_refs([
   iwz_ref([http://ftp.oldskool.org/pub/tvdog/tandy1000/faxback/01014.txt], [4850 EP VGA Video Faxback Doc. #1014])
   iwz_ref([https://en.wikipedia.org/wiki/Media_Vision_Pro_AudioSpectrum], [Media Vision Pro AudioSpectrum - Wikipedia])
   iwz_ref([https://www.atarimagazines.com/compute/issue142/100_Tandy_4825_SX_Tandy.php], [Tandy 4825 SX, 4850 EP - Compute! Magazine])
   iwz_ref([http://ohlandl.ipv7.net/NIC/3com_529.html], [3com Etherlink 3C529])
   iwz_ref([https://www.lo-tech.co.uk/wiki/XTIDE_Universal_BIOS], [XTIDE Universal BIOS - Lo-tech Wiki])
])

include([footer.m4])

