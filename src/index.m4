divert(-1)
changecom()
changequote(`[', `]') 
define([iwz_root], 1)
define([iwz_section], [home])
define([iwz_root], 1)
define([iwz_aux_scripts], [[/scripts/iwz_mfeed.js]])
define([iwz_aux_styles], [[/styles/iwz_mfeed.css], [/styles/iwz_profile.css]])
include([iwz_html.m4])
divert(0)include([header.m4])

iwz_p([Welcome to the place on the web where we infodump on our hyperfixations and special interests in (somewhat) long form. It's not the first, but we hope it's the best so far.])

iwz_p([Most of the information here was logged by us to remind us how we did something in case it's useful later. Some of it was found in physical books, or buried in some dusty forgotten corner of the Internet Archive. We've tried to organize it so that it's useful.])

iwz_p([If there are omissions, factual errors, or areas that could use elaboration, please feel free to iwz_let_us_know!])

<div class="iwz-mastodon-feed"></div>

iwz_p([iwz-webring iwz-hotline], [iwz_a([iwz-button], [https://hotlinewebring.club/indigoparadox/previous], [Previous]) iwz_a([iwz-hotline-hotline], [https://hotlinewebring.club/], [Hotline Webring]) iwz_a([iwz-button], [https://hotlinewebring.club/indigoparadox/next], [Next])])

iwz_p([iwz-webring iwz-retronaut], [iwz_a([iwz-button], [https://webring.dinhe.net/prev/https://indigoparadox.zone/], [Previous]) iwz_a([https://webring.dinhe.net/], [Retronaut Webring]) iwz_a([iwz-button], [https://webring.dinhe.net/next/https://indigoparadox.zone/], [Next])])

include([footer.m4])
