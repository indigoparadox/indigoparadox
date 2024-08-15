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

iwz_block_pcspec([CPU], [NEC V20 4.77 MHz], [RAM], [640KB], [Video], [Paradise PVGA1A VGA 512KB], [Sound], [Sound Blaster 2.0 (CT1350B)], [Hard Disk], [USB], [Ports], [PS/2 (Keyboard), RS-232/DE-9, VGA/DE-15, Parallel/DB-25, Ethernet/RJ-45/BNC/AUI])

iwz_sect([Resource Assignments])

iwz_p([These are assigned manually, by jumpers. Keeping a separate written table is critical to avoiding conflicts!])

iwz_p([*IRQ 7 is shared between the sound card and parallel port.])

iwz_block_table(
   [iwz_block_table_head([IRQ]) iwz_block_table_head([Peripheral])],
   [
      iwz_block_table_row([
         iwz_block_table_cell([0]) iwz_block_table_cell([System Timer]) ])
      iwz_block_table_row([
         iwz_block_table_cell([1]) iwz_block_table_cell([Keyboard]) ])
      iwz_block_table_row([
         iwz_block_table_cell([3]) iwz_block_table_cell([COM2]) ])
      iwz_block_table_row([
         iwz_block_table_cell([4]) iwz_block_table_cell([COM1]) ])
      iwz_block_table_row([
         iwz_block_table_cell([5]) iwz_block_table_cell([3Com 3c501]) ])
      iwz_block_table_row([
         iwz_block_table_cell([6]) iwz_block_table_cell([Floppy Controller]) ])
      iwz_block_table_row([
         iwz_block_table_cell([7]) iwz_block_table_cell([Sound Blaster 2.0*]) ])
      iwz_block_table_row([
         iwz_block_table_cell([7]) iwz_block_table_cell([Parallel Port*]) ])
   ],
   [iwz-pcspec-irq]
)

iwz_block_table(
   [iwz_block_table_head([DMA Channel]) iwz_block_table_head([Peripheral])],
   [
      iwz_block_table_row([
         iwz_block_table_cell([2]) iwz_block_table_cell([Floppy Controller]) ])
   ],
   [iwz-pcspec-dma]
)

iwz_block_table(
   [iwz_block_table_head([I/O Port]) iwz_block_table_head([Peripheral])],
   [
      iwz_block_table_row([
         iwz_block_table_cell([0x220]) iwz_block_table_cell([Sound Blaster 2.0]) ])
      iwz_block_table_row([
         iwz_block_table_cell([0x2f8]) iwz_block_table_cell([COM2]) ])
      iwz_block_table_row([
         iwz_block_table_cell([0x300]) iwz_block_table_cell([3com 3c501]) ])
      iwz_block_table_row([
         iwz_block_table_cell([0x3bc]) iwz_block_table_cell([Parallel Port]) ])
      iwz_block_table_row([
         iwz_block_table_cell([0x3f2]) iwz_block_table_cell([Floppy Controller]) ])
      iwz_block_table_row([
         iwz_block_table_cell([0x3f8]) iwz_block_table_cell([COM1]) ])
   ],
   [iwz-pcspec-io]
)


iwz_sect([ISA Cards])

iwz_img(
   [/images/xt8088/xt8088-vga.jpg],
   [Closeup of the rear of the VGA card inserted in one of the slots on the XT8088 backplane. It is a 16-bit ISA card, so the part behind the notch is hanging free from the slot.])

iwz_subsect([VGA Controller])

iwz_p([This is a 16-bit ISA card based on the iwz_a([https://www.vgamuseum.info/index.php/cpu/item/478-paradise-systems-pvga1a], [Paradise PVGA1A]) chip. Even with only the 8-bit half of the card edge inserted, it seems to work very well in text and CGA graphics modes. Higher modes are still untested.])

iwz_subsect([Floppy Controller])

iwz_block_construction()

iwz_p([Experimenting with several 16-bit ISA floppy/IDE/serial combo boards and the iwz_a_ipage([../projects/gotek.html], [GoTek Floppy Emulator]) failed with an error about the "DOS area" of the floppy in FreeDOS and ignoring floppies on boot. These same cards work in the 8-bit slots on the iwz_a_ipage([hand386.html], [Hand386]).])

iwz_p([We switched to an 8-bit ISA card with Sergey Kiselev's iwz_a_repo([floppy_bios], [skiselev], [floppy_bios]). This gives more fine-grained results (all of which are still failures):])

iwz_list([
   iwz_li([In most cases, it gives an error 40 on boot.])
   iwz_li([In our testing, the one exception we found in trying various combinations of physical drive number and sizes was: If physical drive 1 is set to 720kb, it gives an error 8 on boot.])
   iwz_li([These were tried with and without the S0 jumper that turned out to be the issue on the iwz_a_ipage([t1100fd.html], [Tandy 1100FD]).])
])

iwz_p([Ideas to try further:])

iwz_list([
   iwz_li([Go over the GoTek config again.])
   iwz_li([Dig out and try a physical drive.])
   iwz_li([Further research the quirks of the XT architecture.])
])

include([footer.m4])
