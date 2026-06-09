divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title], [Setting Up a Virtual Packard Bell Legend Supreme])
define([iwz_section], [tutorials])
divert(0)include([header.m4])

iwz_sect([Introduction])

iwz_p([The Packard Bell Legend Supreme series was a line of personal computers from the mid 1990s. This was an era when the greater public was starting to adopt desktop computers and OEMs tended to be a bit more adventurous with their out-of-the-box experiences.])

iwz_p([This tutorial will explore the process of recreating an emulated Packard Bell Legend Supreme more-or-less accurate to the half-remembered childhood memories of someone who lived through that era.])

iwz_sect([Materials])

iwz_list([
   iwz_li([A copy of iwz_a([https://github.com/86Box/86Box], [86Box]), the PC emulator. This tutorial was made using 6.0, so it may have to be adapted for future versions.])
   iwz_li([The iwz_filename([Boot-1.44M.img]) floppy disk image extracted from the iwz_filename([[[BOOT]]]) directory of that very same ISO image.])
   iwz_li([The file iwz_filename([170889 - Win95 (Jan 1997 - Platinum Pro) - VM.ISO]) from the iwz_a([https://archive.org/details/windows95mastercd], [Windows 95 Packard Bell Master CD collection]) on archive.org.])
   iwz_li([Windows 95 OEM CD key. These are available at iwz_a([https://forum.winworldpc.com/discussion/6245/windows-95-product-key], [WinWorldPC]) and have "OEM" in the second grouping.])
   iwz_li([This iwz_a_file([/images/pblegend/inf.zip], [floppy diskette full of *.inf files]).])
   iwz_li([An hour or two of spare time.])
])

iwz_sect([86Box Settings])

iwz_p([These are the settings used for this tutorial. They are not based firmly on anything more than "what seemed plausible for the time" combined with "what worked after trial and error," which is why this tutorial is for a "Legend Supreme" and not a specific model of that line. They should be able to be modified to taste unless noted otherwise.])

iwz_subsect([Machine Tab])

iwz_p([Select the "Socket 7 Dual Voltage" machine type with a "Packard Bell PB68x" machine. This is probably mandatory, as the CD does have checks for a Packard Bell system and systems that are too new do not work (a couple were tried and rejected!) The default processor should be a 166 MHz Pentium MMX for this, which is good. 16MB RAM should be accurate and usable, but feel free to add more.])

iwz_img([/images/pblegend/setmobo.png], [Screenshot of the 86Box machine settings window on the machine tab, with the described options set.])

iwz_subsect([Machine Tab])

iwz_p([Select the "S3 Trio64V+" video card. The default options should be sufficient (Phoenix bios, 4MB RAM).])

iwz_img([/images/pblegend/setvideo.png], [Screenshot of the 86Box video settings window on the machine tab, with the described options set.])

iwz_subsect([Input Tab])

iwz_p([Select the "Logitech/Microsoft Bus Mouse" with the default "AT Keyboard". Unfortunately, the more conventional PS/2 and serial mouse options do not seem to work on the restored system.])

iwz_img([/images/pblegend/setinput.png], [Screenshot of the 86Box input settings window on the machine tab, with the described options set.])

iwz_subsect([Sound Tab])

iwz_p([Select the "Aztech Sound Galaxy Nova 16 Extra" with the default options. This seemed to install using the drivers that came with the CD.])

iwz_img([/images/pblegend/setsound.png], [Screenshot of the 86Box sound settings window on the machine tab, with the described options set.])

iwz_subsect([Hard Disks Tab])

iwz_p([Create a new disk with plausible settings for the era. We used 8322 Cylinders, 16 Heads, 63 Sectors, but this can vary. Make sure the Bus is IDE and the Channel is 0:0, and use Quantum Fireball ST3.2AT as the model (though there may be some flexibility, here).])

iwz_img([/images/pblegend/sethd.png], [Screenshot of the 86Box hard disk settings window on the machine tab, with the described options set.])

iwz_subsect([Floppy & CD-ROM Drives Tab])

iwz_p([Make sure you have a single 3.5" 1.44MB floppy disk and select a "TOSHIBA CD-ROM XM-5302A 0305" for ATAPI 0:1. This is actually important. The restore disk will check the CD-ROM drive model and refuse to work if it is not one of the supported options!])

iwz_img([/images/pblegend/setcd.png], [Screenshot of the 86Box CD-ROM settings window on the machine tab, with the described options set.])

iwz_sect([Installing the System])

iwz_p([Installing can be a little tricky. While this is not technically a VM in the traditional sense (as it is emulated, not hardware virtualized) we will be referring to our emulated machine as a VM for convenience. Once the is VM created:])

iwz_list([

   iwz_li([Start the VM.])
   iwz_li([From the VM's "Media" menu, select the floppy drive, and then select "Existing Image (Write-Protected)..." Mount the iwz_filename([Boot-1.44M.img]) file extracted from the CD previously per the iwz_a_anchor([#Materials], [Materials]) list.])
   iwz_li([Once booting from the floppy, wait for the "Starting Windows 95..." text to appear and quickly hit the F8 key on the keyboard. Select "Safe-Mode Command Prompt" from the list that appears.])
   iwz_li([Use "fdisk" to partition the drive (allow large hard disk support, use the entire drive) and then reboot (with the hard reset button on the VM window is fine).])
   iwz_li([Once again, wait for the "Starting Windows 95..." text to appear and quickly hit the F8 key on the keyboard. Select "Safe-Mode Command Prompt" from the list that appears.])
   iwz_li([This time, use "format c:" to format the new hard drive. This might take a while. Once this is done, mount the iwz_filename([170889 - Win95 (Jan 1997 - Platinum Pro) - VM.ISO]) CD image gathered in the iwz_a_anchor([#Materials], [Materials]) list in the virtual CD-ROM drive and reboot again.])
   iwz_li([This time, allow the system to boot completely into the restore environment. Select the "restore" option and follow the prompts. The system will restore files to the hard drive and prompt to remove disks and reboot, so do so.])
   iwz_li([At some point, the machine will begin going through automated scripts to setup the Packaged Bell OEM desktop. It will display a gray "Please wait..." dialog while this is happening: iwz_img([/images/pblegend/pleasewait.png], [Teal Windows desktop with a Notepad window thanking you for choosing Packard Bell and a gray "Please wait..." dialog in the corner with the Packard Bell icon.])])
   iwz_li([After a while (and possibly more reboots), the system will display this screen: iwz_img([/images/pblegend/starting.png], [Teal splash screen with the words "Starting your new Packard Bell computer for the first time..." and an inducement to read the "Welcome Home booklet".]) It seems like it's working on something, but there are no activity lights and it is actually waiting for iwz_b([Enter]) to be pressed to continue.])
   iwz_li([After the screen fades and the machine reboots, Windows will prompt for a CD key. Use the OEM key provisioned in the iwz_a_anchor([#Materials], [Materials]) list.])
   iwz_li([The system should return to the desktop once it is finished setting up. On our system, the Start Menu was empty at this point. The programs were installed, but simply not present in the Start Menu. We worked around this by using the floppy image full of iwz_filename([*.inf]) files from the iwz_a_anchor([#Materials], [Materials]) list. Mount that and right-click on each *.inf file and choose "Install": iwz_img([/images/pblegend/installinf.png], [Screenshot of a Windows desktop with a File Explorer window open to the floppy drive, A:. The mouse cursor is hovering over a right-click menu on one of the files with a notepad icon and highlighting the "Install" option.])])
   iwz_li([After executing the icon infs, the desktop and Start Menu should have plenty of programs on them! Setup is more-or-less complete. There may still be kinks to work out that we did not notice, and it may be advisable to install iwz_a([https://www.vogons.org/viewtopic.php?t=57620], [the AmnHLT utility linked in this VOGONS thread]), but the system should be usable! If sound is not working, use the Add Hardware wizard to install the Aztech drivers.])
])

iwz_sect([Packard Bell Navigator])

iwz_subsect([Living Room])

iwz_p([This was the main attraction, back in the day. Maybe not the height of skeuomorphism, but a cozy example of it if nothing else.])

iwz_img([/images/pblegend/navlivingroom.png], [Orthogonal view of a virtual living room, with bookshelves and very modern architecture. Outside is impossibly blue and green and there are angles and curves everywhere. The furniture is wood grain, but you can tell it's made of engineered lumber.])

iwz_subsect([Myspace])

iwz_p([This is what the kids mean when they talk about MySpace. Everyone loved MySpace.])

iwz_img([/images/pblegend/navmyspace.png], [A virtual room with challenging geometry designed in what can only be described as "Farscape grunge" aesthetic. There are tubes everywhere and a little out-of-place cartoon Jack-in-the-Box is saying "Hello and welcome to Myspace! This is the cool place to work and play. There are some Windows Entertainment Pack icons on the shelves.])

iwz_subsect([Workspace])

iwz_p([The perfect place to compose faxes and then unwind with some SkiFree.])

iwz_img([/images/pblegend/navworkspace.png], [Orthogonal view of an office with more wood veneer.])

iwz_p([If nothing else, hopefully this brief tour through a different era of computing can provide some immaculate vibes and maybe a lesson or two!])

include([footer.m4])
