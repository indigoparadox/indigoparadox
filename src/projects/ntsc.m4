divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title],[The indigoparadox Web Zone: NTSC])
divert(0)include([header.m4])
iwz_p([This page documents our adventures with simulated NTSC/CRT effects, typically using the iwz_a([https://github.com/LMP88959/NTSC-CRT], [NTSC-CRT library by LMP88959]). We have condensed this library to a single header and inserted it into the rendering paths of various softwares to great and amusing effect.])

iwz_sect([doomgeneric])

iwz_video(
   [/images/ntsc/ntsc-doomg1.mp4],
   [A few seconds of wandering through the first map of FreeDoom. The screen is very fuzzy, with poor vertical hold and visible interlacing.])

iwz_p([This was a relatively quick iwz_a([https://github.com/indigoparadox/doomgeneric/commit/d9c909455422c4cec6c087adeb598a6ce06fe1ae], [single-commit]) job, which breaks down roughly as follows:])

iwz_p([First, we included the iwz_filename([ntsc.h]) single-file header mentioned above and shimmed an additional framebuffer (iwz_var([ntsc_buffer])), as well as the iwz_struct([NTSC_SETTINGS]) and iwz_struct([CRT]) structs into the start of iwz_filename([doomgeneric_xlib.c]).])

iwz_diff(
   [doomgeneric_xlib.c],
   iwz_diffl([a], [16], [#ifdef DG_NTSC])
   iwz_diffl([a], [17], [#define NTSC_C])
   iwz_diffl([a], [18], [#include "ntsc.h"])
   iwz_diffl([a], [19], [])
   iwz_diffl([a], [20], [static uint32_t* ntsc_buffer = NULL;])
   iwz_diffl([a], [21], [static struct NTSC_SETTINGS ntsc;])
   iwz_diffl([a], [22], [static struct CRT crt;])
   iwz_diffl([a], [23], [static int ntsc_field = 0;])
   iwz_diffl([a], [24], [#endif /* DG_NTSC */])
)

iwz_p([Next, in the iwz_func([DG_Init()]) function, we allocated the new framebuffer (iwz_var([ntsc_buffer])) to hold a 32-bit word for every pixel on the screen. We then setup the iwz_struct([CRT]) struct to point to that framebuffer for its output and turned on scanlines, and we setup the iwz_struct([NTSC_SETTINGS]) struct with the sizing and pixel format information for the incoming framebuffer (iwz_var([DG_ScreenBuffer])), which we also added a pointer to.])

iwz_p([This is a pretty simple and intuitive pattern... The iwz_struct([NTSC_SETTINGS]) struct processes the incoming framebuffer before passing the resulting data off to the iwz_struct([CRT]) struct to display!])

iwz_diff(
   [doomgeneric_xlib.c],
   iwz_diffl([a], [110], [#ifdef DG_NTSC])
   iwz_diffl([a], [111],
      [    ntsc_buffer = malloc( DOOMGENERIC_RESX * DOOMGENERIC_RESY * 4 );])
   iwz_diffl([a], [112], [])
   iwz_diffl([a], [113], [    /* Initialize CRT buffer. */])
   iwz_diffl([a], [114], [    crt_init(])
   iwz_diffl([a], [115], [       &crt, DOOMGENERIC_RESX, DOOMGENERIC_RESY,])
   iwz_diffl([a], [116],
      [       CRT_PIX_FORMAT_RGBA, (unsigned char*)ntsc_buffer );])
   iwz_diffl([a], [117], [    crt.blend = 1;])
   iwz_diffl([a], [118], [    crt.scanlines = 1;])
   iwz_diffl([a], [119], [])
   iwz_diffl([a], [120], [    ntsc.data = (unsigned char*)DG_ScreenBuffer;])
   iwz_diffl([a], [121], [    ntsc.format = CRT_PIX_FORMAT_RGBA;])
   iwz_diffl([a], [122], [    ntsc.w = DOOMGENERIC_RESX;])
   iwz_diffl([a], [123], [    ntsc.h = DOOMGENERIC_RESY;])
   iwz_diffl([a], [124], [    ntsc.as_color = 1;])
   iwz_diffl([a], [125], [    ntsc.raw = 1;])
   iwz_diffl([a], [126], [#endif /* DG_NTSC */])
)

iwz_p([We also inserted the new framebuffer (iwz_var([ntsc_buffer])) into the iwz_func([XCreateImage()]) call, so that we would be drawing the output of the iwz_struct([CRT]) struct, and not the (now intermediate-stage) iwz_var([DG_ScreenBuffer]) framebuffer.])

iwz_diff(
   [doomgeneric_xlib.c],
   iwz_diffl([d], [124], [    s_Image = XCreateImage(s_Display, DefaultVisual(s_Display, s_Screen), depth, ZPixmap, 0, (char *)DG_ScreenBuffer, DOOMGENERIC_RESX, DOOMGENERIC_RESX, 32, 0);])
   iwz_diffl([a], [152], [    s_Image = XCreateImage(s_Display, DefaultVisual(s_Display, s_Screen), depth, ZPixmap, 0,])
   iwz_diffl([a], [153], [#ifdef DG_NTSC])
   iwz_diffl([a], [154], [    (char *)ntsc_buffer,])
   iwz_diffl([a], [155], [#else])
   iwz_diffl([a], [156], [    (char *)DG_ScreenBuffer,])
   iwz_diffl([a], [157], [#endif /* DG_NTSC */])
   iwz_diffl([a], [158], [    DOOMGENERIC_RESX, DOOMGENERIC_RESX, 32, 0);])
)

iwz_p([Finally, in the iwz_func([DG_DrawFrame()]) function, we call the iwz_func([crt_modulate()])/iwz_func([crt_demodulate()]) to apply the transformation on every frame. We also flip the field/frame bits between frames, as this seems to be necessary? Worth noting, as well, is that we hard-coded the noise value to 52 (which is rather high, but matches our preference). In a future refinement, this should be more easily configurable!])

iwz_diff(
   [doomgeneric_xlib.c],
   iwz_diffl([a], [185], [#ifdef DG_NTSC])
   iwz_diffl([a], [186], [        ntsc.field = ntsc_field & 1;])
   iwz_diffl([a], [187], [        if( 0 == ntsc.field ) {])
   iwz_diffl([a], [188], [            ntsc.frame ^= 1;])
   iwz_diffl([a], [189], [        }])
   iwz_diffl([a], [190], [        crt_modulate( &crt, &ntsc );])
   iwz_diffl([a], [191], [        crt_demodulate( &crt, 52 /* noise */ );])
   iwz_diffl([a], [192], [        ntsc_field ^= 1;])
   iwz_diffl([a], [193], [#endif /* DG_NTSC */])
)

iwz_p([This is enough to give us the effect demonstrated in the video above, albeit in a rather quick and dirty fashion. One flaw that is immediately apparent is the strange discrepency that arises from the high output resolution. A real CRT using NTSC with that type of noise would not have a resolution of 640x480! We might investigate turning down the output resolution of the iwz_struct([CRT]) struct, providing a more realistic scaled image.])

iwz_sect([maug Under *nix (SDL)])

iwz_block_construction()

iwz_video(
   [/images/ntsc/ntsc-aleggo.mp4],
   [Fuzzy NTSC-style rendering of a gray isometric field with some red bricks stacked. A mouse cursor moves around and stacks some green bricks. It looks like found footage and is very cool.])

iwz_sect([maug Under Windows])

iwz_video(
   [/images/ntsc/ntsc-mbean.mp4],
   [mbean, a minimal clone of Puyo Puyo, running under Windows NT 4. The colors are kind of blurred and washed out.])

iwz_toc

include([footer.m4])
