divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title], [Tutorials])
define([iwz_section], [tutorials])
define([iwz_root], 1)
divert(0)include([header.m4])

iwz_proj_card([Crossdev with OpenWatcom], [watcom.html], [],
   [Using OpenWatcom to compile DOS/Windows programs from GNU/Linux.],
   [software,c])

iwz_proj_card([OpenGL 1.0], [opengl01.html,], [],
   [Notes on early/minimal versions of OpenGL, their usage and limitations.],
   [software,c,opengl])

iwz_proj_card([X86 Assembly: Hello!], [x86hello.html], [],
   [X86 assembly: Printing a simple string using a DOS function.],
   [software,assembly])

dnl iwz_proj_card([X86 Assembly: Stack], [x86stack.html], [],
dnl    [X86 assembly: Using the Stack to Pass Arguments],
dnl    [software,assembly])
 
include([footer.m4])
