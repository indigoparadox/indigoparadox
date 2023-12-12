divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title], [Tutorials])
define([iwz_section], [tutorials])
define([iwz_root], 1)
divert(0)include([header.m4])

iwz_proj_card([OpenGL 1.0], [opengl01.html,], [],
   [Notes on early/minimal versions of OpenGL, their usage and limitations.],
   [software,c,opengl])

iwz_proj_card([X86 Assembly: Hello!], [x86hello.html], [],
   [X86 assembly: Printing a simple string using a DOS function.],
   [software,assembly])

iwz_proj_card([X86 Assembly: Stack], [x86stack.html], [],
   [X86 assembly: Using the Stack to Pass Arguments],
   [software,assembly])

include([footer.m4])
