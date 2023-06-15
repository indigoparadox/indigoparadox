divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title], [Tandy 4850 EP])
define([iwz_section], [computers])
divert(0)include([header.m4])

iwz_img(
   [/images/t4850ep/t4850ep-front.jpg],
   [The front bezel of our modded Tandy 4850 EP.])

iwz_sect([Introduction])

iwz_block_pcspec([CPU], [486 DX2 55MHz], [RAM], [16MB], [Video], [WD90C30-LR VGA 1MB], [Hard Disk], [500MB], [Ports], [2xPS/2, 2xRS-232/DE-9, VGA/DE-15, Parallel/DB-25])

iwz_p([The Tandy 4850 EP is a somewhat rarer Tandy model. It adheres to the standards of its day more closely than the earlier Tandy 1000 series, eschewing Tandy graphics and sound and Deskmate in favor of VGA and Windows.])

iwz_p([This Tandy 4850 EP was inherited after the previous owner upgraded around the mid-to-late 90s. They installed a Pro Audio Spectrum 16 sound card, as well as Windows 95 on it when that came out. This ran fairly well on the 486 DX2 55MHz CPU, albeit stuck in 256 colors with the built-in Western Digital video chip. It does seem that the video RAM was upgraded to 1MB at some point (SW1P6 is set to OFF per iwz_a([http://ftp.oldskool.org/pub/tvdog/tandy1000/faxback/01013.txt], [Tandy faxback 01013])).])

iwz_p([During our stewardship of the machine, we have replaced the original floppy with a modded GoTek floppy emulator and upgraded the accompanying Sony external CD-ROM drive to an internal 52X IDE unit.])

iwz_sect([BIOS Images])

iwz_p([Unlike earlier Tandy computers, the 4850 EP does not have an operating system or file system in ROM. It uses the Phoenix BIOS and, fortunately, it does have the setup utility in ROM. The BIOS is limited to a maximum hard disk size of 512 MB, but this can be worked around with disk extender software. Here are iwz_a_file([/images/t4850ep/t4850ep-bios.zip], [the Tandy 4850 EP BIOS images]).])

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

iwz_p([While the questionable idea of using a generic fuse holder and fuse of similar specs that we had lying around was ours, the idea to check the fuse because the PC was acting like no keyboard was attached came from iwz_a_social([https://ccrvb.com/@yestergearpc], [Adam Brisebois]) (thanks, Adam!)])

iwz_sect([References])

iwz_refs([
   iwz_ref([http://ftp.oldskool.org/pub/tvdog/tandy1000/faxback/01014.txt], [4850 EP VGA Video Faxback Doc. #1014])
   iwz_ref([https://en.wikipedia.org/wiki/Media_Vision_Pro_AudioSpectrum], [Media Vision Pro AudioSpectrum - Wikipedia])
   iwz_ref([https://www.atarimagazines.com/compute/issue142/100_Tandy_4825_SX_Tandy.php], [Tandy 4825 SX, 4850 EP - Compute! Magazine])
])

include([footer.m4])

