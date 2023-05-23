divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title], [Mario 64 Python])
define([iwz_section], [projects])
divert(0)include([header.m4])

iwz_img(
   [/images/mario64p/mario64p1.png],
   [Super Mario completing a triple jump in the beginning area with 'AIR TIME' in colorful letters appearing and coins spawning around him.])

iwz_sect([Compiling])

iwz_p([First, you should install some prerequisites. On Ubuntu 20.04, this can be done with the following command: iwz_cmd([sudo apt install libsdl2-dev libopengl-dev libglew-dev libpython3-dev build-essential])])

iwz_p([If this does not work, either because we missed a package or a package has changed names since then, please feel free to iwz_let_us_know!])

iwz_p([Once you have the dependencies, you can clone the code from iwz_a_repo([the sm64pc-python repo], [indigoparadox], [sm64pc-python]). From there, the following set of commands should work:])

iwz_list([
iwz_li([iwz_cmd([cp ~/Mario64.z64 baserom.us.z64])])
iwz_li([iwz_cmd([mkdir build && cd build])])
iwz_li([iwz_cmd([cmake ..])])
iwz_li([iwz_cmd([cmake ..])])
iwz_li([iwz_cmd([make])])
iwz_li([iwz_cmd([cd ..])])
iwz_li([iwz_cmd([./build/sm64.us.f3dex])])
])

iwz_p([This will likely produce a lot of warning/error messages, but it should get there in the end.])

iwz_sect([Python])

iwz_p([The python portion of the engine is in iwz_filename(sm64.py). By default, this module contains a number of functions that have been ported out from C to Python and modified during the process. These can be freely modified to change the game's functionality (though the game must be restarted afterwards!)])

iwz_p([The iwz_filename(sm64.py) file must be in the program's current working directory (the directory it was launched from)!])

iwz_p([Some of these modifications made to the engine are silly (e.g. the "Air Time" triple jump depicted in the opening image), and there are some bugs (probably floating-point-related) still lurking around that may appear when you e.g. approach a door too fast.])

iwz_p([Most of the work involved with adding Python support was in figuring out how the codebase worked, and then adding glue code which exported those functions and constants out to Python via the stack.])

iwz_p([This glue code is mostly in the files iwz_filename([src/pc/*_python.*]). By all means, please feel free to poke around and see what's available! Some extra work was put into making things like text boxes and letters more usable, too.])

iwz_sect([Web Server Demo])

iwz_p([For demonstration purposes, the default iwz_filename(sm64.py) uses standard Python APIs to serve a web page on port 8064 while the game is running. This page has a number of options for affecting gameplay:])

iwz_video(
   [/images/mario64p/mario64p-webdemo.mp4],
   [A brief demo of level warping and text boxes.])

iwz_sect([Conclusion])

iwz_p([There's a lot going on here, and we may come back to revisit this project at some point. There have been quite a few new commits in the original repository that need to be integrated. Please iwz_let_us_know if you do something fun with it!])

include([footer.m4])
