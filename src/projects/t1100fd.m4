divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title],[The indigoparadox Web Zone: Tandy 1100FD])
divert(0)include([header.m4])

iwz_img(
   [/images/t1100fd/front-open.jpg],
   [Front view of the Tandy 1100FD open, with the keyboard and old-timey monochrome liquid crystal display visible.])

iwz_sect([Clock Crystal Replacement])

iwz_img(
   [/images/t1100fd/inside-crystal.jpg],
   [Closeup of the original clock chip in a bright blue package near the ROM socket. Practically invisible is the crack around one of the legs in the blue package.])

iwz_p([For a while, we thought we had fried the ROM chip by attempting to read it with our TL866. It turned out to be a chip that the TL866 did not support,and the 1100FD failed to boot once we put it back together...])

iwz_p([As it turns out, on closer inspection, we had broken a 16Mhz ceramic oscillator next to the ROM socket. While we weren't able to find an identical part, we replaced it with a common quartz crystal oscillator (the little tin-can-type) and now it boots again!])

include([footer.m4])
