
/* dnl :title: OpenGL 1.0: Part 1
 */

/* iwz_img(
 *    [/images/opengl/opengl01.png],
 *    [The inside of a colorful cube rendered in a window.])
 */

/* Include The system OpenGL header for constants and functions used below.
 * Also include mini.h, a header with some program-specific constants we'll
 * also be using.
 */
#include <GL/gl.h>
#include "mini.h"

/* A setup function to be called once from our wrapper program during
 * initialization. This is C89, so all of the variables are declared up front!
 */
int mini_opengl_setup() {
   int retval = 0;
   float aspect_ratio = 0;
   float rzoom = 0;

   /* Set the viewport to the size of the window. This is not strictly
    * necessary in some implementations. However, some other implementations
    * will behave weirdly if it's not done, so it's best to just always do it.
    */
   /* Reminder that the iwz_var(MINI_SCREEN_W) and iwz_var(MINI_SCREEN_H)
    * constants are defined in iwz_filename(mini.h)!
    */
   glViewport( 0, 0, MINI_SCREEN_W, MINI_SCREEN_H );

   /* Calculate the aspect ratio of the screen as a float, which we will
    * use to determine the properties of our frustum.
    */
   aspect_ratio = MINI_SCREEN_W / MINI_SCREEN_H;
  
   /* Change the state of the OpenGL machine so that further commands will
    * affect the projection matrix. We are doing this now so that we can setup
    * our projection!
    */
   glMatrixMode( GL_PROJECTION );

   /* Reset the matrix properties to defaults... we haven't done anything yet,
    * so this will probably not do anything, but it's good hygeine.
    */
   glLoadIdentity();

   /* Setup the frustum... this distorts the lines drawn by the rasterizer, so
    * that objects appear to have depth.
    */
   /* There are more complicated explanations regarding the math elsewhere,
    * but the bottom line is that the smaller the iwz_var(rzoom) variable
    * is, the closer everything appears to the "camera," or point-of-view.
    */
   rzoom = 1.0f;
   glFrustum(
      -1.0f * rzoom * aspect_ratio,
      rzoom * aspect_ratio,
      -1.0f * rzoom,
      rzoom,
      0.5f, 20.0f );

   /* Change the state of the OpenGL machine back so that further commands will
    * affect the model matrix, now that we've setup our projection above.
    */
   glMatrixMode( GL_MODELVIEW );

   /* Set the clear color. Here we've chosen a sensible default of black.
    */
   glClearColor( 0, 0, 0, 0 );

   /* And our standard cleanup code:
    */
   return 0;
}

/* A function to be called several times a second from our wrapper program to
 * draw each frame on-screen before the wrapper flips the buffer.
 */
int mini_opengl_frame() {
   int retval = 0;

   /* Clear the screen so we can draw a new frame.
    */
   glClear( GL_COLOR_BUFFER_BIT );

   /* Create a new matrix frame which will be affected by further calls to e.g.
    * iwz_func(glTranslatef()) or iwz_func(glScalef()). We could also just call
    * iwz_func(glLoadIdentity()) on the current matrix frame, but
    * pushing/popping is a good habit to get into, as it will make some
    * trickier things we want to do later much simpler!
    */
   glPushMatrix();

   /* Create the vertices for a multi-colored cube (see iwz_filename(minicube.c)
    * for details).
    */
   mini_cube();

   /* Pop the matrix frame we created at the beginning of this frame.
    */
   glPopMatrix();

   /* Send all drawing commands to the screen!
    */
   glFlush();

   /* And our standard cleanup code:
    */
   return 0;
}

