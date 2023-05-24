
define([iwz_count_args], [$#])

define([iwz_enum_styles], [ifelse([$1], [],, [<link href="$1" rel="stylesheet" type="text/css" />shift($@)])])

define([iwz_enum_scripts], [ifelse([$1], [],, [<script src="$1" type="application/javascript"></script>shift($@)])])

define([iwz_num_src_lines], 0)

define([iwz_count_src_lines], [define([iwz_num_src_lines], eval(iwz_num_src_lines + 1)) iwz_num_src_lines])

define([iwz_dlsrc], [<p class="iwz-dlsrc">This page was generated from a source code file. <a href="$1">Click here to download</a> the file this page was generated from.</a></p>])

define([iwz_section_class], [ifdef([iwz_section], [ifelse(iwz_section, [$1], [iwz-section-active ])])iwz-section-$1])

define([iwz_breadcrumbs], [<a class="iwz-breadcrumbs" href="/iwz_section">Back to iwz_section</a>])

define([iwz_iframe_proj], [<iframe src="https://$1.indigoparadox.zone" width="800" height="650" class="iwz-iframe-proj iwz-iframe-$1" frameborder="0" scrolling="no"></iframe>])

define([iwz_twt_line], [ifelse([$1], [],, [<p>$1</p>iwz_twt_line(shift($@))])])

define([iwz_twt], [<div class="iwz-twt">iwz_twt_line($@)</div>])

define([iwz_usafe], [patsubst($1,[\W],[-])])

define([iwz_toc], [])

define([iwz_index], 0)

define([iwz_sect], [define([iwz_index],eval(iwz_index+1))define([iwz_toc],iwz_toc <li><a href="#iwz_usafe($1)">$1</a></li>)<a id="iwz_usafe($1)"></a><h3>iwz_index. $1</h3>])

define([iwz_subsect], [<h4>$1</h4>])

define([iwz_p], [ifelse(iwz_count_args($@),2,
   [<p class="$1">$2</p>], [<p>$1</p>])])

define([iwz_span], [<span class="$1">$2</span>])

define([iwz_a], [ifelse(iwz_count_args($@),3,
   [<a class="$1" href="$2">$3</a>], [<a href="$1">$2</a>])])

define([iwz_a_ipage], [<a href="$1">$2</a>])

dnl If we change repo hosting in the future, we can put the new link info here:
define([iwz_a_repo], [<a href="ifelse([$4], [],
   [https://github.com/$2/$3],
   [https://github.com/$2/$3/commit/$4])">$1</a>])

define([iwz_list], [<ul>$1</ul>])

define([iwz_li], [<li>$1</li>])

define([iwz_img], [<img class="iwz-img" src="$1" alt="$2" title="$2" />])

define([iwz_video], [<video controls class="iwz-video" src="$1" title="$2"></video>])

define([iwz_func], [<span class="iwz-func">$1</span>])

define([iwz_var], [<span class="iwz-var">$1</span>])

define([iwz_struct], [<span class="iwz-struct">$1</span>])

define([iwz_filename], [<span class="iwz-filename">$1</span>])

define([iwz_cmd], [<span class="iwz-cmd">$1</span>])

define([iwz_depfiles], [<div class="iwz-depfiles"><p>This source file also depends on the files below:</p><ul>$1</ul></div>]);

define([iwz_depfile], [<li><a href="$1">$1</a></li>])

define([iwz_code_ln], [<div class="iwz-code-line">$1</div>])

define([iwz_diffl],
   [<tr class="ifelse([$1], [a], iwz-code-add, ifelse([$1], [d], iwz-code-remove, iwz-code-neutral))"><td>$2</td><td class="iwz-code-line">$3</td></tr>])

define([iwz_diff], [<table class="iwz-code-wrapper"><caption class="iwz-code-title">$1</caption><tbody>$2</tbody></table>])

define([iwz_proj_tag_links],
   [ifelse([$1],[],, 
      [<li><a class="iwz-button" href="#">$1</a></li> iwz_proj_tag_links(shift($@))])])

define([iwz_proj_link_parts],
   [ifelse([$2],[],, 
      [<li><a class="iwz-card-link iwz-button" href="$2">Part $1</a></li> 
         iwz_proj_link_parts(eval($1+1), shift(shift($@)))])])

define([iwz_proj_tag_classes],
   [ifelse([$1],[],,
      [iwz-tag-$1 iwz_proj_tag_classes(shift($@))])])

define([iwz_proj_card],
   [<div class="iwz-card iwz-project iwz_proj_tag_classes($5)">
      <div class="iwz-card-header">
         <h3 class="iwz-card-title">$1</h3>
         <ul class="iwz-card-tags">iwz_proj_tag_links($5)</ul>
      </div>
      <p class="iwz-card-desc">$4</p>
      <ul class="iwz-card-links">
         ifelse(iwz_count_args($2),1,
            [<li><a class="iwz-card-link iwz-button" href="$2">$1</a></li>],
            [iwz_proj_link_parts(1,$2)])
      </ul>
   </div>])

define([iwz_tut_part],
   [<a href="$1">Part 1</a>])

define([iwz_block_construction],
   [<div class="iwz-block iwz-construction">
      <p>This section is under construction!</p>
      <p>Please stay tuned for updates pending research and development.</p>
   </div>])

define([iwz_block_quality],
   [<div class="iwz-block iwz-quality">
      <p>This section has been integrated from a previous web zone or forum post with minimal modification to preserve images or accessibility.</p>
      <p>It may be out of date, and/or not adhere to style or quality guidelines maintained by the rest of this web zone.</p>
   </div>])

define([iwz_let_us_know], [iwz_a([https://github.com/indigoparadox/indigoparadox/issues], [let us know])])

