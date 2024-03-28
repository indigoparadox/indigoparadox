
define([iwz_count_args], [$#])

define([iwz_enum_styles], [ifelse([$1], [],, [<link href="$1" rel="stylesheet" type="text/css" />iwz_enum_styles(shift($@))])])

define([iwz_enum_scripts], [ifelse([$1], [],, [<script src="$1" type="application/javascript"></script>iwz_enum_scripts(shift($@))])])

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

define([iwz_index_sub], 0)

define([iwz_sect], [
   define([iwz_index], eval(iwz_index+1))
   define([iwz_index_sub], 0)
   define([iwz_toc], iwz_toc <li><a href="#iwz_usafe($1)">$1</a></li>)
   <a id="iwz_usafe($1)"></a><h3 class="iwz-sect-header"><span class="iwz-sect-idx">iwz_index.</span> $1</h3>])

define([iwz_subsect], [
   define([iwz_index_sub], eval(iwz_index_sub+1))
   <a id="iwz_index-iwz_usafe($1)"></a><h4 class="iwz-subsect-header"><span class="iwz-subsect-idx">iwz_index - iwz_index_sub.</span> $1</h4>])

define([iwz_p], [ifelse(iwz_count_args($@),2,
   [<p class="$1">$2</p>], [<p>$1</p>])])

define([iwz_span], [<span class="$1">$2</span>])

define([iwz_a_amazon], [ifelse(iwz_count_args($@),3,
   [<a class="iwz-link iwz-link-amazon $1" href="$2">$3</a>],
   [<a class="iwz-link iwz-link-amazon" href="$1">$2</a>])])

define([iwz_a], [ifelse(iwz_count_args($@),3,
   [<a class="iwz-link iwz-link-ext $1" href="$2">$3</a>],
   [<a class="iwz-link iwz-link-ext" href="$1">$2</a>])])

define([iwz_a_social], [ifelse(iwz_count_args($@),3,
   [<a class="iwz-link iwz-link-social $1" href="$2">$3</a>],
   [<a class="iwz-link iwz-link-social" href="$1">$2</a>])])

define([iwz_a_file], [ifelse(iwz_count_args($@),3,
   [<a class="iwz-link iwz-link-file $1" href="$2">$3</a>],
   [<a class="iwz-link iwz-link-file" href="$1">$2</a>])])

define([iwz_a_button], [ifelse(iwz_count_args($@),3,
   [<a class="iwz-link $1" href="$2">$3</a>],
   [<a class="iwz-link" href="$1">$2</a>])])

define([iwz_a_webring], [ifelse(iwz_count_args($@),3,
   [<a class="iwz-link-webring $1" href="$2">$3</a>],
   [<a class="iwz-link-webring" href="$1">$2</a>])])

define([iwz_a_ipage], [<a href="$1">$2</a>])

define([iwz_a_anchor], [ifelse(iwz_count_args($@),3,
   [<a class="iwz-link-anchor $1" href="$2">$3</a>],
   [<a class="iwz-link-anchor" href="$1">$2</a>])])

dnl If we change repo hosting in the future, we can put the new link info here:
define([iwz_a_repo], [<a class="iwz-link iwz-link-repo" href="ifelse([$4], [],
   [https://github.com/$2/$3],
   [https://github.com/$2/$3/commit/$4])">$1</a>])

define([iwz_b], [<span class="iwz-span-bold">$1</span>])

define([iwz_list], [<ul>$1</ul>])

define([iwz_li], [<li>$1</li>])

define([iwz_img], [<img class="iwz-img" src="$1" alt="$2" title="$2" />])

define([iwz_video], [<video controls class="iwz-video" src="$1" title="$2"></video>])

define([iwz_func], [<span class="iwz-func">$1</span>])

define([iwz_var], [<span class="iwz-var">$1</span>])

define([iwz_struct], [<span class="iwz-struct">$1</span>])

define([iwz_filename], [<span class="iwz-filename">$1</span>])

define([iwz_cmd], [<span class="iwz-cmd">$1</span>])

define([iwz_errorm], [<span class="iwz-errorm">$1</span>])

define([iwz_depfiles], [<div class="iwz-depfiles"><p>This source file also depends on the files below:</p><ul>$1</ul></div>]);

define([iwz_depfile], [<li><a href="$1">$1</a></li>])

define([iwz_code_ln], [<div class="iwz-code-line">$1</div>])

define([iwz_diffl],
   [<tr class="ifelse([$1], [a], iwz-code-add, ifelse([$1], [d], iwz-code-remove, iwz-code-neutral))"><td>$2</td><td class="iwz-code-line">$3</td></tr>])

define([iwz_diff], [<table class="iwz-code-wrapper"><caption class="iwz-code-title">$1</caption><tbody>$2</tbody></table>])

define([iwz_block_table_head], [<th>$1</th>])

define([iwz_block_table_cell], [<td>$1</td>])

define([iwz_block_table_row], [<tr>$1</tr>])

define([iwz_block_table], [<div class="iwz-block $3"><table class="iwz-table"><thead><tr>$1</tr></thead><tbody>$2</tbody></table></div>])

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

define([iwz_block_pcspec_line], [ifelse([$1], [],, [<tr><td class="iwz-pcspec-key">$1</td><td class="iwz-pcspec-value">$2</td>iwz_block_pcspec_line(shift(shift($@)))])])

define([iwz_block_pcspec], [<div class="iwz-block iwz-pcspec"><table class="iwz-pcspec-table">iwz_block_pcspec_line($@)</table><p class="iwz-pcspec-note">This information pertains to a particular specimen and may reflect upgrades, repairs, modifications, or factory options not present by default.</p></div>])

define([iwz_refs], [<ol class="iwz-refs">$1<ol>])

define([iwz_ref], [<li>iwz_a([$1], [$2])</li>])

define([iwz_suml], [<dl class="iwz-sum-list">$1</dl>])

define([iwz_suml_item], [<dt class="iwz-sum-list-item">$1</dt><dd class="iwz-sum-list-desc">$2</dd>])

define([iwz_let_us_know], [iwz_a([https://github.com/indigoparadox/indigoparadox/issues], [let us know])])

define([iwz_profile_pic], [<div class="iwz-icon-profile iwz-icon-profile-$1"> <div class="iwz-icon-profile-nocollapse-top"></div> <div class="iwz-icon-profile-hair"> <div class="iwz-icon-profile-face"> <div class="iwz-icon-profile-eyes"> <div class="iwz-icon-profile-eyebrow iwz-icon-profile-brow-left"></div> <div class="iwz-icon-profile-eye iwz-icon-profile-eye-left"> <div class="iwz-icon-profile-eye-iris"> <div class="iwz-icon-profile-eye-pupil"></div> </div> </div> <div class="iwz-icon-profile-eyebrow iwz-icon-profile-brow-right"></div> <div class="iwz-icon-profile-eye iwz-icon-profile-eye-right"> <div class="iwz-icon-profile-eye-iris"> <div class="iwz-icon-profile-eye-pupil"></div> </div> </div> </div> </div> <div class="iwz-icon-profile-collar iwz-icon-profile-cllrleft"></div> <div class="iwz-icon-profile-collar iwz-icon-profile-cllright"></div> <div class="iwz-icon-profile-neck"></div> </div> <div class="iwz-icon-profile-shoulders"> <div class="iwz-icon-profile-arms"> <div class="iwz-icon-profile-necktie"></div> <div class="iwz-icon-profile-pocket"></div> </div> </div> </div>])

define([iwz_head_counter], [ifelse(IWZ_PROD, 1, [<script data-goatcounter="https://indigoparadox.goatcounter.com/count" async src="//gc.zgo.at/count.js"></script>])])

define([iwz_alt_os], [<dt class="iwz-alt-os-name"><a class="iwz-alt-os-link" href="$2">$1</a></dt><dd class="iwz-alt-os-desc">$3</dd>])

