
body {
   background: navy;
   color: white;
   margin: 0;
   padding: 0;
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
}

.iwz-body {
   margin-left: 200px;
}

.iwz-video {
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
   display: flex;
   margin: 20px;
   flex-direction: column;
}

.iwz-card-title {
   border-top: 2px solid white;
   border-right: 2px solid darkgray;
   border-bottom: 2px solid darkgray;
   border-left: 2px solid white;
   outline: 2px solid black;
   display: block;
   margin: 0 auto 20px auto;
   order: 3;
}

.iwz-card-title a, .iwz-card-title a:visited {
   color: black;
   display: block;
   padding: 5px;
   text-decoration: none;
}

.iwz-card-desc {
   order: 2;
   margin: 20px;
}

.iwz-card-tags {
   background: navy;
   padding: 3px;
   order: 1;
}

.iwz-card-tags ul {
   margin: 0;
   padding: 0;
}

.iwz-card-tags li {
   display: inline-block;
   margin: 0 5px;
}

.iwz-card-tags a, .iwz-card-tags a:visited {
   background: darkgray;
   color: black;
   display: block;
   padding: 2px 5px;
   border-radius: 5px;
   text-decoration: none;
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

