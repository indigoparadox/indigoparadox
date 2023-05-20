
/* dnl :title: OpenGL 1.0: Win32-Specific
 */

/* Include The system iwz_filename(windows.h) header for constants and
 * functions used below. This pulls in the system OpenGL headers automatically.
 */
/* Also include mini.h, a header with some program-specific constants we'll
 * also be using.
 */
#include <windows.h>
#include "mini.h"

/* Define a window style which we will use later in our calls to
 * iwz_func(AdjustWindowRect()) and iwz_func(CreateWindow()).
 */
#define WIN_STYLE (WS_OVERLAPPEDWINDOW & ~WS_MAXIMIZEBOX & ~WS_THICKFRAME)

/* Define an arbitrary timer ID to use later in our call to
 * iwz_func(SetTimer()). Please see the note before the iwz_var(WM_TIMER)
 * handler code in iwz_func(WndProc()), below, for more information.
 */
#define WIN_TIMER_ID 1000

/* Setup the window message processing callback. This will be called for each
 * Win32 message received by the application window and defines how the window
 * will respond.
 */
LRESULT CALLBACK WndProc(
   HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam
) {
   /* Define the hGLRC statically so that we can create it in one call and
    * dispose of it later on in a different call when it is no longer needed.
    */
   static HGLRC hrc = 0;
   int pixel_fmt_int = 0;
   HDC hdc = 0;
   /* Provide some parameters for Windows to pass to the driver and query
    * what available pixel formats match. In a more robust program, many
    * of these parameters would be defined from a configuration file or
    * registry settings, but for now, we're going to define them statically.
    */
   PIXELFORMATDESCRIPTOR pixel_fmt = {
      /* A struct size field and version, as is common in Win32-related structs.
       */
      sizeof( PIXELFORMATDESCRIPTOR ),
      1,
      /* This buffer will be drawn to a window (hWnd), support OpenGL,
       * and will use double-buffering with iwz_func(SwapBuffers()).
       */
      PFD_DRAW_TO_WINDOW | PFD_SUPPORT_OPENGL | PFD_DOUBLEBUFFER,
      /* This buffer will use non-indexed colors specified by RGB values.
       */
      PFD_TYPE_RGBA,
      /* This will be a 16-bit color buffer.
       */
      16,
      /* These values will not be used for now, and can be ignored.
       */
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      /* This is the size of the "cells" in the depth buffer. See
       * iwz_var(GL_DEPTH_TEST) in iwz_filename(opengl01.c) for more
       * information.
       */
      8,
      /* These values will not be used for now, and can be ignored.
       */
      0, 0,
      /* Specify the main plane.
       */
      PFD_MAIN_PLANE,
      /* These values will not be used for now, and can be ignored.
       */
      0, 0, 0, 0
   };

   /* Now that our variables are declared, let's handle the window message
    * we were called with this time!
    */
   switch( message ) {
   /* The iwz_var(WM_CREATE) message is received by the window when it is
    * created, so we'll act on it to setup an OpenGL context to render into for
    * the rest of the program.
    */
   case WM_CREATE:
      /* First, get the device context (hDC) associated with this window (hWnd).
       */
      hdc = GetDC( hWnd );

      /* Get the index of the pixel format which matches the descriptor
       * provided.
       */
      pixel_fmt_int = ChoosePixelFormat( hdc, &pixel_fmt );
      if( 0 == pixel_fmt_int ) {
         MessageBox( 0, "Unable to choose pixel format!", "OpenGL Error", 0 );
         break;
      }
      
      /* Set this window to use the pixel format found by
       * iwz_func(ChoosePixelFormat()).
       */
      if( !SetPixelFormat( hdc, pixel_fmt_int, &pixel_fmt ) ) {
         MessageBox( 0, "Unable to set pixel format!", "OpenGL Error", 0 );
         break;
      }

      /* Create an OpenGL context (hGLRC) associated with this window's
       * device context and make it the current OpenGL context for this
       * window.
       */
      hrc = wglCreateContext( hdc );
      if( 0 == hrc ) {
         MessageBox( 0, "Invalid hGLRC!", "OpenGL Error", 0 );
      }
      if( FALSE == wglMakeCurrent( hdc, hrc ) ) {
         MessageBox( 0, "Unable to set HGLRC!", "OpenGL Error", 0 );
         break;
      }
      break;

   /* The iwz_var(WM_TIMER) message is received when the timer we create
    * later with iwz_func(SetTimer()) reaches its interval. Some programs
    * might have multiple timers, in which case they would need to check the
    * iwz_var(wParam) parameter to see which timer is sending the message
    * and act accordingly. We only create one timer in this program, though.
    */
   case WM_TIMER:
      if( mini_opengl_frame() ) {
         MessageBox( 0, "Error", "OpenGL frame error.", 0 );
         PostQuitMessage( 1 );
      } else {
         /* As no error was returned by iwz_func(mini_opengl_frame()),
          * swap the double buffers so that the one we've been rasterizing to
          * is visible.
          */
         hdc = GetDC( hWnd );
         SwapBuffers( hdc );
      }
      break;

   /* The iwz_var(WM_DESTROY) message is received when the window is closing
    * (either because the user clicked the close button or the application
    * was terminated in some other way).
    */
   case WM_DESTROY:

      /* Reset this window back to the iwz_var(NULL) OpenGL context and destroy
       * the context we created earlier.
       */
      hdc = GetDC( hWnd );
      wglMakeCurrent( hdc, NULL );
      wglDeleteContext( hrc );

      /* Make sure we terminate the program, since the main window is closing.
       */
      PostQuitMessage( 0 );
      break;

   /* iwz_func(DefWindowProc()) will handle all messages not specifically
    * enumerated here.
    */
   default:
      return DefWindowProc( hWnd, message, wParam, lParam );
   }
}

/* This is the application entry point. In traditional C, this would be
 * defined as iwz_func(main()), and most modern Windows compilers can also
 * accept iwz_func(main()) as an entry point, but this gives us our
 * iwz_var(hInstance) and iwz_var(nCmdShow) simply, so we will use it for
 * our demonstration.
 */
int WINAPI WinMain(
   HINSTANCE hInstance, HINSTANCE hPrevInstance,
   LPSTR lpCmdLine, int nCmdShow
) {
   int retval = 0;
   int msg_retval = 0;
   WNDCLASS wc = { 0 };
   RECT wr = { 0, 0, 0, 0 };
   MSG msg;
   HWND hWnd = 0;

   /* Get the *real* dimensions of the window, including titlebar.
    */
   /* Reminder that the iwz_var(MINI_SCREEN_W) and iwz_var(MINI_SCREEN_H)
    * constants are defined in iwz_filename(mini.h)!
    */
   wr.right = MINI_SCREEN_W;
   wr.bottom = MINI_SCREEN_H;
   AdjustWindowRect( &wr, WIN_STYLE, FALSE );

   /* Create and register the window class, using iwz_func(WndProc()), which
    * we defined above, as the message processor. Use a generic arrow cursor
    * defined by iwz_var(IDC_ARROW) and (by default) gray background defined by
    * iwz_var(COLOR_BTNFACE). The class name is arbitrary, but we'll use it
    * when we create the actual window to associate it with this class.
    */
   memset( &wc, '\0', sizeof( WNDCLASS ) );
   wc.lpfnWndProc   = (WNDPROC)&WndProc;
   wc.hInstance     = hInstance;
   wc.hCursor       = LoadCursor( 0, IDC_ARROW );
   wc.hbrBackground = (HBRUSH)( COLOR_BTNFACE + 1 );
   wc.lpszClassName = "MiniTestGLClass";

   if( !RegisterClass( &wc ) ) {
      MessageBox( 0, "Error", "Could not register window class!", 0 );
      retval = 1;
      goto cleanup;
   }

   /* Create the actual window.
    */
   hWnd = CreateWindow
      /* Notice that we use the window class we defined above.
       */
      "MiniTestGLClass",
      /* Set the window title visible to the user to a generic string.
       */
      "Mini OpenGL Test",
      /* Use the window style we defined at the beginning of the source file.
       */
      WIN_STYLE,
      /* Use the default window position on the center of the active screen,
       * or thereabouts.
       */
      CW_USEDEFAULT, CW_USEDEFAULT,
      /* Use the window size adjusted by iwz_func(AdjustWindowRect()) above to
       * give the pixel dimensions we requested while accounting for the
       * title bar and decorations.
       */
      wr.right - wr.left, wr.bottom - wr.top,
      /* No menus or parent window, and use the iwz_var(hInstance) provided to
       * the initial call to iwz_func(WinMain()) by the OS.
       */
      0, 0, hInstance, 0
   );
   if( 0 == hWnd ) {
      MessageBox( 0, "Error", "Could not create window!", 0 );
   }

   /* Show the window we just created on-screen.
    */
   ShowWindow( hWnd, nCmdShow );

   /* Create a timer to refresh the screen. This will continually send the
    * iwz_var(WM_TIMER) message we're setup to handle in iwz_func(WndProc()).
    */
   if( !SetTimer( hWnd, WIN_TIMER_ID, (int)(1000 / MINI_FPS), NULL ) ) {
      MessageBox( 0, "Error", "Could not create graphics timer!", 0 );
      retval = 1;
      goto cleanup;
   }

   /* Call our generic OpenGL setup function defined in
    * iwz_filename(openglxx.c).
    */
   if( mini_opengl_setup() ) {
      MessageBox( 0, "Error", "OpenGL setup error.", 0 );
      PostQuitMessage( 1 );
   }

   /* Run the message-processing loop which will continually pass messages to
    * iwz_func(WndProc)
    */
   /* This will effectively call iwz_func(opengl_frame()) repeatedly via the
    * iwz_var(WM_TIMER) message generated by the timer we created earlier.
    */
   do {
      msg_retval = GetMessage( &msg, 0, 0, 0 );
      TranslateMessage( &msg );
      DispatchMessage( &msg );
   } while( 0 < msg_retval );

   /* Handle generic cleanup. There isn't much to cleanup in this minimal
    * example program, but putting things like calls to iwz_func(free()) after
    * the iwz_var(cleanup) label will allow them to still be called in an
    * error state by using iwz_func(goto) in the error handler, as opposed to
    * if the handler just iwz_func(return)ed directly.
    */
   /* Modern operating systems generally handle cleanup pretty well on their
    * own, but older versions of Windows tended to leak resources
    * (particularly GDI objects) for the whole operating system if those
    * resources were not cleaned up in every program that used them.
    */
cleanup:

   return retval;
}

