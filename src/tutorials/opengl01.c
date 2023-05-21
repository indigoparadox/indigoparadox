
/* dnl :title: OpenGL 1.0: Part 1
 */

/* iwz_img(
 *    [/images/opengl/opengl01.png],
 *    [The inside of a colorful cube rendered in a window.])
 */

/* dnl :sect: Introduction
 */

/* This is an "anti-tutorial" for working with OpenGL 1.0. A working example
 * is laid out below, along with the rationale for why certain things are
 * implemented the way they are.
 */
/* Please note that this may not be a good source for learning how to write
 * *modern* OpenGL code. This is specifically a guide for writing code
 * targeting older OpenGL implementations such as those found in early versions
 * of Windows NT or older video game consoles.
 */

/* dnl :sect: Compiling
 */

/* iwz_depfiles(
 *    iwz_depfile(oglwin.html)
 *    iwz_depfile(oglpoly.html)
 * )
 */

/* These files can be compiled together by adding them to your Borland or
 * Visual C IDE. You may also compile them by installing the MingW compiler
 * on your Linux distro (e.g. iwz_cmd([sudo apt install mingw-w64-i686-dev])
 * on recent Ubuntu) and using the command iwz_cmd([i686-w64-mingw32-gcc
 * -o opengl01.exe opengl01.c oglwin.c oglpoly.c -lopengl32 -lgdi32]) to
 * produce iwz_filename(opengl01.exe).
 */

/* dnl :sect: The Code
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

   /* Reset the matrix properties to defaults... We haven't done anything yet,
    * so this will probably not do anything, but it's good hygiene.
    */
   glLoadIdentity();

   /* Setup the frustum... This distorts the lines drawn by the rasterizer, so
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

   /* Enable face culling.
    */
   glEnable( GL_CULL_FACE );

   /* Renormalize normals after irregular transformations. We're not scaling
    * yet, and the normals specified in iwz_filename( minicube.c ) are all
    * 1.0f in length, so this probably isn't needed. But again, it's good
    * hygiene.
    */
   glEnable( GL_NORMALIZE );

   /* Enable lighting. This turns on shading and lights, which can be seen
    * in the iwz_func(mini_opengl_frame()) function below. Without lighting,
    * all polygons are rasterized flatly with the color specified by
    * iwz_func(glColor3f()).
    */
   glEnable( GL_LIGHTING );

   /* This allows colors specified by iwz_func(glColor3f()) to work with
    * lighting. If iwz_var(GL_COLOR_MATERIAL) is not enabled but
    * iwz_var(GL_LIGHTING) is, all polygons will be dark gray.
    */
   glEnable( GL_COLOR_MATERIAL );

   /* This creates a separate buffer which you can think of as overlaying the
    * framebuffer we're resterizing to. Each cell in this buffer contains a
    * number representing the "depth" of, or distance from the camera to each
    * polygon that's been resterized, as calculated based on their vertices.
    */
   /* Parts of polygons that are "farther" from the camera, "behind" other,
    * already-drawn polygons, are then not drawn. This may seem elementary, but
    * it must be enabled explicitly or polygons will overlap in strange ways!
    */
   /* The size of each "cell" in this depth buffer is determined in the
    * platform-specific portion of initialization (e.g. iwz_filename(oglwin.c)
    * or iwz_filename(oglsdl.c)).
    */
   glEnable( GL_DEPTH_TEST );

   /* And our standard cleanup code:
    */
   return 0;
}

/* A function to be called several times a second from our wrapper program to
 * draw each frame on-screen before the wrapper flips the buffer.
 */
int mini_opengl_frame() {
   static int rotate_y = 0;
   int retval = 0;

   /* Clear the screen so we can draw a new frame. Note that we are clearing
    * the color buffer (the visible framebuffer we have rasterized to in the
    * previous frame), as well as the depth buffer we created when we
    * enabled iwz_var(GL_DEPTH_TEST) above in iwz_func(mini_opengl_setup()).
    */
   glClear( GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT );

   /* Create a new matrix frame which will be affected by further calls to e.g.
    * iwz_func(glTranslatef()) or iwz_func(glScalef()). We could also just call
    * iwz_func(glLoadIdentity()) on the current matrix frame, but
    * pushing/popping is a good habit to get into, as it will make some
    * trickier things we want to do later much simpler!
    */
   glPushMatrix();

   /* Move the "camera" back by three units and rotate the cube to the current
    * angle defined by iwz_var(rotate_y).
    */
   /* Note that, while OpenGL is stateful in some respects, it does not
    * "remember" objects between frames. Each object must be re-drawn and
    * re-transformed for every frame!
    */
   glTranslatef( 0, 0, -3.0f );
   glRotatef( rotate_y, 0, 1.0f, 0 );

   /* Enable light #0. There can be multiple lights with various options, but
    * for now we'll stick with the default options of white, omnidirectional,
    * and centered.
    */
   glEnable( GL_LIGHT0 );

   /* Increment the Y rotation of the cube for the next frame.
    */
   rotate_y += 10;

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

