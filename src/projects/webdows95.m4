divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title], [Webdows 95])
define([iwz_section], [projects])
divert(0)include([header.m4])

iwz_iframe_proj([webdows95])

iwz_p([This is a simulacrum that we started putting together a few years ago. On the surface, it's very similar to Windows 95, though the missing features become apparent very quickly while using it. Whatever. It's fun!])

iwz_sect([Browser 95])

iwz_p([This browser proxies all requests through the Wayback machine to maintain period accuracy. Despite that, it's an iframe, so if Webdows 95 works in your browser then Browser 95 will support quite a lot more features than a period-accurate browser would!])

iwz_sect([CD Player])

iwz_p([Featuring the excellent music of iwz_a([https://bodyendtag.bandcamp.com/], [&lt;/body&gt;]) (with permission!) Put it on in the background while you explore this retro-scape!])

iwz_sect([Explorer and Prompt])

iwz_block_construction

iwz_p([The folder windows, prompt, and the mechanism by which the Windows "applications" are launched are all linked together by this abstraction. Applications are JavaScript files which contain metadata and jQuery-based hooks which can be called by other applications and the system.])

iwz_p([Similar to the real Windows 95, much of the interesting user interface stuff is in iwz_filename([/apps/explorer.js]). The actual API and paths are different. This requires more documentation, which may happen someday! In the meantime, please feel free to browse iwz_a_repo([the Webdows 95 repository], [indigoparadox], [webdows95])!])

include([footer.m4])
