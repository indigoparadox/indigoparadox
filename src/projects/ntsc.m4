divert(-1)
define(`iwz_title',`The indigoparadox Web Zone: NTSC')
include(`proj.m4')
divert(0)include(`header.m4')

<p>This page documents our adventures with simulated NTSC/CRT effects, typically using the <a href="https://github.com/LMP88959/NTSC-CRT">NTSC-CRT library by LMP88959</a>. We have condensed this library to a single header and inserted it into the rendering paths of various softwares to great and amusing effect.</p>

<h3>doomgeneric</h3>

<p>This was a relatively quick <a href="https://github.com/indigoparadox/doomgeneric/commit/d9c909455422c4cec6c087adeb598a6ce06fe1ae">single-commit</a> job of shimming an additional framebuffer into the doomgeneric_xlib.c file and calling crt_modulate()/crt_demodulate() to apply the transformation on every frame.</p>

<h3>maug</h3>

<h4>maug Under *nix (SDL)</h4>

<h4>maug Under Windows</h4>
<video controls src="/images/ntsc-mbean.mp4">
 mbean, a minimal clone of Puyo Puyo, running under Windows NT 4. The colors are kind of blurred and washed out
</video>

include(`footer.m4')
