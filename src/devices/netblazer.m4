divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title], [Telebit NetBlazer PN2])
define([iwz_section], [devices])
divert(0)include([header.m4])

iwz_img(
   [/images/netblazer/front.jpg],
   [Front view of the NetBlazer PN2. It is a relatively small device, about the size of a phone book or dictionary. It has a floppy drive and some status lights on the front.])

iwz_sect([Introduction])

iwz_p([The Telebit NetBlazer PN2 (circa 1993) is a router/RAS device designed to connect remote sites by dialing them up with an attached modem. It comes with a rudementary OS that acts a little like UNIX and has limited support for loadable modules.])

iwz_p([Two striking features of the NetBlazer PN2 are its ability to boot from a built-in floppy drive, and its 386 CPU. While the CPU is a 386, the architecture is apparently incompatible with that of the IBM PC.])

iwz_img(
   [/images/netblazer/inside-1.jpg],
   [Inside view of the NetBlazer PN2. The commodity floppy drive is mounted to the motherboard from the bottom. The Intel i386 CPU is a relatively tiny surface-mount package located closest to the viewer, next to the VLSI chipset.])

iwz_p([It also includes a built-in Ethernet RJ-45/BNC/AUI port and two serial ports for connecting modems or direct RS-232 serial connections.])

iwz_img(
   [/images/netblazer/rear.jpg],
   [Rear view of the NetBlazer PN2. Displayed are the ports mentioned above, plus a power connection.])

iwz_sect([Boot Disk])

iwz_p([Fortunately, our NetBlazer PN2 came with a working boot diskette. We have made it available at iwz_a([https://archive.org/details/netblazer-pn2-uunet-boot], [The Internet Archive]). It has a configuration on it which is invalid by now, but provides a starting point to get to a working configuration.])

iwz_sect([Commands])

iwz_block_construction

iwz_p([A shell is available via serial port or telnet. Typing "?" in this shell provides a list of available commands. Specific procedures for setting up connections are still under research. Hopefully, we will have some more useful information here at some point.])

iwz_sect([Executable Format])

iwz_block_construction

iwz_p([The executable format is still under research. Hopefully, we will have some useful information here at some point.])

include([footer.m4])
