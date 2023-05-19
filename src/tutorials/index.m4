divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title],[The indigoparadox Web Zone: Tutorials])
divert(0)include([header.m4])

iwz_proj_card([OpenGL 1.0], [opengl01.html,opengl02.html], [],
   [Notes on early/minimal versions of OpenGL, their usage and limitations.],
   [software,c,opengl])

include([footer.m4])
