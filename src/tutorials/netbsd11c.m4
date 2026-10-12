divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title], [Single-Partition Encrypted NetBSD 11 Root])
define([iwz_section], [tutorials])
divert(0)include([header.m4])

iwz_sect([Introduction])

iwz_p([This is a quick overview which attempts to synthesize iwz_a([https://www.dwarmstrong.org/netbsd-encrypt-install/], [DW Armstrong's tutorial on NetBSD encryption]) with the iwz_a([https://wiki.netbsd.org/security/cgdroot/], [cgdroot page from the NetBSD wiki]) in a single MBR partition, divided into multiple disklabel slices to preserve MBR entries.])

iwz_p([Some of the commenting is sparse, and copied from DW Armstrong's page in order to preserve the order, but more rationale for them can be found there. Some steps from there are skipped, out of personal preference.])

iwz_p([There are some additional steps to resolve issues this may create with firmware or not installing through sysinst (e.g. setting up root certificate hashes).])

iwz_subsect([Create the Outer Partition Disklabel])

iwz_diff(
   [],
   iwz_diffl([x], [], [disklabel -i /dev/wd0])
)

iwz_p([iwz_b(IMPORTANT!) Confirm the offset and size of iwz_filename(wd0c) match those of iwz_filename(wd0f).])

iwz_p([iwz_filename(wd0a) should be a small unencrypted 4.2BSD partition at the beginning of iwz_filename(wd0f) (starting at the same sector).])

iwz_p([iwz_filename(wd0b) can take up the rest of iwz_filename(wd0f). Use the formula: wd0g_offset - (wd0a_offset + wd0a_size) - 1])

iwz_subsect([Create Unencrypted /boot Slice])

iwz_p([Mount it temporarily to iwz_filename(/targetroot) so that the cgd parameters file can be written to it.])

iwz_diff(
   [],
   iwz_diffl([x], [], [newfs -O 2 /dev/wd0a])
   iwz_diffl([x], [], [mount /dev/wd0a /targetroot])
)

iwz_subsect([Encrypted the Encrypted Slice])

iwz_p([This is the iwz_filename(wd0b) slice created previously.])

iwz_p([This will be further subdivided into slices inside of the cgd disklabel, so one is enough.])

iwz_diff(
   [],
   iwz_diffl([x], [], [# create the parameters file])
   iwz_diffl([x], [], [cgdconfig -g -V disklabel -o /targetroot/wd0b aes-xts 512])
   iwz_diffl([x], [], [# perform the encryption])
   iwz_diffl([x], [], [cgdconfig -V re-enter cgd0 /dev/wd0b /targetroot/wd0b])
)

iwz_subsect([Setup the encrypted disklabel])

iwz_diff(
   [],
   iwz_diffl([x], [], [disklabel -i /dev/cgd0])
)

iwz_p([iwz_b(IMPORTANT!) Make sure to W changes, even if you don't make any!])

iwz_p([Make sure your iwz_filename(/) is iwz_filename(cgd0a). The rest can be up to you.])

iwz_subsect([Copy Boot Files to Unencrypted /boot Slice])

iwz_p([These include the second-stage bootloader and cgd config.])

iwz_p([The iwz_filename(ramdisk-cgdroot.fs) file is an image which contains scripts which look for and attempt to automatically decrypt iwz_filename(wd0a) and boot from the resulting root on iwz_filename(cgd0a). Please see iwz_a([https://wiki.netbsd.org/security/cgdroot/], [the cgdroot page from the NetBSD wiki]) for more information.])

iwz_p([These scripts copy iwz_filename(cgd.conf) and the parameters file to iwz_filename(/etc/cgd) on the ramdisk during runtime, negating the need to modify the ramdisk in many cases. This also means the cgd service and configuration doesn't neet to exist in the running (encrypted) system's iwz_filename(/etc/cgd) directory.])

iwz_diff(
   [],
   iwz_diffl([x], [], [cp /amd64/installation/ramdisk/ramdisk-cgdroot.fs /targetroot/])
   iwz_diffl([x], [], [cp /usr/mdec/boot /targetroot/])
   iwz_diffl([x], [], [echo 'cgd0 /dev/wd0b' > /targetroot/cgd.conf])
   iwz_diffl([x], [], [echo 'menu=Boot normally:rndseed /etc/entropy-file;fs /ramdisk-cgdroot.fs;boot /netbsd' > /targetroot/boot.cfg])
)

iwz_subsect([Unmount the Unencrypted /boot Slice])

iwz_p([We're going to unmount it, now that we're done with the iwz_filename(wd0b) parameters file. We will make changes to it later, but only once it's been remounted inside of the iwz_filename(/targetroot).])

iwz_diff(
   [],
   iwz_diffl([x], [], [umount /targetroot])
)

iwz_subsect([Install the First-Stage Bootloader])

iwz_p([This can be done whenever, but might as well do it now.])

iwz_diff(
   [],
   iwz_diffl([x], [], [installboot -v /dev/rwd0a /usr/mdec/bootxx_ffsv2])
)

iwz_subsect([Create the Encrypted Root])

iwz_diff(
   [],
   iwz_diffl([x], [], [newfs -O 2ea /dev/cgd0a])
   iwz_diffl([x], [], [mount /dev/cgd0a /targetroot])
)

iwz_p([Now, remount the unencrypted iwz_filename(/boot) inside of iwz_filename(/targetroot):])

iwz_diff(
   [],
   iwz_diffl([x], [], [mkdir /targetroot/boot])
   iwz_diffl([x], [], [mount /dev/wd0a /targetroot/boot])
)

iwz_p([You can also mount your iwz_filename(/var), iwz_filename(/home), etc. here, if you created those in the encrypted disklabel.])

iwz_subsect([Install the System])

iwz_p([This is as obvious as it seems. The system can function with as little as just iwz_filename(base) and iwz_filename(kern-GENERIC), and you may wish to omit the iwz_filename(games) and iwz_filename(x*) sets for e.g. servers.])

iwz_diff(
   [],
   iwz_diffl([x], [], [cd /amd64/binary/sets])
   iwz_diffl([x], [], [for s in base comp etc games gpufw kern-GENERIC man misc modules rescue tests text xbase xcomp xetc xfont xserver; do tar -xvpf $s.tar.xz -C /targetroot; done])
)

iwz_subsect([Copy the Kernel to the Unencrypted /boot Slice])

iwz_p([The kernel is still needed during the unencrypted phase. Be sure to update the copy on the unencrypted partition if you update or compile a custom kernel in the future!])

iwz_diff(
   [],
   iwz_diffl([x], [], [cp /targetroot/netbsd /targetroot/boot/])
)

iwz_sect([Entering the Target System])

iwz_p([Now it's time to chroot into the target root:])

iwz_diff(
   [],
   iwz_diffl([x], [], [chroot /targetroot])
)

iwz_subsect([Set root Password])

iwz_diff(
   [],
   iwz_diffl([x], [], [passwd])
)

iwz_subsect([Setup Device Nodes])

iwz_diff(
   [],
   iwz_diffl([x], [], [cd /dev])
   iwz_diffl([x], [], [sh MAKEDEV all])
)

iwz_p([This bug still seems to exist, and null is not properly created:])


iwz_diff(
   [],
   iwz_diffl([x], [], [rm /dev/null])
   iwz_diffl([x], [], [mknod -m 0666 -u root -g wheel /dev/null c 2 2])
)

iwz_subsect([Setup Timezone])

iwz_diff(
   [],
   iwz_diffl([x], [], [ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime])
)

iwz_subsect([Setup Networking])

iwz_diff(
   [],
   iwz_diffl([x], [], [cat > /etc/ifconfig.wm0 << EOF])
   iwz_diffl([x], [], [up])
   iwz_diffl([x], [], [media autoselect])
   iwz_diffl([x], [], [EOF])
)

iwz_subsect([Create fstab])

iwz_diff(
   [],
   iwz_diffl([x], [], [cat > /etc/fstab << EOF])
   iwz_diffl([x], [], [/dev/cgd0a / ffs rw,log,noatime 1 1])
   iwz_diffl([x], [], [kernfs /kern kernfs rw])
   iwz_diffl([x], [], [ptyfs /dev/pts ptyfs rw])
   iwz_diffl([x], [], [procfs /proc procfs rw])
   iwz_diffl([x], [], [tmpfs /var/shm tmpfs rw,-m1777,-sram%25])
   iwz_diffl([x], [], [/dev/wd0a /boot ffs rw,log,noatime 0 0])
   iwz_diffl([x], [], [EOF])
)

iwz_p([Again, feel free to add your extra filesystems, for example:])

iwz_diff(
   [],
   iwz_diffl([x], [], [/dev/cgd0e /var ffs rw,log,noatime 1 2])
)

iwz_subsect([Setup rc.conf])

iwz_p([The cgd service is not needed, as cgd stuff is handled by the cgdroot ramdisk.])

iwz_diff(
   [],
   iwz_diffl([x], [], [echo >> /etc/rc.conf << EOF])
   iwz_diffl([x], [], [dhcpcd=YES])
   iwz_diffl([x], [], [dhcpcd_flags="-qM wm0"])
   iwz_diffl([x], [], [hostname=testhost.example.com])
   iwz_diffl([x], [], [sshd=YES])
   iwz_diffl([x], [], [ntpd=YES])
   iwz_diffl([x], [], [EOF])
)

iwz_subsect([Optional: Add Firmware to the RAMdisk])

iwz_p([Your system may need optional firmware on the ramdisk to even get to the decryption prompt. You can use vnconfig to mount the ramdisk and add this firmware like this example, for Cape Verde firmware for the radeon driver:])

iwz_diff(
   [],
   iwz_diffl([x], [], [cp /boot/ramdisk-cgdroot.fs /boot/ramdisk-cgdroot-good.fs])
   iwz_diffl([x], [], [vnconfig vnd0 /boot/ramdisk-cgdroot.fs])
   iwz_diffl([x], [], [mount /dev/vnd0a /mnt/])
   iwz_diffl([x], [], [mkdir -p /mnt/libdata/firmware/radeon])
   iwz_diffl([x], [], [cp /libdata/firmware/radeon/VERDE_* /mnt/libdata/firmware/radeon])
)

iwz_subsect([Unmount and Reboot])

iwz_diff(
   [],
   iwz_diffl([x], [], [exit])
   iwz_diffl([x], [], [cd /])
   iwz_diffl([x], [], [umount /targetroot/*])
   iwz_diffl([x], [], [umount /targetroot])
   iwz_diffl([x], [], [cgdconfig -u cgd0])
)

iwz_sect([In the Rebooted System])

iwz_subsect([Rehash Certificates])

iwz_p([Without doing this, you may get certificate verification errors later:])

iwz_diff(
   [],
   iwz_diffl([x], [], [certctl rehash])
)

iwz_subsect([Install pkgin])

iwz_diff(
   [],
   iwz_diffl([x], [], [PKG_PATH="https://cdn.NetBSD.org/pub/pkgsrc/packages/NetBSD/amd64/11.0/All"])
   iwz_diffl([x], [], [export PKG_PATH])
   iwz_diffl([x], [], [pkg_add pkgin])
)

include([footer.m4])
