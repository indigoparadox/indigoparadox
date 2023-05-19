#!/bin/bash

IWZ_TEMPDIR="./temp"

mkdir -p "$IWZ_TEMPDIR"

# Process literate programming templates.
for t in `find src -name "*.c"`; do
   DEST_MIDNAME="`basename "$t" .c`.m4"

   echo "" > "$IWZ_TEMPDIR/$DEST_MIDNAME"

   OLDIFS=`$IFS`
   IFS=$'\n'
   for l in `cat "$t"`; do
      if echo $l | grep -q '^\s*\*\/'; then
         # Add this paragraph to the generated template.
         echo "iwz_p([$DEST_P])" >> "$IWZ_TEMPDIR/$DEST_MIDNAME"
         DEST_P=""

      elif echo $l | grep -q '^\s*\/\?\*'; then
         DEST_P="$DEST_P `echo $l | sed -n 's/^\s*\/\?\* \(.*\)/\1/p'`"
         #echo iwz_p\([$l]\) >> "$IWZ_TEMPDIR/$DEST_MIDNAME"

      elif echo $l | grep -q '^\s*\S'; then
         echo "iwz_code_ln([$l])" >> "$IWZ_TEMPDIR/$DEST_MIDNAME"
      fi
   done
done

# Process web template m4 files.
for t in `find src -name "*.m4"`; do
   DEST_DIRNAME="`dirname "$t" | sed -e 's/^src/modern/g'`"
   mkdir -p "$DEST_DIRNAME"
   echo processing $t...
   m4 -I ./templates -I $IWZ_TEMPDIR "$t" > \
      "$DEST_DIRNAME/`basename "$t" .m4`".html
done

m4 "styles/modern.m4" > "modern/style.css"

mkdir -p modern/images
cp -vRf images/* modern/images/

