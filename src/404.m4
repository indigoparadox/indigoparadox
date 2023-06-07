divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title], [404])
define([iwz_section], [home])
define([iwz_aux_styles], [[/styles/iwz_error.css]])
divert(0)include([header.m4])

<div class="iwz-error-404">404</div>
<div class="iwz-button iwz-error-not-found"><h2>Error: 404</h2><p><span class="iwz-error-x">X</span>The requested page was not found! Maybe it was moved? Or experimental? Please try starting from iwz_a([/], [Home])!</p></div>

include([footer.m4])
