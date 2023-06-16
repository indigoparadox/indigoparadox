divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title], [RC2014 Assembly])
define([iwz_section], [projects])
divert(0)include([header.m4])

iwz_sect([Introduction])

iwz_p([As of this writing, we have not successfully managed to get this kit working. Troubleshooting attempts are described below.])

iwz_sect([Troubleshooting Attempts])

iwz_block_construction

iwz_suml_item(
   [2022-06-05],
   [Oscilloscope shows clock, address, and data lines are active. Cannot get it to send or receive anything on the SIO/2 serial ports. Tx and Rx just stay high even when sending data from the PC. Rx shows input when power is off but gets pulled high when on... iwz_img(
      [/images/rc2014/rc2014-ts-20220605.png]
      [Screenshot of logic analyzer attached to Tx/Rx lines: Tx line is high for two short intervals (labeled as being when the power is turned on) interrupted by longer intervals of it being low. Rx line is high the whole time, with short bursts of high-frequency cycles labeled "hitting enter in picocom/with no response." The high-frequency bursts are puled high (invisible) when Tx is high.])
   ])

iwz_suml_item(
   [2022-06-06],
   [Attached a logic probe to CE line on serial SIO/2. Output is very non-deterministic between boot attempts (power cycles are indicated by long "low" stretches.) iwz_img(
      [/images/rc2014/rc2014-ts-20220606.png],
      [Screenshot of logic analyzer: several longer periods of line high interrupted by longer periods of line low. The periods of line high contain very rapid low-high activity in irregular patterns.])
   ])

iwz_suml_item(
   [2022-06-21],
   [Got a bigger logic analyzer. It seems to be doing a whole string of NOPs but then eventually it starts executing from the ROM. iwz_var([0xf3 0xc3 0x93 0x01]) are the first four bytes at iwz_var([0x2000]) in the ROM dump. There are glitches here and there but that might just be the analyzer... iwz_img(
      [/images/rc2014/rc2014-ts-20220621.png],
      [Screenshot of logic analyzer: Z80 decoder is enabled and shows a few NOP instructions before showing instructions indicating CPU is reading from ROM.])
   ])

iwz_suml_item(
   [2023-06-15],
   [Walked each pin in each backplane connector to ensure all lanes are continuous between connectors and there is NO continuity between adjacent pins (except for double 5V pins and double ground pins). Determined lots of noise on serial line when backplane connected to power and turned OFF if either ROM board or clock board are connected. Based on this, built replacement ROM board with no change in behavior (including when powered off with new ROM and no clock inserted).])

include([footer.m4])
