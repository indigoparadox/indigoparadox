divert(-1)
define(`iwz_title',`The indigoparadox Web Zone: OpenGL in Visual Basic 4')
include(`iwz_html.m4')
divert(0)include(`header.m4')
changequote(`[', `]') 

iwz_block_construction()

iwz_video(
   [/images/vb4gl/vb4gl-demo2.mp4],
   [Visual Basic 4 workspace, with a form with a beveled box in which the cube is now rotating. The rotation can be adjusted with a horizontal scrollbar, zoomed with a vertical scrollbar, and there's a checkbox which, when checked, causes the cube to rotate automatically.])

include([footer.m4])

