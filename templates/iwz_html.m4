
define(`iwz_p', `<p>$1</p>')

define(`iwz_sect', `<h3>$1</h3>')

define(`iwz_a', `<a href="$1">$2</a>')

define(`iwz_img', `<img class="iwz-img" src="$1" alt="$2" title="$2" />')

define(`iwz_video', `<video controls class="iwz-video" src="$1" title="$2"></video>')

define(`iwz_func', `<span class="iwz-func">$1</span>')

define(`iwz_var', `<span class="iwz-var">$1</span>')

define(`iwz_struct', `<span class="iwz-struct">$1</span>')

define(`iwz_filename', `<span class="iwz-filename">$1</span>')

define(`iwz_code_ln', `<div class="iwz-code-line">$1</div>')

define(`iwz_diffl',
   `<tr class="ifelse(`$1', `a', iwz-code-add, ifelse(`$1', `d', iwz-code-remove,))"><td>$2</td><td class="iwz-code-line">$3</td></tr>')

define(`iwz_diff', `<table class="iwz-code-wrapper"><caption class="iwz-code-title">$1</caption><tbody>$2</tbody></table>')

define(`iwz_proj_tag_links',
   `ifelse(`$1',`',, 
      `<li><a href="">$1</a></li> iwz_proj_tag_links(shift($@))')')

define(`iwz_count', `$#')

define(`iwz_proj_link_parts',
   `ifelse(`$2',`',, 
      `<li><a class="iwz-card-link" href="$2">Part $1</a></li> 
         iwz_proj_link_parts(eval($1+1),shift(shift($@)))')')

define(`iwz_proj_tag_classes',
   `ifelse(`$1',`',,
      `iwz-tag-$1 iwz_proj_tag_classes(shift($@))')')

define(`iwz_proj_card',
   `<div class="iwz-card iwz-project iwz_proj_tag_classes($5)">
      <div class="iwz-card-header">
         <h3 class="iwz-card-title">$1</h3>
         <ul class="iwz-card-tags">iwz_proj_tag_links($5)</ul>
      </div>
      <p class="iwz-card-desc">$4</p>
      <ul class="iwz-card-links">
         ifelse(iwz_count($2),1,
            `<li><a class="iwz-card-link" href="$2">$1</a></li>',
            `iwz_proj_link_parts(1,$2)')
      </ul>
   </div>')

define(`iwz_tut_part',
   `<a href="$1">Part 1</a>')

define(`iwz_block_construction',
   `<div class="iwz-construction">
      <p>This section is under construction!</p>
      <p>Please stay tuned for updates pending research and development.</p>
   </div>')

