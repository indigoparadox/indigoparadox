
define(`iwz_proj_tag_links',
   `ifelse(`$1',`',, `regexp(`$1',
      `\([a-z0-9\-]*\),?\([a-z0-9,\-]*\)?',
      `<a href="">\1</a> iwz_proj_tag_links(`\2')')')')

define(`iwz_proj_tag_classes',
   `ifelse(`$1',`',, `regexp(`$1',
      `\([a-z0-9\-]*\),?\([a-z0-9,\-]*\)?',
      `iwz-tag-\1 iwz_proj_tag_classes(`\2')')')')

define(`iwz_proj_card',
   `<div class="iwz-card iwz-project iwz_proj_tag_classes(`$5')">
      <h3><a href="$2">$1</a></h3>
      <p>$4</p>
      <div class="iwz-tags">iwz_proj_tag_links(`$5')</div>
   </div>')

