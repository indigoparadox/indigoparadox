divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title], [AltOS])
define([iwz_section], [altos])
define([iwz_root], 1)
define([iwz_aux_styles], [[/styles/iwz_altos.css]])
divert(0)include([header.m4])

iwz_p([This is a list of various "alternative" operating systems we've stumbled accross on our travels. It's not exhaustive, as there are many people out there developing their own operating systems, e.g. for embedded applications or even just as a hobby!])

iwz_p([Operating systems featured on this page should offer a reasonably functional environment (i.e. be more than just "Hello World"). They may even be based on the kernel of a more mainstream OS (e.g. FreeBSD) but with a radically different userland.])

iwz_p([If a link is broken, you're aware of a better link for an OS featured on this page, or if you're aware of an OS that would fit on this page: please iwz_let_us_know!])

<dl class="iwz-alt-os-list">

iwz_alt_os([RetrOS-32], [https://github.com/joexbayer/RetrOS-32], [A minimal 32-bit OS for older or resource-limited computers, complete with GUI and compiler.])

iwz_alt_os([MinC], [https://minc.commandlinerevolution.nl/english/home.html], [Not strictly an OS on its own, this is a kernel layer which runs an OpenBSD userland in Windows going back to Windows XP])

iwz_alt_os([SerenityOS], [https://serenityos.org/], [A love letter to '90s user interfaces with a custom Unix-like core])

iwz_alt_os([duckOS], [https://github.com/byteduck/duckOS], [An x86 monolithic kernel in C++ with graphical applications and command line utilities])

iwz_alt_os([Phantom OS], [https://old.reddit.com/r/EsotericOS/comments/d61xr2/phantom_os_based_on_a_concept_of_persistent/], [Based on a concept of persistent virtual memory, where "everything is an object"])

iwz_alt_os([Ghost OS], [https://old.reddit.com/r/EsotericOS/comments/d1zwsx/ghost_os_an_opensource_hobby_operating_system_and/], [An open-source hobby operating system and kernel])

iwz_alt_os([SharpOS], [https://old.reddit.com/r/EsotericOS/comments/d206g8/sharpos_a_computer_operating_system_based_on_the/], [A computer operating system based on the .NET Framework and C#])

iwz_alt_os([OpenServer 10], [https://old.reddit.com/r/EsotericOS/comments/d1wa2j/openserver_10_built_on_freebsd/], [Built on FreeBSD])

iwz_alt_os([BareMetal OS], [https://github.com/ReturnInfinity/BareMetal-OS], [64-bit OS Written in Assembly for x86-64 Systems])

iwz_alt_os([Retro UNIX], [http://www.singlix.com/runix/index.html], [Modified UNIX v1.1 Ported to the 8086 and 80386])

iwz_alt_os([ETH Oberon], [http://www.oberon.ethz.ch/], [A Pascal-Related Single-User Multi-Tasking Programming Environment])

iwz_alt_os([NewOS], [http://newos.org/], [An Older Small FOSS OS Focusing on Portability])

iwz_alt_os([VSTa], [http://www.vsta.org/], [An Abandoned POSIX-Compatible Microkernel OS Inspired by QNX and Plan 9 (Gopher Site)])

iwz_alt_os([Redox], [https://github.com/redox-os/redox], [An Experimental OS Written in the Rust Language])

iwz_alt_os([Coherent], [http://www.nesssoftware.com/home/mwc/source.php], [A Small Unix Originally Designed for x86 PCs in the 1980s, Recently Rereleased as OSS])

iwz_alt_os([osFree], [http://www.osfree.org/], [A FOSS Clone of IBM's OS/2])

iwz_alt_os([PilOS], [http://picolisp.com/wiki/?PilOS], [A Tiny, Bare-Metal LISP Implementation])

iwz_alt_os([DR-DOS Enhanced], [http://www.drdosprojects.de/], [A FOSS DOS Clone Based on DR-DOS])

iwz_alt_os([FUZIX], [https://github.com/EtchedPixels/FUZIX], [A port of System V UNIX to the Z80 CPU])

iwz_alt_os([OSv], [http://osv.io/], [A minimal OS with no memory protection designed to directly host the Java VM])

iwz_alt_os([ELKS], [http://elks.sourceforge.net/], [A tiny subset of Linux designed to run on 8086- 80286-based systems with limited resources])

iwz_alt_os([Haiku], [https://www.haiku-os.org//], [A FOSS reimplementation of BeOS])

iwz_alt_os([seL4], [http://sel4.systems/], [Operating system kernel with an end-to-end proof of implementation correctness and security enforcement])

iwz_alt_os([DexOS], [https://web.archive.org/web/20140108065701/http://www.dex-os.com/], [Tiny "game console-like" OS written in X86 assembly (Archive.org link as original is gone)])

iwz_alt_os([LUnix], [http://lng.sourceforge.net/], [A multitasking UNIX-like operating system for the Commodore 64])

iwz_alt_os([The Temple Operating System], [http://www.templeos.org/], [A "flat" x86-compatible non-networked operating system based on the C programming language])

iwz_alt_os([Pico OS], [http://picoos.sourceforge.net/], [A tiny real-time operating system for various platforms])

iwz_alt_os([NitrOS-9], [http://sourceforge.net/p/nitros9/wiki/Main_Page/], [A real-time, process-based, multitasking, multi-user, Unix-like operating system for the TRS-80 Color Computer])

iwz_alt_os([&#12392;&#12354;&#12427;OS], [http://www.toaruos.org/pages/about.html], ["A certain OS", a hobby kernel and supporting userspace, built mostly from scratch, in development since December of 2010])

iwz_alt_os([O3ONE], [http://www.o3one.org/], [The Object Oriented OS])

iwz_alt_os([AROS], [http://aros.sourceforge.net/], [A Free reimplementation of the Amiga OS for modern hardware])

iwz_alt_os([UZIX], [http://uzix.sourceforge.net/uzix1.0/index.php?page=down&amp;lang=us], [UNIX Implementation for MSX])

iwz_alt_os([Inferno], [http://www.vitanuova.com/inferno/], [Successor to Plan 9 with its own built-in VM, designed to run on top of other operating systems])

iwz_alt_os([PureDarwin], [http://www.puredarwin.org/], [Community fork of Darwin, the underpinnings of Mac OS X])

iwz_alt_os([Nemesis], [http://www.cl.cam.ac.uk/research/srg/netos/old-projects/nemesis/], [A microkernel OS designed to provide fine-grained guaranteed levels of all system resources])

iwz_alt_os([V7/x86], [http://www.nordier.com/v7x86/], [A port of UNIX V7 to X86])

iwz_alt_os([Xv6], [http://pdos.csail.mit.edu/6.828/2012/xv6.html], [A simple Unix-like teaching operating system])

iwz_alt_os([Plan 9], [http://plan9.bell-labs.com/plan9/], [A research system developed at Bell Labs starting in the late 1980s by a group including some of the original UNIX developers])

iwz_alt_os([HelenOS], [http://www.helenos.org/], [A complete and usable modern operating system, offering room for experimenting and research])

iwz_alt_os([Minix3], [http://www.minix3.org/], [A usable microkernel-based OS that preceded and inspired parts of Linux, not just for textbook examples anymore])

iwz_alt_os([ES Operating System], [https://code.google.com/p/es-operating-system/], [A new pure component operating system which makes web APIs available as primary OS interfaces])

iwz_alt_os([Amoeba], [ftp://ftp.cs.vu.nl/pub/amoeba/amoeba.html], [A powerful microkernel-based system that turns a collection of workstations or single-board computers into a transparent distributed system])

iwz_alt_os([MenuetOS], [http://www.menuetos.net/], [An OS primarily written in and for X86 assembly programming, though a C compiler is available])

iwz_alt_os([Syllable OS], [http://web.syllable.org/pages/index.html], [A FOSS user-friendly desktop OS with some popular software ports available])

iwz_alt_os([Visopsys], [http://www.visopsys.org/], [An alternative operating system for PC compatible computers under development since late 1997])

</dl>

include([footer.m4])
