<!DOCTYPE html>
<html>
<head>
 <title>The indigoparadox Web ifdef([iwz_title], [Zone: iwz_title], [Zone])</title>
 <link href="/style.css" rel="stylesheet" type="text/css" />ifdef([iwz_aux_styles], [iwz_enum_styles(iwz_aux_styles)])
</head>
<body>
 <div class="iwz-header">
  <h1 class="iwz-title-iwz">The indigoparadox Web Zone</h1>
  ifdef([iwz_title], [<h2 class="iwz-title-sub">iwz_title</h2>])
 </div>
 <div class="iwz-sidebar">
  <h3>Web Zone Navigation</h3>
  <ul class="iwz-nav iwz-nav-int">
   <li><a href="/">Home</a></li>
   <li><a class="iwz_section_class(projects)" href="/projects">Projects</a></li>
   <li><a class="iwz_section_class(tutorials)" href="/tutorials">Tutorials</a></li>
   <li><a class="iwz_section_class(bangers)" href="/bangers.html">Bangers</a></li>
  </ul>
  <h3>Other Web Zones</h3>
  <ul class="iwz-nav iwz-nav-ext">
   <li><a href="https://github.com/indigoparadox">Github</a></li>
   <li><a href="https://mastodon.social/@indigoparadox">Mastodon</a></li>
  </ul>
 </div>
 <div class="iwz-body">
