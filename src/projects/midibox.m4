divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title], [MIDI Box])
define([iwz_section], [projects])
divert(0)include([header.m4])

iwz_img(
   [/images/midibox/midibox-out.jpg],
   [A black plastic box with DIN rail mount, D-shell connector, and two sets of MIDI out/in connectors (DIN and 3.5 miniplug).])

iwz_img(
   [/images/midibox/midibox-in.jpg],
   [The inside of the box, the D-shell connector connects to a JST connector on a perfboard, on which is mounted the two sets of MIDI out/in connectors (DIN and 3.5 miniplug) and some LEDs and ICs.])

iwz_sect(Introduction)

iwz_p([This is not particularly ground-breaking... a little DIN-mountable MIDI interface box to connect a PC game port to some MIDI devices. In particular, the innovations on display here are the alternative 3.5" miniplug ports which may be used alternatively to the DIN connectors (but not at the same time!)])

iwz_sect(Schematic)

iwz_img(
   [/images/midibox/midibox-sch.png],
   [Schematic of the MIDI box circuit. It's a basic MIDI interface circuit.])

iwz_p([The circuit is very simple. This schematic is missing the 3.5" miniplug for the MIDI-IN port (J1), but that should be trivial to add in parallel by copying the 3.5" jack (J3) wired to the MIDI-OUT port (J2).])

iwz_sect(Demonstration)

iwz_video(
   [/images/midibox/midisid-simcity.mp4],
   [Visual of the title screen for SimCity for Windows while the theme plays rendered through the MIDISID.])

iwz_p([Please enjoy this rendition of the SimCity for Windows theme. It's rendered from our iwz_a_ipage([/projects/t4850ep.html], [Tandy 4850 EP]) through the MIDI Box to a iwz_a([https://peacockmedia.software/midisid/], [MIDISID]).])

include([footer.m4])

