divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title],[The indigoparadox Web Zone: OpenGL in Visual Basic 4])
divert(0)include([header.m4])

iwz_block_construction()

iwz_video(
   [/images/vb4gl/vb4gl-demo2.mp4],
   [Visual Basic 4 workspace, with a form with a beveled box in which the cube is now rotating. The rotation can be adjusted with a horizontal scrollbar, zoomed with a vertical scrollbar, and there's a checkbox which, when checked, causes the cube to rotate automatically.])

iwz_subsect([Visual Basic 4 uses Banker's Rounding])

iwz_p([This means that floats converted to integers will round to the nearest *even* number. This can catch you off-guard and be especially annoying if you're trying to bit shift via dividing by 2 because...])

iwz_subsect([Visual Basic 4 Does Not Have Bitwise Operators])

iwz_p([At least not that we could figure out! If it does, then please feel free to correct us on this. In order to compensate for this, you can do something like this:])

iwz_diff(
   [BitShift.bas],
   iwz_diffl([], [1],  [Public Function ShiftRight(ByVal x As Double)])
   iwz_diffl([], [2],  [    Dim Out As Integer])
   iwz_diffl([], [3],  [])
   iwz_diffl([], [4],  [    If 0 = x Then])
   iwz_diffl([], [5],  [        'Trivial case.])
   iwz_diffl([], [6],  [        ShiftRight = 0])
   iwz_diffl([], [7],  [    ElseIf x Mod 2 > 0 Then])
   iwz_diffl([], [8],  [        'Subtract 1 to make the number even to avoid weird VB rounding.])
   iwz_diffl([], [9],  [        ShiftRight = (x - 1) / 2])
   iwz_diffl([], [10], [    Else])
   iwz_diffl([], [11], [        ShiftRight = x / 2])
   iwz_diffl([], [12], [    End If])
   iwz_diffl([], [13], [End Function])
)

include([footer.m4])

