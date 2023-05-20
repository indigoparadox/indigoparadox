#!/bin/bash

IWZ_TEMPDIR="temp"

function proc_m4() {
   DEST_DIRNAME="`dirname "$1" | sed -e "s/^$2/modern/g"`"
   mkdir -p "$DEST_DIRNAME"
   echo "processing $1..."
   m4 -I ./templates -I "$IWZ_TEMPDIR" "$1" > \
      "$DEST_DIRNAME/`basename "$1" .m4`.html"
}

mkdir -p "$IWZ_TEMPDIR"

# Process literate programming templates.
for t in `find src -name "*.c"`; do
   # Figure out intermediate directory and create it.
   DEST_MIDNAME="`dirname $t | \
      sed -e "s/^src/$IWZ_TEMPDIR/g"`/`basename "$t" .c`.m4"
   mkdir -pv "`dirname $t | sed -e "s/^src/$IWZ_TEMPDIR/g"`"

   PAGE_TITLE="`cat $t | sed -n 's/^\s*\/\* dnl :title: \(.*\)/\1/p'`"

   # Create fresh intermediate file.
   echo "divert(-1)" > "$DEST_MIDNAME"
   echo "changecom()" >> "$DEST_MIDNAME"
   echo "changequote(\`[', \`]')" >> "$DEST_MIDNAME" 
   echo "include([iwz_html.m4])" >> "$DEST_MIDNAME"
   echo "define([iwz_title],[The indigoparadox Web Zone: $PAGE_TITLE])" \
      >> "$DEST_MIDNAME"
   echo "divert(0)include([header.m4])" >> "$DEST_MIDNAME"

   echo "iwz_dlsrc(`basename "$t"`)" >> "$DEST_MIDNAME"

   # Extract contents to paragraphs.
   INSIDE_CODE_BLK=0
   OLDIFS="$IFS"
   IFS=$'\n'
   for l in `cat "$t"`; do
      if echo $l | grep -q '^\s*\*\/'; then
         if [ $INSIDE_CODE_BLK -eq 1 ]; then
            INSIDE_CODE_BLK=0
            echo ")" >> "$DEST_MIDNAME"
         fi

         # Add this paragraph to the generated template.
         echo "iwz_p([$DEST_P])" >> "$DEST_MIDNAME"
         DEST_P=""

      elif echo $l | grep -q '^\s*\/\?\*'; then
         DEST_P="$DEST_P `echo $l | sed -n 's/^\s*\/\?\* \(.*\)/\1/p'`"

      elif echo $l | grep -q '^\s*\S'; then
         if [ $INSIDE_CODE_BLK -eq 0 ]; then
            echo "iwz_diff([`basename "$t"`]," >> "$DEST_MIDNAME"
            INSIDE_CODE_BLK=1
         fi
         echo "iwz_diffl([], [iwz_count_src_lines], [$l])" >> "$DEST_MIDNAME"
      fi
   done
   if [ $INSIDE_CODE_BLK -eq 1 ]; then
      INSIDE_CODE_BLK=0
      echo ")" >> "$DEST_MIDNAME"
   fi
   IFS=$OLDIFS

   echo "include([footer.m4])" >> "$DEST_MIDNAME"

   # Process intermediate to final output.
   proc_m4 "$DEST_MIDNAME" temp
   cp -v "$t" "`dirname "$t" | sed -e "s/^src/modern/g"`"
done

# Process web template m4 files.
for t in `find src -name "*.m4"`; do
   proc_m4 "$t" src
done

m4 "styles/modern.m4" > "modern/style.css"

mkdir -p modern/images
cp -vRf images/* modern/images/

