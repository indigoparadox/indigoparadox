divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title], [OpenGL in Visual Basic 4])
define([iwz_section], [projects])
divert(0)include([header.m4])

iwz_video(
   [/images/vb4gl/vb4gl-demo2.mp4],
   [Visual Basic 4 workspace, with a form with a beveled box in which the cube is now rotating. The rotation can be adjusted with a horizontal scrollbar, zoomed with a vertical scrollbar, and there's a checkbox which, when checked, causes the cube to rotate automatically.])

iwz_sect([Introduction])

iwz_p([This project might be a real head-scratcher, even for those normally willing to extend the benefit of the doubt to knowledge for knowledge's sake. It seems fairly common for folks to dig out their old childhood computers these days and look at them with new eyes. Less common, however, seems to be the impulse to dig out one's old childhood programming languages.])

iwz_p([But we wanted a change of pace, and we do what we want! So here it is. A combination of a language we haven't touched in around 20 years with our most recent interest: iwz_a_ipage([/tutorials/opengl01.html], [OpenGL 1.0]).])

iwz_p([This is not an exhaustive tutorial. Putting together basic knowledge of Visual Basic with iwz_func(declare()) statements and knowledge of the quirks below and the information from the tutorial linked in the previous paragraph should be enough to reproduce these results if one is so inclined.])

iwz_p([This is merely a collection of notes and observations. With that out of the way...])

iwz_sect([Visual Basic Basics])

iwz_p([We said this is not a tutorial, but Visual Basic is not difficult to pick up in a hurry if you're already familiar with programming. With that in mind, and because it's not exactly a popular language, these days, here are some basics for getting started:])

iwz_list([
   iwz_li([Declare variables with iwz_func(Dim x as type). Types are iwz_var(Integer) (16-bit), iwz_var(Long) (32-bit), iwz_var(Single) (32-bit floating point), iwz_var(Double) (64-bit floating point), iwz_var(Boolean) (boolean), and iwz_var(String), which is variable length (although you can fix its length by declaring it as e.g. String * 1 for 1-length, which is also how you might declare a byte, since there's no iwz_var(Char)!)])
   iwz_li([Procedures can either be a iwz_func(Function) (returns a value) or a iwz_func([Sub]) (does not return a value). Generally, you don't use parentheses to surround arguments when calling either, unless you're assigning the return value of a iwz_func([Function]), in which case you do!])
   iwz_li([You can call procedures from external libraries (DLL files) using the syntax: Declare iwz_var([Procedure_Name]) Lib "iwz_var([Library_Name (sans .DLL)])" (iwz_var(Arguments)) As iwz_var(Return_Type), replacing iwz_var(Procedure_Name), iwz_var([Library_Name (sans .DLL)]), iwz_var(Arguments), and iwz_var(Return_Type) as appropriate to match the procedure's signature. If you get this wrong, VB will throw an Invalid Calling Convention error!])
])

iwz_sect([Visual Basic Quirks])

iwz_p([A not-insignificant part of this project was re-learning Visual Basic 4. This was complicated by a factor somewhat common to learning all obsolete APIs and programming languages: there are newer versions out there. Some things that will work in Visual Basic 5 or 6 will not work in Visual Basic 4. VB.net is basically a completely different language. All of these seem to be much more popular than Visual Basic 4, specifically.])

iwz_p([Below is a list of things to keep in mind using Visual Basic 4, not just in comparison to later versions of Visual Basic, but perhaps to modern languages in general:])

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

iwz_subsect([Visual Basic 4 Has Objects... But Not Really Instancing...?])

iwz_p([There is no iwz_func([New]) operator in Visual Basic 4.])

iwz_p([To instantiate controls, you must drag them onto a form at design time. From there, you can create a control array by setting their index property to 0. You may then address other indexes at run time and use the iwz_func([Load]) statement (e.g. iwz_cmd([Load ChkExample(1)])) to instantiate a new control in that array, which you can then move around the form by changing its Left/Top properties.])

iwz_p([For more abstract uses, there are custom types, which are closer to structs. You can declare variables with them and pass them around iwz_func(ByRef) or iwz_func(ByVal). They can also be marshaled into C function calls, where they behave as structs.])

include([footer.m4])

