divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title], [Utilities])
define([iwz_section], [utilities])
define([iwz_root], 1)
divert(0)include([header.m4])

iwz_p([These are some small, low-level utilities which supplement other projects on this web zone.])

iwz_proj_card([ROMPAD], [rompad.html], [],
   [Simple tool for padding a ROM file out to a given size.],
   [c,roms])

iwz_proj_card([Windoes CE 2 SDK], [ce20sdk.html], [],
   [Bundle of Microsoft compilers for Windows CE 2.0.],
   [c,compiler])

include([footer.m4])
