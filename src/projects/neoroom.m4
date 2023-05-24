divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title], [Neoroom])
define([iwz_section], [projects])
divert(0)include([header.m4])

iwz_iframe_proj([neoroom])

iwz_sect([Introduction])

iwz_p([This was an early experiment with a rather extravagant web page format, inspired by 90's room-based PC interfaces like Packard Bell Navigator, combined with the excessive capabilities of modern CSS transforms. All of the walls and furniture are made of HTML elements (primarily divs), rotated to fit together as a 3D model.])

iwz_p([The fact that modern web pages can do this is still incredible, to us.])

iwz_sect([Composition])

iwz_p([This example uses JavaScript to create and position the divs. But it is entirely possible to do this on a static page (save for possibly the interactive click-to-rotate buttons).])

iwz_p([We built an intermediate layer we call "RoomJL" on top of jQuery that moves and sizes the divs (which we call quads, internally) and applies CSS transforms. Models like the bench or desk are built on top of this.])

iwz_subsect([The TV: Shape])

iwz_p([The "TV" shape uses an slanted top to give it some "character," but this took a disproportionate effort. The sides are actually two "quads" (i.e. divs): the slants of the sides are a second set of quads above the cube walls with special CSS to make only half of them visible, creating fake "triangles."])

iwz_p([The code below is that special CSS. Essentially, the fake "triangles" just have very large opaque borders on two sides, and a large transparent border which shears one of them in half on another side. It's awkward, but it works!])

iwz_diff(
   [style.css],
   iwz_diffl([], [], [.tv-left-t {])
   iwz_diffl([], [], [   border-top: 0;])
   iwz_diffl([], [], [   border-left: 40px solid transparent;])
   iwz_diffl([], [], [   border-right: 40px solid dimgray;])
   iwz_diffl([], [], [   border-bottom: 40px solid dimgray;])
   iwz_diffl([], [], [   outline: none;])
   iwz_diffl([], [], [}])
   iwz_diffl([], [], [])
   iwz_diffl([], [], [.tv-right-t {])
   iwz_diffl([], [], [   border-top: 0;])
   iwz_diffl([], [], [   border-right: 40px solid transparent;])
   iwz_diffl([], [], [   border-left: 40px solid dimgray;])
   iwz_diffl([], [], [   border-bottom: 40px solid dimgray;])
   iwz_diffl([], [], [   outline: none;])
   iwz_diffl([], [], [}])
)

iwz_p([The slanted part of the top of the TV is just rotated at an angle that was visibly estimated to "look right." The end result is somewhat underwhelming for the effort it required.])

iwz_subsect([The TV: Screen])

iwz_p([Also of note is the YouTube video embedded in an iframe on the TV screen. It requires a click to play and one must move the mouse cursor away so that the YouTube gadgets vanish, but it hammers home that these are just rotated divs!])

iwz_sect([Conclusion])

iwz_p([While the potential for this project is limited due to a high cost/reward ratio, it does have some interesting points. Hopefully some of the things we learn here may be useful elsewhere... including this website!])

include([footer.m4])
