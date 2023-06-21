
/* dnl :title: Rom Padder
 */

/* dnl :section: utilities
 */

/* dnl :sect: Compiling
 *
 * This file should compile in most C compilers. By way of example in one of the
 * most common compilers, the command to compile in gcc is:
 *
 * iwz_cmd([gcc -o rompad rompad.c])
 */

/* dnl :sect: Preamble
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* dnl :sect: Main Function
 */

int main( int argc, char* argv[] ) {
   int retval = 0;
   FILE* bios_in = NULL;
   FILE* bios_out = NULL;
   size_t pg_sz = 0;
   size_t rom_sz = 0;
   size_t in_sz = 0;
   size_t pg_writ_sz = 0;
   size_t iter_r_sz = 0;
   size_t iter_w_sz = 0;
   size_t file_writ_sz = 0;
   char* bios_in_c = argv[1];
   char buffer[1024];
   
   /* Make sure command line makes sense.
    */
   if( 5 != argc ) {
      printf( "usage: pad <bios_in> <bios_out> <pg_sz_kb> <rom_sz_kb>\n" );
      retval = 1;
      goto cleanup;
   }

   /* Open input and output ROM files.
    */
   bios_in = fopen( bios_in_c, "rb" );
   bios_out = fopen( argv[2], "wb" );

   /* Get page and output ROM size from the command line, converting from KB
    * to bytes.
    */
   pg_sz = atoi( argv[3] ) * 1024;
   rom_sz = atoi( argv[4] ) * 1024;

   /* Get the input ROM size from the input ROM file, in bytes.
    */
   fseek( bios_in, 0, SEEK_END );
   in_sz = ftell( bios_in );
   fseek( bios_in, 0, SEEK_SET );

   /* Status update.
    */
   printf( "bios_in \"%s\" sz: %lu\n", bios_in_c, in_sz );
   if( in_sz < pg_sz ) {
      printf( "pages will be padded to %lu\n", pg_sz );
   }

   /* Iterate pages until the output ROM file matches the size specified
    * on the command line.
    */
   while( file_writ_sz < rom_sz ) {

      /* Iterate bytes from the input ROM and then zero-padding until the
       * current position in the output ROM matches a page size.
       */
      pg_writ_sz = 0;
      while( pg_writ_sz < pg_sz ) {
         /* Determine if there are still bytes to read from the input ROM, or
          * if we should switch to zero-padding.
          */
         if( pg_writ_sz < in_sz ) {
            iter_r_sz = fread( buffer, 1, 1024, bios_in );
            printf( "copying %lu bytes to page...\n", iter_r_sz );
         } else {
            iter_r_sz = 1024;
            printf( "padding %lu bytes to page...\n", iter_r_sz );
            memset( buffer, '\0', iter_r_sz );
         }

         /* Write read bytes or zero padding to output ROM file.
          */
         iter_w_sz = fwrite( buffer, 1, iter_r_sz, bios_out );
         if( iter_w_sz < iter_r_sz ) {
            printf( "could not write buffer!\n" );
            retval = 2;
            goto cleanup;
         }
         pg_writ_sz += iter_w_sz;
      }

      /* Bump up file written size by this page's written size.
       */
      file_writ_sz += pg_writ_sz;
      fseek( bios_in, 0, SEEK_SET );
      printf( "wrote %lu bytes to file...\n", file_writ_sz );
   }

   /* Close remaining open ROM files.
    */

cleanup:

   if( NULL != bios_in ) {
      fclose( bios_in );
   }

   if( NULL != bios_out ) {
      fclose( bios_out );
   }

   return retval;
}

