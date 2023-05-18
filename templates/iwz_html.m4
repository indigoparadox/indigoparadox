
define(`iwz_p', `<p>$1</p>')

define(`iwz_sect', `<h3>$1</h3>')

define(`iwz_a', `<a href="$1">$2</a>')

define(`iwz_img', `<img class="iwz-img" src="$1" alt="$2" title="$2" />')

define(`iwz_video', `<video controls class="iwz-video" src="$1" title="$2"></video>')

define(`iwz_func', `<span class="iwz-func">$1</span>')

define(`iwz_var', `<span class="iwz-var">$1</span>')

define(`iwz_struct', `<span class="iwz-struct">$1</span>')

define(`iwz_filename', `<span class="iwz-filename">$1</span>')

define(`iwz_diffl',
   `<tr class="ifelse(`$1', `a', iwz-code-add, ifelse(`$1', `d', iwz-code-remove,))"><td>$2</td><td class="iwz-code-line">$3</td></tr>')

define(`iwz_diff', `<table class="iwz-code-wrapper"><caption class="iwz-code-title">$1</caption><tbody>$2</tbody></table>')

define(`iwz_proj_tag_links',
   `ifelse(`$1',`',, `regexp(`$1',
      `\([a-z0-9\-]*\),?\([a-z0-9,\-]*\)?',
      `<li><a href="">\1</a></li> iwz_proj_tag_links(`\2')')')')

define(`iwz_proj_tag_classes',
   `ifelse(`$1',`',, `regexp(`$1',
      `\([a-z0-9\-]*\),?\([a-z0-9,\-]*\)?',
      `iwz-tag-\1 iwz_proj_tag_classes(`\2')')')')

define(`iwz_proj_card',
   `<div class="iwz-card iwz-project iwz_proj_tag_classes(`$5')">
      <h3 class="iwz-card-title"><a href="$2">$1</a></h3>
      <p class="iwz-card-desc">$4</p>
      <div class="iwz-card-tags"><ul>iwz_proj_tag_links(`$5')</ul></div>
   </div>')

