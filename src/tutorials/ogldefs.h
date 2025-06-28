
/* dnl :title: OpenGL 1.0 Project Constants and Prototypes
 */

/* dnl :sect: Include Guards
 */

/* This prevents the header from being added more than once, even if it is
 * included multiple times, by defining a constant on the first include that
 * is checked for on subsequent includes.
 */

#ifndef OGLDEFS_H
#define OGLDEFS_H

/* dnl :sect: Display Constants
 */

/* These define the properties of the screen: width and height (in pixels), and
 * our target Frames Per Second. Please feel free to adjust them to see what
 * happens!
 */

#define OGL_SCREEN_W 320
#define OGL_SCREEN_H 240
#define OGL_FPS 30

/* dnl :sect: Prototypes
 */

/* Placing these in a common header allows them to be called from any of our
 * C translation units. Specifically, from the OS-specific unit that will call
 * setup/frame iteration as the OS is ready for them.
 */

int ogl_opengl_setup();
int ogl_opengl_frame();
void ogl_cube();

/* And of course, terminate our include guard started above:
 */

#endif /* !OGLDEFS_H */

