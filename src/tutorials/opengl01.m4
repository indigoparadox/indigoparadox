divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title],[The indigoparadox Web Zone: OpenGL 1.0: Part 1])
divert(0)include([header.m4])

iwz_block_construction()

iwz_img(
   [/images/opengl/opengl01.png],
   [The inside of a colorful cube rendered in a window.])

include([opengl01.m4])

include([footer.m4])
