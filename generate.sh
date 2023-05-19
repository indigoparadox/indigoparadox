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
   echo "changecom()" > "$DEST_MIDNAME"
   echo "changequote(\`[', \`]')" >> "$DEST_MIDNAME" 
   echo "include([iwz_html.m4])" >> "$DEST_MIDNAME"
   echo "define([iwz_title],[The indigoparadox Web Zone: $PAGE_TITLE])" \
      >> "$DEST_MIDNAME"
   echo "divert(0)include([header.m4])" >> "$DEST_MIDNAME"

   # Extract contents to paragraphs.
   OLDIFS="$IFS"
   IFS=$'\n'
   for l in `cat "$t"`; do
      if echo $l | grep -q '^\s*\*\/'; then
         # Add this paragraph to the generated template.
         echo "iwz_p([$DEST_P])" >> "$DEST_MIDNAME"
         DEST_P=""

      elif echo $l | grep -q '^\s*\/\?\*'; then
         DEST_P="$DEST_P `echo $l | sed -n 's/^\s*\/\?\* \(.*\)/\1/p'`"

      elif echo $l | grep -q '^\s*\S'; then
         echo "iwz_code_ln([$l])" >> "$DEST_MIDNAME"
      fi
   done
   IFS=$OLDIFS

   echo "include([footer.m4])" >> "$DEST_MIDNAME"

   # Process intermediate to final output.
   proc_m4 "$DEST_MIDNAME" temp
done

# Process web template m4 files.
for t in `find src -name "*.m4"`; do
   proc_m4 "$t" src
done

m4 "styles/modern.m4" > "modern/style.css"

mkdir -p modern/images
cp -vRf images/* modern/images/

