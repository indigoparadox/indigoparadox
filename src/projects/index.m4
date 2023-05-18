divert(-1)
define(`iwz_title',`The indigoparadox Web Zone: Projects')
include(`proj.m4')
divert(0)include(`header.m4')

iwz_proj_card(`PSUBot', `', `',
   `Remote-control robot made from an old PC power supply.',
   `hardware,embedded,robot,msp430')

iwz_proj_card(`OpenGL 1.0', `opengl.html', `',
   `Notes on early/minimal versions of OpenGL, their usage and limitations.',
   `software,c,opengl')

iwz_proj_card(`OpenGL in Visual Basic 4', `', `',
   `OpenGL 1.0 support in Visual Basic 4.0 on Windows 9x/NT.',
   `software,visual-basic,opengl')

iwz_proj_card(`Retro Engines', `retro.html', `',
   `Libraries for building portable retro projects, as well as some examples.',
   `software,c,opengl')

iwz_proj_card(`NTSC', `ntsc.html', `',
   `NTSC/CRT output filtering applied to various software outputs.',
   `software,c,opengl')

include(`footer.m4')
