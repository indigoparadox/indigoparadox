divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title], [XT8088])
define([iwz_section], [computers])
divert(0)include([header.m4])

iwz_img(
   [/images/xt8088/xt8088-frame.jpg],
   [XT8088 backplane installed on an open frame with a power supply. Two CPU/RAM cards are installed, as well as three peripheral cards (VGA, Ethernet, Serial).])

iwz_sect([Introduction])

iwz_block_pcspec([CPU], [NEC V20 4.77 MHz], [RAM], [640KB], [Video], [Paradise PVGA1A VGA 512KB], [Hard Disk], [USB], [Ports], [PS/2 (Keyboard), RS-232/DE-9, VGA/DE-15, Parallel/DB-25, Ethernet/RJ-45/BNC/AUI])

iwz_sect([ISA Cards])

iwz_img(
   [/images/xt8088/xt8088-vga.jpg],
   [Closeup of the rear of the VGA card inserted in one of the slots on the XT8088 backplane. It is a 16-bit ISA card, so the part behind the notch is hanging free from the slot.])

include([footer.m4])
