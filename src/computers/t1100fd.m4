divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title], [Tandy 1100FD])
define([iwz_section], [projects])
divert(0)include([header.m4])

iwz_img(
   [/images/t1100fd/front-open.jpg],
   [Front view of the Tandy 1100FD open, with the keyboard and old-timey monochrome liquid crystal display visible.])

iwz_sect([Introduction])

iwz_block_pcspec([CPU], [NEC V20 10MHHz], [RAM], [640KB], [Video], [Monochrome CGA-Compatible])

iwz_p([This was an immediate buy based on its relatively low price at the time, coupled with its monochrome LCD screen which deeply appealed to our sensibilities. Our childhood fondness for the Tandy brand may have also been a factor.])

iwz_p([Connectivity is limited and the 8088-alike CPU puts this among the bottom rungs of PC performance. On the other hand, the OS in ROM simplifies some things and makes it a quaint machine for word processing.])

iwz_sect([Clock Crystal Replacement])

iwz_img(
   [/images/t1100fd/inside-crystal.jpg],
   [Closeup of the original clock chip in a bright blue package near the ROM socket. Practically invisible is the crack around one of the legs in the blue package.])

iwz_p([For a while, we thought we had fried the ROM chip by attempting to read it with our TL866. It turned out to be a chip that the TL866 did not support,and the 1100FD failed to boot once we put it back together...])

iwz_p([As it turns out, on closer inspection, we had broken a 16MHz ceramic oscillator next to the ROM socket. While we weren't able to find an identical part, we replaced it with a common quartz crystal oscillator (the little tin-can-type) and now it boots again!])

iwz_sect([GoTek Floppy Emulator])

iwz_p([Through hints in various forums, we learned it might be possible to replace the internal floppy drive with a more modern GoTek emulator through the use of a iwz_a([https://floppyemulator.com/products/34-24p1-25adaptor/], [34- to 24-pin adaptor]). The floppy drive mount holds a standard-size floppy drive, though the front bezel had to be cut out with a Dremel. It's a tight fit, but it *does* fit!])

include([footer.m4])
