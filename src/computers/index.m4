divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title], [Computers])
define([iwz_section], [computers])
define([iwz_root], 1)
divert(0)include([header.m4])

iwz_proj_card([Tandy 4850 EP], [t4850ep.html], [],
   [Brief teardown and look at one of the rarer late Tandy PC models.],
   [hardware,pc])

include([footer.m4])
