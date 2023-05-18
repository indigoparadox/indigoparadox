
#include <GL/gl.h>

#include "mini.h"

int mini_opengl_setup() {
   int retval = 0;
   float aspect_ratio = 0;

   /* Set the viewport to the size of the window. This is not strictly
    * necessary in some implementations. However, some other implementations
    * will behave weirdly if it's not done, so it's best to just always do it.
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
    * that objects appear to have depth. You can tweak the numbers to adjust
    * said distortion, but it's not something I've 100% mastered yet.
    */
   glFrustum(
      -1.0f * aspect_ratio, aspect_ratio,
      -1.0f, 1.0f,
      0.5f, 20.0f );

   /* Change the state of the OpenGL machine back so that further commands will
    * affect the model matrix, now that we've setup our projection above.
    */
   glMatrixMode( GL_MODELVIEW );

   /* Set the clear color. Here we've chosen a sensible default of black.
    */
   glClearColor( 0, 0, 0, 0 );

   return 0;
}

int mini_opengl_frame() {
   int retval = 0;

   /* Clear the screen so we can draw a new frame. */
   glClear( GL_COLOR_BUFFER_BIT );

   /* Create a new matrix frame which will be affected by further calls to e.g.
    * glTranslatef() or glScalef(). We could also just call glLoadIdentity()
    * on the current matrix frame, but pushing/popping is a good habit to get
    * into, as it will make some trickier things we want to do later much
    * simpler!
    */
   glPushMatrix();

   /* Create the vertices for a multi-colored cube (see minicube.c for details).
    */
   mini_cube();

   /* Pop the matrix frame we created at the beginning of this frame.
    */
   glPopMatrix();

   /* Send all drawing commands to the screen!
    */
   glFlush();

   return 0;
}

