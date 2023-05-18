#!/bin/bash

for t in `find src -name "*.m4"`; do
   DEST_DIRNAME="`dirname "$t" | sed -e 's/^src/modern/g'`"
   mkdir -p "$DEST_DIRNAME"
   echo processing $t...
   m4 -I ./templates "$t" > "$DEST_DIRNAME/`basename "$t" .m4`".html
done

m4 "styles/modern.m4" > "modern/style.css"

mkdir -p modern/images
cp -vRf images/* modern/images/

