
/* dnl :title: OpenGL 1.0: Polygons
 */

/* dnl :section: tutorials
 */

/* dnl :sect: Preamble
 */

/* iwz_depfiles(
 *    iwz_depfile(ogldefs.html)
 * )
 */

/* Include The system OpenGL header for constants and functions used below.
 * Also include iwz_filename(ogldefs.h), a header with some program-specific
 * constants we'll also be using.
 */
#include <GL/gl.h>
#include "ogldefs.h"

/* dnl :sect: Polygon: Cube
 */

/* First, let's draw a simple multi-colored cube.
 */
void ogl_cube() {

   /* Now begin drawing the faces of the cube.
    */
   /* For each face, please note that the normals are orthogonal to the face.
    * If the face is at the base of the normal, the normal points directly
    * "upwards."
    */
   /* Please also note that the faces are defined in terms of triangles.
    * For most implementations of older OpenGL versions, quads are also an
    * option, but triangles are generally the most portable.
    */

   /* Draw the back face:
    */
   glBegin( GL_TRIANGLES );
   glNormal3f(     0,     0, 1.0f );
   glColor3f(   1.0f,     0,    0 );
   glVertex3f(  1.0f, -1.0f, 1.0f );
   glVertex3f(  1.0f,  1.0f, 1.0f );
   glVertex3f( -1.0f,  1.0f, 1.0f );

   glVertex3f( -1.0f,  1.0f, 1.0f );
   glVertex3f( -1.0f, -1.0f, 1.0f );
   glVertex3f(  1.0f, -1.0f, 1.0f );
   glEnd();
   
   /* Draw the right face:
    */
   glBegin( GL_TRIANGLES );
   glNormal3f(  1.0f,     0,     0 );
   glColor3f(      0 , 1.0f,     0 );
   glVertex3f(  1.0f, -1.0f, -1.0f );
   glVertex3f(  1.0f,  1.0f, -1.0f );
   glVertex3f(  1.0f,  1.0f,  1.0f );

   glVertex3f(  1.0f,  1.0f,  1.0f );
   glVertex3f(  1.0f, -1.0f,  1.0f );
   glVertex3f(  1.0f, -1.0f, -1.0f );
   glEnd();
   
   /* Draw the left face:
    */
   glBegin( GL_TRIANGLES );
   glNormal3f( -1.0f,     0,     0 );
   glColor3f(      0,     0,  1.0f );
   glVertex3f( -1.0f, -1.0f,  1.0f );
   glVertex3f( -1.0f,  1.0f,  1.0f );
   glVertex3f( -1.0f,  1.0f, -1.0f );

   glVertex3f( -1.0f,  1.0f, -1.0f );
   glVertex3f( -1.0f, -1.0f, -1.0f );
   glVertex3f( -1.0f, -1.0f,  1.0f );
   glEnd();

   /* Draw the front face:
    */
   glBegin( GL_TRIANGLES );
   glNormal3f(     0,     0, -1.0f );
   glColor3f(   1.0f,  1.0f,     0 );
   glVertex3f( -1.0f, -1.0f, -1.0f );
   glVertex3f( -1.0f,  1.0f, -1.0f );
   glVertex3f(  1.0f,  1.0f, -1.0f );

   glVertex3f(  1.0f,  1.0f, -1.0f );
   glVertex3f(  1.0f, -1.0f, -1.0f );
   glVertex3f( -1.0f, -1.0f, -1.0f );
   glEnd();
   
   /* Draw the top face:
    */
   glBegin( GL_TRIANGLES );
   glNormal3f(     0,  1.0f,     0 );
   glColor3f(      0,  1.0f,  1.0f );
   glVertex3f(  1.0f,  1.0f,  1.0f );
   glVertex3f(  1.0f,  1.0f, -1.0f );
   glVertex3f( -1.0f,  1.0f, -1.0f );

   glVertex3f( -1.0f,  1.0f, -1.0f );
   glVertex3f( -1.0f,  1.0f,  1.0f );
   glVertex3f(  1.0f,  1.0f,  1.0f );
   glEnd();
   
   /* Draw the bottom face:
    */
   glBegin( GL_TRIANGLES );
   glNormal3f(     0, -1.0f,     0 );
   glColor3f(   1.0f,  1.0f,  1.0f );
   glVertex3f(  1.0f, -1.0f, -1.0f );
   glVertex3f(  1.0f, -1.0f,  1.0f );
   glVertex3f( -1.0f, -1.0f,  1.0f );

   glVertex3f( -1.0f, -1.0f,  1.0f );
   glVertex3f( -1.0f, -1.0f, -1.0f );
   glVertex3f(  1.0f, -1.0f, -1.0f );
   glEnd();
}

