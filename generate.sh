#!/bin/bash

IWZ_TEMPDIR="temp"
IWZ_PROD=0
SITE_PROD="modern"

if [ "$1" = "prod" ] || [ "$2" = "prod" ]; then
   IWZ_PROD=1
fi

function proc_m4() {
   DEST_DIRNAME="`dirname "$1" | sed -e "s/^$2/${SITE_PROD}/g"`"
   mkdir -p "$DEST_DIRNAME"
   echo "processing $1..."
   m4 -I ./templates -I "$IWZ_TEMPDIR" \
      -D IWZ_PROD=$IWZ_PROD -D IWZ_LASTMOD="$3" "$1" > \
      "$DEST_DIRNAME/`basename "$1" .m4`.html"
}

function proc_c() {

   # Take a literate C file (first arg) and turn it into an m4 template
   # (second arg) to be processed with the IWZ macros.

   t="$1"
   DEST_MIDNAME="$2"

   PAGE_TITLE="`cat $t | sed -n 's/^\s*\/\* dnl :title: \(.*\)/\1/p'`"

   PAGE_SECTION="`cat $t | sed -n 's/^\s*\/\* dnl :section: \(.*\)/\1/p'`"

   # Create fresh intermediate file.
   echo "divert(-1)" > "$DEST_MIDNAME"
   echo "changecom()" >> "$DEST_MIDNAME"
   echo "changequote(\`[', \`]')" >> "$DEST_MIDNAME" 
   echo "include([iwz_html.m4])" >> "$DEST_MIDNAME"
   echo "define([iwz_title], [$PAGE_TITLE])" >> "$DEST_MIDNAME"
   if [ -n "$PAGE_TITLE" ]; then
      echo "define([iwz_section], [$PAGE_SECTION])" >> "$DEST_MIDNAME"
   fi
   echo "divert(0)include([header.m4])" >> "$DEST_MIDNAME"

   echo "iwz_dlsrc(`basename "$t"`)" >> "$DEST_MIDNAME"

   # Extract contents to paragraphs.
   INSIDE_CODE_BLK=0
   OLDIFS="$IFS"
   IFS=$'\n'
   for l in `cat "$t"`; do
      if echo $l | grep -q '^\s*\*\/'; then
         # Found the end of a comment, so add this paragraph to the generated
         # template and clear the currently building paragraph.
         echo "iwz_p([$DEST_P])" >> "$DEST_MIDNAME"
         DEST_P=""

      elif echo $l | grep -q '^\s*\/\* dnl :sect:'; then
         # Convert in-page subsection headers to m4 format.
         DEST_P="$DEST_P `echo $l | sed -n 's/^\s*\/\* dnl :sect: \(.*\)/iwz_sect([\1])/p'`"

      elif echo $l | grep -q '^\s*\/\?\*'; then
         # Found the start or middle of a comment, so add it to the paragraph
         # we're building.
         DEST_P="$DEST_P `echo $l | sed -n 's/^\s*\/\?\* \(.*\)/\1/p'`"

         # If this comment is inside of a code block, end the code block.
         if [ $INSIDE_CODE_BLK -eq 1 ]; then
            INSIDE_CODE_BLK=0
            echo "])" >> "$DEST_MIDNAME"
         fi

      elif echo $l | grep -q '^\s*\S'; then
         # Found other non-whitespace text which isn't in a comment block, so
         # assume it's code.
         if [ $INSIDE_CODE_BLK -eq 0 ]; then
            echo "iwz_diff([`basename "$t"`], [" >> "$DEST_MIDNAME"
            INSIDE_CODE_BLK=1
         fi
         echo "iwz_diffl([], [iwz_count_src_lines], [$l])" >> "$DEST_MIDNAME"
      fi
   done
   if [ $INSIDE_CODE_BLK -eq 1 ]; then
      INSIDE_CODE_BLK=0
      echo "])" >> "$DEST_MIDNAME"
   fi
   IFS=$OLDIFS

   echo "include([footer.m4])" >> "$DEST_MIDNAME"
}

function proc_asm() {

   # Take a literate assembly file (first arg) and turn it into an m4 template
   # (second arg) to be processed with the IWZ macros.

   t="$1"
   DEST_MIDNAME="$2"

   PAGE_TITLE="`cat $t | sed -n 's/^; dnl :title: \(.*\)/\1/p'`"

   PAGE_SECTION="`cat $t | sed -n 's/^; dnl :section: \(.*\)/\1/p'`"

   # Create fresh intermediate file.
   echo "divert(-1)" > "$DEST_MIDNAME"
   echo "changecom()" >> "$DEST_MIDNAME"
   echo "changequote(\`[', \`]')" >> "$DEST_MIDNAME" 
   echo "include([iwz_html.m4])" >> "$DEST_MIDNAME"
   echo "define([iwz_title], [$PAGE_TITLE])" >> "$DEST_MIDNAME"
   if [ -n "$PAGE_TITLE" ]; then
      echo "define([iwz_section], [$PAGE_SECTION])" >> "$DEST_MIDNAME"
   fi
   echo "divert(0)include([header.m4])" >> "$DEST_MIDNAME"

   echo "iwz_dlsrc(`basename "$t"`)" >> "$DEST_MIDNAME"

   # Extract contents to paragraphs.
   INSIDE_CODE_BLK=0
   OLDIFS="$IFS"
   IFS=$'\n'
   for l in `cat "$t"`; do
      if echo $l | grep -q '^;$'; then
         # Found an empty semicolon line, so assume a comment just ended.

         # Add this paragraph to the generated template.
         echo "iwz_p([$DEST_P])" >> "$DEST_MIDNAME"
         DEST_P=""

      elif echo $l | grep -q '^; dnl :sect:'; then
         # Convert in-page subsection headers to m4 format.
         DEST_P="$DEST_P `echo $l | sed -n 's/^; dnl :sect: \(.*\)/iwz_sect([\1])/p'`"

      elif echo $l | grep -q '^;'; then
         # Found the start or middle of a comment, so add it to the paragraph
         # we're building.
         DEST_P="$DEST_P `echo $l | sed -n 's/^; \(.*\)/\1/p'`"

         if [ $INSIDE_CODE_BLK -eq 1 ]; then
            INSIDE_CODE_BLK=0
            echo "])" >> "$DEST_MIDNAME"
         fi

      elif echo $l | grep -q '^\s*\S'; then
         # Found other non-whitespace text which isn't in a comment block, so
         # assume it's code.
         if [ $INSIDE_CODE_BLK -eq 0 ]; then
            echo "iwz_diff([`basename "$t"`], [" >> "$DEST_MIDNAME"
            INSIDE_CODE_BLK=1
         fi
         echo "iwz_diffl([], [iwz_count_src_lines], [$l])" >> "$DEST_MIDNAME"
      fi
   done
   if [ $INSIDE_CODE_BLK -eq 1 ]; then
      INSIDE_CODE_BLK=0
      echo "])" >> "$DEST_MIDNAME"
   fi
   IFS=$OLDIFS

   echo "include([footer.m4])" >> "$DEST_MIDNAME"
}

function do_generate() {

   mkdir -p "$IWZ_TEMPDIR"

   # Process C literate programming templates.
   for t in `find src -name "*.c"`; do
      # Figure out intermediate directory and create it.
      DEST_MIDNAME="`dirname $t | \
         sed -e "s/^src/$IWZ_TEMPDIR/g"`/`basename "$t" .c`.m4"
      mkdir -pv "`dirname $t | sed -e "s/^src/$IWZ_TEMPDIR/g"`"

      PAGE_LASTMOD="`git log $t | grep "^Date" | head -1`"

      proc_c "$t" "$DEST_MIDNAME"

      # Process intermediate to final output.
      proc_m4 "$DEST_MIDNAME" "temp" "$PAGE_LASTMOD"
      cp -v "$t" "`dirname "$t" | sed -e "s/^src/${SITE_PROD}/g"`"
   done

   # Process assembly literate programming templates.
   for t in `find src -name "*.asm"`; do
      # Figure out intermediate directory and create it.
      DEST_MIDNAME="`dirname $t | \
         sed -e "s/^src/$IWZ_TEMPDIR/g"`/`basename "$t" .asm`.m4"
      mkdir -pv "`dirname $t | sed -e "s/^src/$IWZ_TEMPDIR/g"`"

      PAGE_LASTMOD="`git log $t | grep "^Date" | head -1`"

      proc_asm "$t" "$DEST_MIDNAME"

      # Process intermediate to final output.
      proc_m4 "$DEST_MIDNAME" "temp" "$PAGE_LASTMOD"
      cp -v "$t" "`dirname "$t" | sed -e "s/^src/${SITE_PROD}/g"`"
   done
   # Process web template m4 files.
   for t in `find src -name "*.m4"`; do
      PAGE_LASTMOD="`git log $t | grep "^Date" | head -1`"
      proc_m4 "$t" "src" "$PAGE_LASTMOD"
   done

   # Process CSS.
   mkdir -p ${SITE_PROD}/styles
   for t in `find styles -name "*.m4"`; do
      DEST_NAME="${SITE_PROD}/`dirname "$t"`/`basename "$t" .m4`.css"

      mkdir -p "${SITE_PROD}/`dirname "$t"`"

      echo "$t > $DEST_NAME"
      m4 -I ./templates "$t" > "$DEST_NAME"
   done
   cp -v "styles/"*.png "${SITE_PROD}/styles"

   # Process scripts.
   mkdir -p ${SITE_PROD}/scripts
   for t in `find scripts -name "*.js"`; do
      mkdir -p "${SITE_PROD}/`dirname "$t"`"
      cp -v "$t" "${SITE_PROD}/`dirname "$t"`"
   done
   for t in `find scripts -name "*.m4"`; do
      DEST_NAME="${SITE_PROD}/`dirname "$t"`/`basename "$t" .m4`.js"
      mkdir -p "${SITE_PROD}/`dirname "$t"`"
      echo "$t > $DEST_NAME"
      m4 -I ./templates "$t" > "$DEST_NAME"
   done

   cp meta/CNAME ${SITE_PROD}/CNAME

   mkdir -p ${SITE_PROD}/images
   cp -Rf images/* ${SITE_PROD}/images/

   cp -v meta/robots.txt ${SITE_PROD}/robots.txt

   # Add pages (except error pages!) to sitemap.
   find ${SITE_PROD}/ -name "*.html" | grep -v "404.html$" | sed -e "s/^${SITE_PROD}/https:\/\/indigoparadox.zone/g" > ${SITE_PROD}/sitemap.txt
}

if [ "$1" = "proc_c" ]; then
   proc_c "$2" "$3"
elif [ "$1" = "proc_asm" ]; then
   proc_asm "$2" "$3"
else
   do_generate
fi

