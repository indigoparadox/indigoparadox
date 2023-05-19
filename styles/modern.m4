
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

.iwz-sidebar {
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

.iwz-body {
   margin-left: 200px;
   order: 3;
}

.iwz-toc {
   position: relative;
   left: 100px;
   display: table;
   margin: 10px auto;
   order: 2;
}

.iwz-footer {
   text-align: center;
   position: relative;
   left: 100px;
   display: table;
   margin: 20px auto;
   order: 4;
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
   background: lightgray;
   color: black;
   border-top: 2px solid white;
   border-right: 2px solid darkgray;
   border-bottom: 2px solid darkgray;
   border-left: 2px solid white;
   outline: 2px solid black;
   display: block;
   padding: 0 5px;
   text-decoration: none;
}

.iwz-card-links {
   display: table;
   margin: 10px auto 20px auto;
   list-style-type: none;
}

.iwz-card-links li {
   display: inline-block;
   margin-right: 5px;
}

.iwz-card-link, .iwz-card-link:visited {
   border-top: 2px solid white;
   border-right: 2px solid darkgray;
   border-bottom: 2px solid darkgray;
   border-left: 2px solid white;
   outline: 2px solid black;
   color: black;
   padding: 5px;
   text-decoration: none;
}

.iwz-card-desc {
   margin: 20px;
}

.iwz-var, .iwz-filename, .iwz-func {
   font-family: Courier, Courier New, monospace;
}

.iwz-code-line {
   font-family: Courier, Courier New, monospace;
   font-weight: bold;
   background: black;
   color: limegreen;
   display: block;
   margin: 10px auto;
   padding: 3px;
   width: 600px;
   white-space: pre-wrap;
}

.iwz-code-wrapper {
   font-family: Courier, Courier New, monospace;
   background: lightgray;
   border-right: 2px solid darkgray;
   border-bottom: 2px solid darkgray;
   border-left: 2px solid darkgray;
   outline: 2px solid black;
   margin: 10px auto;
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
   white-space: pre-wrap;
}

.iwz-code-remove {
   background: darkred;
}

.iwz-code-add {
   background: darkgreen;
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

