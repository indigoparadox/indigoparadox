
/* vim: set syntax=css: */
divert(-1)
divert(0)

.iwz-alt-os-list {
   font-family: Arial, Helvetica, sans-serif;
   width: 80%;
}

.iwz-alt-os-name {
   border-top: 1px solid lightgray;
   border-left: 1px solid lightgray;
   border-right: 1px solid dimgray;
   display: inline-block;
   margin-top: 10px;
}

.iwz-alt-os-link, .iwz-alt-os-link:visited {
   background: gold;
   color: black;
   border-top: 1px solid yellow;
   border-left: 1px solid yellow;
   border-right: 1px solid saddlebrown;
   display: block;
   padding: 3px 10px;
   text-decoration: none;
}

.iwz-alt-os-link::after {
   content: " \2b08";
}

.iwz-alt-os-desc {
   background: lightgray;
   color: black;
   border-top: 1px solid white;
   border-left: 2px solid white;
   border-right: 2px solid dimgray;
   border-bottom: 2px solid dimgray;
   margin: -1px 0 0 0;
   padding: 10px;
}

