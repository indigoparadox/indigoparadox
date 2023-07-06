divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title], [Projects])
define([iwz_section], [projects])
define([iwz_root], 1)
divert(0)include([header.m4])

iwz_p([The projects on this page comprise (mostly ongoing) experiments and restorations with (mostly obsolete) technology. They are not intended as tutorials, per sea, but hopefully there is something interesting to learn from each of them.])

iwz_p([We are working on a feasible semi-automated method of notifying when pages are updated, like a mailing list or RSS feed. In the meantime, significant updates should be announced on iwz_a_ipage([/], [our Mastodon feed])!])

iwz_proj_card([dbfetch and Sensor data], [dbfetch.html], [],
   [Gathering environmental sensor information from various sources.],
   [software,python,database])

iwz_proj_card([OpenGL in Visual Basic 4], [vb4gl.html], [],
   [OpenGL 1.0 support in Visual Basic 4.0 on Windows 9x/NT.],
   [software,visual-basic,opengl])

iwz_proj_card([NTSC], [ntsc.html], [],
   [NTSC/CRT output filtering applied to various software outputs.],
   [software,c,opengl])

dnl iwz_proj_card([Retro Engines], [retro.html], [],
dnl    [Libraries for building portable retro projects, as well as some examples.],
dnl    [software,c,opengl])

iwz_proj_card([Neoroom], [neoroom.html], [],
   [3D room constructed from 3D-rotated HTML elements in HTML/CSS/Javascript.],
   [web])

iwz_proj_card([MIDI Box], [midibox.html], [],
   [Basic PC game port to MIDI DIN/3.5" miniplug interface box.],
   [hardware,midi])

iwz_proj_card([RC2014 Assembly], [rc2014.html], [],
   [Attempt to assemble a working RC2014 Pro computer kit.],
   [hardware,kit,z80])

iwz_proj_card([Webdows 95], [webdows95.html], [],
   [HTML/JS-based simulation of Windows 95 for the web.],
   [web], [operating systems])

iwz_proj_card([Mario 64 Python], [mario64p.html], [],
   [Grafting Python onto the Mario 64 PC build for modding possibilities.],
   [software,c,python])

iwz_proj_card([Gotek Floppy Mods], [gotek.html], [],
   [Quick reference and notes regarding installing OLED display, rotary dial, and speaker on the Gotek floppy emulator.],
   [hardware,embedded])

iwz_proj_card([PSUBot], [psubot.html], [],
   [Remote-control robot made from an old PC power supply.],
   [hardware,embedded,robot,msp430])

include([footer.m4])
