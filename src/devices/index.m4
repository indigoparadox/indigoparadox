divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title], [Devices])
define([iwz_section], [devices])
define([iwz_root], 1)
divert(0)include([header.m4])

iwz_proj_card([Telebit NetBlazer PN2], [netblazer.html], [],
   [A router-dialup bridge from the early 1990s. Uses a 386 CPU and boots from a floppy disk.],
   [networking])

include([footer.m4])

