divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title], [Tandy 1100FD])
define([iwz_section], [computers])
divert(0)include([header.m4])

iwz_img(
   [/images/t1100fd/front-open.jpg],
   [Front view of the Tandy 1100FD open, with the keyboard and old-timey monochrome liquid crystal display visible.])

iwz_sect([Introduction])

iwz_block_pcspec([CPU], [NEC V20 10MHz], [RAM], [640KB], [Video], [Monochrome CGA-Compatible], [Ports], [RS-232/DE-9, Parallel/DB-25])

iwz_p([This was an immediate buy based on its relatively low price at the time, coupled with its monochrome LCD screen which deeply appealed to our sensibilities. Our childhood fondness for the Tandy brand may have also been a factor.])

iwz_p([Connectivity is limited and the 8088-alike CPU puts this among the bottom rungs of PC performance. On the other hand, the OS in ROM simplifies some things and makes it a quaint machine for word processing.])

iwz_sect([Clock Crystal Replacement])

iwz_img(
   [/images/t1100fd/inside-crystal.jpg],
   [Closeup of the original clock chip in a bright blue package near the ROM socket. Practically invisible is the crack around one of the legs in the blue package.])

iwz_p([For a while, we thought we had fried the ROM chip by attempting to read it with our TL866. It turned out to be a chip that the TL866 did not support, and the 1100FD failed to boot once we put it back together...])

iwz_p([As it turns out, on closer inspection, we had broken a 16MHz ceramic oscillator next to the ROM socket. While we weren't able to find an identical part, we replaced it with a common quartz crystal oscillator (the little tin-can-type) and now it boots again!])

iwz_sect([GoTek Floppy Emulator])

iwz_p([Through hints in various forums, we learned it might be possible to replace the internal floppy drive with a more modern GoTek emulator through the use of a iwz_a([https://floppyemulator.com/products/34-24p1-25adaptor/], [34- to 24-pin adaptor]). The floppy drive mount holds a standard-size floppy drive, though the front bezel had to be cut out with a Dremel. It's a tight fit, but it *does* fit!])

iwz_p([One snag that I got caught on was the jumper configuration: S1 must be closed and S0 must be open! If the drive is not responding to DOS commands, this may be the issue.])

iwz_sect([Screenshots])

iwz_p([Similar to the HP 200LX, this machine has a monochrome LCD with no backlight. This unit is also CGA-compatible, though it is quite a bit larger than the 200LX.])

iwz_img(
   [/images/t1100fd/simcity-title.jpg],
   [Tandy 1100FD displaying the SimCity title screen in monochrome green/black.])

iwz_img(
   [/images/t1100fd/simcity-copypro.jpg],
   [Tandy 1100FD displaying the SimCity gameplay screen in monochrome green/black. The copy protection dialog is on top.])

include([footer.m4])
