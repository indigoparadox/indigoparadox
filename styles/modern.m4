
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

