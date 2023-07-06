divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title], [Computers])
define([iwz_section], [computers])
define([iwz_root], 1)
divert(0)include([header.m4])

iwz_proj_card([Hand386], [hand386.html], [],
   [Testing and puttering around with the limited-run retro handheld built with recycled parts.],
   [hardware,portable,pc])

iwz_proj_card([XT8088], [xt8088.html], [],
   [An open-air assembly of the modern-retro Homebrew8088 kit with some upgrades.],
   [hardware,pc])

iwz_proj_card([Tandy 1100 FD], [t1100fd.html], [],
   [Some repairs and mods to an earlier Tandy notebook with a fascinating monochrome screen.],
   [hardware,portable,pc])

iwz_proj_card([Tandy 4850 EP], [t4850ep.html], [],
   [Brief teardown and look at one of the rarer late Tandy PC models.],
   [hardware,pc])

include([footer.m4])
