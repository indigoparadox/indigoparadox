divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title],[Projects])
divert(0)include([header.m4])

iwz_proj_card([OpenGL in Visual Basic 4], [vb4gl.html], [],
   [OpenGL 1.0 support in Visual Basic 4.0 on Windows 9x/NT.],
   [software,visual-basic,opengl])

iwz_proj_card([NTSC], [ntsc.html], [],
   [NTSC/CRT output filtering applied to various software outputs.],
   [software,c,opengl])

dnl iwz_proj_card([Retro Engines], [retro.html], [],
dnl    [Libraries for building portable retro projects, as well as some examples.],
dnl    [software,c,opengl])

dnl iwz_proj_card([Neoroom], [neoroom.html], [],
dnl    [3D room constructed from 3D-rotated HTML elements in HTML/CSS/Javascript.],
dnl    [software,html])

iwz_proj_card([Tandy 4850 EP], [t4850ep.html], [],
   [Brief teardown and look at one of the rarer late Tandy PC models.],
   [hardware,pc])

dnl iwz_proj_card([Webdows 95], [webdows95.html], [],
dnl    [HTML/JS-based simulation of Windows 95 for the web.],
dnl    [web], [operating systems])

iwz_proj_card([Mario 64 Python], [mario64p.html], [],
   [Grafting Python onto the Mario 64 PC build for modding possibilities.],
   [software,c,python])

iwz_proj_card([PSUBot], [psubot.html], [],
   [Remote-control robot made from an old PC power supply.],
   [hardware,embedded,robot,msp430])

include([footer.m4])
