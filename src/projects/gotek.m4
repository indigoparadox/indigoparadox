divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title], [Gotek Floppy Mods])
define([iwz_section], [projects])
divert(0)include([header.m4])

iwz_sect([Introduction])

iwz_sect([Hardware Modification])

iwz_img(
   [/images/gotek/gotek-diagram.png],
   [])

iwz_sect([Photos])

iwz_img(
   [/images/gotek/gotek-front.jpg],
   [])

iwz_img(
   [/images/gotek/gotek-inside.jpg],
   [])

iwz_sect([References])

iwz_refs([
   iwz_ref([https://github.com/keirf/flashfloppy/wiki/Hardware-Mods], [Hardware Mods - keirf/flashfloppy Wiki])
   iwz_ref([https://github.com/keirf/flashfloppy/wiki/Firmware-Programming], [Firmware Programming - keirf/flashfloppy Wiki])
])

include([footer.m4])
