
/* vim: set syntax=css: */

body {
   background: navy;
   color: white;
   display: flex;
   margin: 0;
   padding: 0;
   flex-direction: column;
}

a, a:visited {
   color: cyan;
}

.iwz-span-bold {
   font-weight: bold;
}

.iwz-title-iwz {
   display: inline-block;
   margin: 0;
}

.iwz-title-sub {
   display: inline-block;
   color: navy;
   margin: 0;
}

.iwz-title-sub::before {
   content: "\00b7";
   display: inline-block;
   margin-right: 5px;
}

.iwz-link-ext::after {
   content: " ";
   background: url( monitor.png ) -48px 0;
   display: inline-block;
   width: 16px;
   height: 16px;
   vertical-align: middle;
}

.iwz-link-amazon::after {
   content: " ";
   background: url( monitor.png ) -16px 0;
   display: inline-block;
   width: 16px;
   height: 16px;
   vertical-align: middle;
}

.iwz-link-file::after {
   content: " ";
   background: url( monitor.png ) -32px 0;
   display: inline-block;
   width: 16px;
   height: 16px;
   vertical-align: middle;
}

.iwz-link-social::after {
   content: " ";
   background: url( monitor.png ) 0 -16px;
   display: inline-block;
   width: 16px;
   height: 16px;
   vertical-align: middle;
}

.iwz-link-repo::after {
   content: " ";
   background: url( monitor.png ) -16px -16px;
   display: inline-block;
   width: 16px;
   height: 16px;
   vertical-align: middle;
}

.iwz-sum-list {
   display: table;
   margin: 10px auto;
   width: 90%;
}

.iwz-sum-list-item {
   color: gold;
   margin-bottom: 5px;
}

.iwz-sum-list-desc {
   border-top: 1px solid white;
   margin-bottom: 10px;
   margin-left: 0;
   padding-top: 5px;
}

.iwz-sidebar {
   font-family: Arial, Helvetica, sans-serif;
   display: block;
   background: teal;
   position: fixed;
   top: 0;
   left: 0;
   width: 140px;
   height: 100%;
}

.iwz-sidebar:after {
   background:
      linear-gradient(315deg, transparent 22px, teal 0),
      linear-gradient(225deg, transparent 22px, teal  0);
   background-repeat: repeat-y;
	background-position: right top;
   background-size: 32px 32px;
   filter: drop-shadow( 15px 8px 5px black );
   content: "";
   display: block;
   position: fixed;
	width: 32px;
   height: 150%;
   top: -40px;
	left: 140px;
}

.iwz-sidebar h3 {
   margin: 20px;
}

.iwz-nav {
   font-weight: bold;
   list-style-type: none;
   margin: 0;
   padding: 0 20px;
}

.iwz-nav li {
   border-bottom: 1px dotted white;
   padding: 5px;
}

.iwz-nav li:last-child {
   border-bottom: none;
}

.iwz-nav a, .iwz-nav a:visited {
   text-decoration: none;
}

.iwz-nav-int a, .iwz-nav-int a:visited {
   color: yellow;
}


.iwz-nav-ext a, .iwz-nav-ext a:visited {
   color: greenyellow;
}

.iwz-nav a.iwz-section-active, .iwz-nav a.iwz-section-active:visited {
   color: orange;
}

.iwz-sect-header {
   font-family: Arial, Helvetica, sans-serif;
   color: gold;
}

.iwz-subsect-header {
   font-family: Arial, Helvetica, sans-serif;
   color: greenyellow;
}

.iwz-sect-idx, .iwz-subsect-idx {
   font-size: 1.2em;
   color: coral;
}

.iwz-header {
   font-family: Arial, Helvetica, sans-serif;
   background: lightgray;
   border-bottom: 2px solid darkgray;
   outline: 2px solid black;
   color: black;
   margin-left: 150px;
   padding: 6px 50px;
   order: 1;
}

.iwz-breadcrumbs, .iwz-breadcrumbs:visited {
   font-size: 0.8em;
   color: darkviolet;
   display: block;
   text-decoration: none;
}

.iwz-body {
   margin-left: 200px;
   order: 3;
}

.iwz-toc {
   font-family: Arial, Helvetica, sans-serif;
   background: darkblue;
   border: 1px solid cyan;
   position: relative;
   left: 100px;
   display: table;
   margin: 10px auto;
   padding: 20px 40px;
   order: 2;
}

.iwz-toc h3 {
   margin: 0;
}

.iwz-toc ol {
   margin: 0;
   padding: 0;
}

.iwz-footer {
   text-align: center;
   position: relative;
   left: 100px;
   display: table;
   margin: 20px auto;
   order: 4;
}

.iwz-goatdpr {
   font-size: 0.8em;
}

.iwz-lastmod {
   font-size: 0.8em;
}

.iwz-copyright {
   font-size: 0.8em;
}

.iwz-iframe-proj {
   display: block;
   margin: 0 auto;
}

.iwz-video, .iwz-img {
   display: block;
   margin: 10px auto;
   max-width: 640px;
}

.iwz-card {
   font-family: Arial, Helvetica, sans-serif;
   background: lightgray;
   border-top: 2px solid white;
   border-right: 2px solid darkgray;
   border-bottom: 2px solid darkgray;
   border-left: 2px solid white;
   outline: 2px solid black;
   color: black;
   margin: 20px;
}

.iwz-card-header {
   background: navy;
   padding: 3px;
}

.iwz-card-title {
   font-size: 1em;
   color: white;
   display: inline-block;
   margin: 3px;
   padding: 0 5px;
}

.iwz-card-tags {
   display: inline-block;
   margin: 0;
   padding: 0;
   float: right;
}

.iwz-card-tags li {
   display: inline-block;
   margin: 0 2px;
}

.iwz-card-tags a, .iwz-card-tags a:visited {
   color: black;
   display: block;
   padding: 0 5px;
   text-decoration: none;
}

.iwz-card-links {
   display: table;
   margin: 10px auto 20px auto;
   padding: 0;
   list-style-type: none;
}

.iwz-card-links li {
   display: inline-block;
   margin-right: 5px;
}

.iwz-card-link, .iwz-card-link:visited {
   color: black;
   padding: 5px;
   text-decoration: none;
}

.iwz-card-desc {
   margin: 20px;
}

.iwz-card-radicle {
   background: darkviolet;
   border-radius: 10px;
   display: table;
   margin: 5px auto;
   padding: 20px;
   text-align: center;
}

.iwz-card-radicle h4 {
   font-family: Arial, Helvetica, sans-serif;
   margin: 0;
   padding: 0;
}

.iwz-card-radicle a, .iwz-card-radicle a:visited {
   color: darkblue;
}

.iwz-card-radicle ul {
   list-style-type: none;
   margin: 10px 0 5px 0;
   padding: 0;
}

.iwz-list-radicle li {
   font-family: Courier, Courier New, monospace;
}

.iwz-var, .iwz-filename, .iwz-func, .iwz-errorm {
   font-family: Courier, Courier New, monospace;
}

.iwz-cmd {
   font-family: Courier, Courier New, monospace;
   font-weight: bold;
}

.iwz-pkg {
   font-family: Courier, Courier New, monospace;
   font-weight: bold;
}

.iwz-code-wrapper {
   font-family: Courier, Courier New, monospace;
   background: lightgray;
   border-right: 2px solid darkgray;
   border-bottom: 2px solid darkgray;
   border-left: 2px solid darkgray;
   outline: 2px solid black;
   margin: 10px auto;
   width: 600px;
}

.iwz-code-title {
   font-weight: bold;
   background: navy;
   border-right: 2px solid lightgray;
   border-top: 2px solid lightgray;
   border-left: 2px solid lightgray;
   padding: 2px;
}

.iwz-code-line {
   font-weight: bold;
   white-space: pre-wrap;
}

.iwz-code-remove {
   background: darkred;
}

.iwz-code-add {
   background: darkgreen;
}

.iwz-code-neutral {
   background: black;
   color: limegreen;
}

.iwz-twt {
   border-bottom: 1px dotted cyan;
}

.iwz-button {
   font-family: Arial, Helvetica, sans-serif;
   background: lightgray;
   border-top: 2px solid white;
   border-right: 2px solid darkgray;
   border-bottom: 2px solid darkgray;
   border-left: 2px solid white;
   outline: 2px solid black;
}

.iwz-inset {
   border-top: 2px solid darkgray;
   border-right: 2px solid white;
   border-bottom: 2px solid white;
   border-left: 2px solid darkgray;
   outline: 2px solid black;
   outline-offset: -3px;
}

.iwz-block {
   font-family: Arial, Helvetica, sans-serif;
   border-radius: 10px;
   display: block;
   margin: 10px auto;
   padding: 10px 20px;
   width: 500px;
}

.iwz-construction {
   background: olive;
}

.iwz-quality {
   background: darkred;
}

.iwz-table {
   width: 100%;
}

.iwz-table th {
   text-align: left;
}

.iwz-table th, .iwz-table td {
   border: 1px solid white;
   padding: 5px;
}

.iwz-pcspec {
   background: teal;
}

.iwz-pcspec-key {
   font-weight: bold;
   padding: 0 5px;
}

.iwz-pcspec-value {
}

.iwz-pcspec-note {
   font-size: 0.8em;
}

.iwz-pcspec-irq, .iwz-pcspec-dma, .iwz-pcspec-io {
   width: 300px !important;
}

.iwz-webring {
   display: table;
   margin: 20px auto;
}

.iwz-hotline-hotline, .iwz-hotline-hotline:visited {
   font-family: Arial, Helvetica, sans-serif;
   font-weight: bold;
   color: red;
   filter: drop-shadow( 2px 2px black );
   text-decoration: none;
}

.iwz-webring a, .iwz-webring a:visited {
   display: inline-block;
   margin: 10px;
   padding: 5px 10px;
}

.iwz-webring .iwz-button, .iwz-hotline .iwz-button:visited {
   color: black;
   text-decoration: none;
}

.iwz-88x31 {
   display: inline-block;
   margin: 10px;
   /* 88x31, but Substract 8 in each direction to compensate for border. */
   width: 80px;
   height: 23px;
}

.vim, .vim a, .vim a:visited {
   color: black;
   text-decoration: none;
}

.vim-edited {
   font-size: 10px;
   line-height: 100%;
}

.vim-vim::before {
   content: "";
   background: darkgreen;
   display: block;
   width: 16px;
   height: 16px;
   position: absolute;
   left: 1px;
   top: 2px;
   transform: rotate(45deg);
   z-index: 5;
}

.vim-vim {
   text-shadow: -1px 1px 0 #000,
      1px 1px 0 #000,
      1px -1px 0 #000,
      -1px -1px 0 #000;
   position: relative;
   top: 1px;
}

.vim-v {
   color: lightgray;
   font-size: 14px;
   position: relative;
   z-index: 10;
   filter: drop-shadow( 1px 1px black );
}

.vim-im {
   color: lightgray;
   font-size: 9px;
   position: relative;
   z-index: 10;
   filter: drop-shadow( 1px 1px black );
}

.gnu-m4 {
   color: black;
}

.gnu-m4 a, .gnu-m4 a:visited {
   color: black;
   text-decoration: none;
}

.gnu-m4-powered {
   text-align: left;
   font-size: 10px;
   line-height: 100%;
}

.gnu-m4-gnu {
   text-align: right;
   font-size: 10px;
   width: 55px;
   float: right;
}

.gnu-m4-m4 {
   font-family: Courier, Courier New, monospace;
   float-right;
}

.gnu-m4-m {
}

.gnu-m4-4 {
   color: red;
   filter: drop-shadow( 1px 1px black );
}

.ns-logo {
   background: darkcyan;
   display: inline-block;
   position: relative;
   width: 22px;
   height: 22px;
   transform-style: preserve-3d;
   vertical-align: middle;
}

.ns-logo-n {
   font-family: "Times New Roman", Times, serif;
   font-size: 22px;
   color: white;
   position: absolute;
   top: -3px;
   left: 0;
   width: 100%;
   height: 100%;
   transform: rotateY( 1deg ) translateZ( 1px );
}

.ns-logo-sphere {
   background: black;
   border-radius: 50% 50% 0 0;
   position: absolute;
   bottom: 0;
   width: 100%;
   height: 30%;
   transform: translateZ( 1px );
}

