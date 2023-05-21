divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title],[The indigoparadox Web Zone: PSUBot])
divert(0)include([header.m4])

iwz_block_quality

iwz_p([Tentatively called the PSUBot, a remote-controlled rover built mostly out of spare parts and junk I had lying around. I'm posting this now since I'm not planning on bringing my tablet due to the fact that I'll probably be bicycling to the meeting and I want to provide links/information from home where I have them beforehand.])

iwz_p([I think of the PSUBot as more of a "puppet" than a robot for the moment due to the lack of on-board sensors and the ample control surfaces/colorful LEDs added for "personality". The MSP430G2553 is its primary control processor; it doesn't have anything more power than that on-board in its standard configuration, though it does have room to carry something like a Raspberry Pi or whatever as a ride-along payload to be spliced into its current power/communication system. It can communicate remotely with other devices as a slave via Bluetooth RFCOMM sockets using the Serial Port Profile.])

iwz_p([I've written a few example programs for controlling the PSUBot from various devices via its crude RTOS, available in the iwz_a_repo([PSUBot repository], [indigoparadox], [psubot]). An Android application for controlling it from a cellphone are available in the iwz_a_repo([PSUBot Android repository], [indigoparadox], [psubot-android]). Any code not marked otherwise should be considered to be licensed under GPLv3.])

iwz_p([And finally, some images:])

iwz_img(
   [/images/psubot/front-l.jpg],
   [PSUBot (PC power supply with wheels and a CD-ROM laser face, front left.])

iwz_img(
   [/images/psubot/front-r.jpg],
   [PSUBot (PC power supply with wheels and a CD-ROM laser face, front right.])

iwz_img(
   [/images/psubot/rear-l.jpg],
   [PSUBot (PC power supply with wheels and a CD-ROM laser face, rear left.])

iwz_img(
   [/images/psubot/inside-over.jpg],
   [Inside PSUBot (Some perfboards stacked on top of a red board, AA batteries.])

iwz_p([And some closeups of the perfboard/Launchpad processing core:])

iwz_img(
   [/images/psubot/inside-l.jpg],
   [Inside PSUBot (Closeup of the red circuit board under perfboards.])

iwz_p([The ICs are L293D motor drivers for the eye rack/pinion and the drive wheels. The heatsink on top is attached to the 5V supply regulator from the batteries.])

iwz_p([The Bluetooth communication module is one of those commonly available surface-mount Bluetooth daughterboards soldered down on top of some kapton tape. It's mounted under the top perfboard expansion, as seen here:])

iwz_img(
   [/images/psubot/inside-btmodule-close.jpg],
   [Inside PSUBot (Closeup of the Bluetooth module soldered to perfboard.])

iwz_p([I stopped working on the PSUBot a couple weeks ago because I didn't want to break it too badly before the meeting. In the future I plan to maybe add some sensors and possibly another MSP430 to manage them and communicate with the primary MSP430 via a 1-wire bus. I also hope to add a remote bootloader to upload new firmwares to the device in action, on the software side. Therefore, files attached or other content may be subject to change.])

include([footer.m4])
