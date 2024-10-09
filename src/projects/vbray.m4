divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title], [Raycaster in Visual Basic 4])
define([iwz_section], [projects])
divert(0)include([header.m4])

iwz_img(
   [/images/vbray/desktop.jpg],
   [Screenshot of the Raycaster running on a Windows 95 desktop with a "Windows 95 4.00.950" System Properties window open in the background showing that it's running on a 486 with 16 MB RAM.])

iwz_sect([Introduction])

iwz_p([iwz_a_repo([vbray], [indigoparadox], [vbray]) is an extremely simple raycasting proof-of-concept. It borrows heavily from Lodev's Raycasting tutorial, but it uses GDI lines to draw the walls on a Windows form.])

iwz_sect([Playing])

Uses WASD to move. Load the example world "Arcade.csv" from the File menu to start!

iwz_p([We've run it on a 486 DX-2 55 Mhz, but it was very slow. There are lower-resolution options for display if needed. There's also a minimap window which shows the path of the rays used for casting!])

iwz_sect([Data Formats])

iwz_p([Below is an annotation of the example starting map, Arcade.csv. The annotations give a general idea of how each line is structured. Values are separated by commas.])

iwz_diff(
   [Arcade.csv],
   iwz_diffl([x], [], [Determines ground color by hex number.])
   iwz_diffl([a], [1], [ground[,]&H3000])
   iwz_diffl([x], [], [Determines sky color by hex number.])
   iwz_diffl([a], [2], [sky[,]&Hffff00])
   iwz_diffl([x], [], [Map width in tiles. map statements must not be longer than this number.])
   iwz_diffl([a], [3], [width[,]20])
   iwz_diffl([x], [], [Map height in tiles. Must not have more map statements than this number.])
   iwz_diffl([a], [4], [height[,]20])
   iwz_diffl([a], [], [Version of reader this map is intended for.])
   iwz_diffl([a], [5], [version[,]1])
   iwz_diffl([x], [], [Starting positin in tiles (X/Y) followed by facing angle.])
   iwz_diffl([a], [6], [start[,]11[,]8[,]-0.5596647[,]0.8287189[,]0.5469547[,]0.3693788])
   iwz_diffl([x], [], [Wall definitions. Each is an index used in the map statements followed by light/dark hex colors and color names.])
   iwz_diffl([a], [7], [wall[,]1[,]&H808080[,]&H404040[,]gray])
   iwz_diffl([a], [8], [wall[,]2[,]&HFF00[,]&H8000[,]green])
   iwz_diffl([a], [9], [wall[,]3[,]&HFF[,]&H80[,]red])
   iwz_diffl([a], [10], [wall[,]4[,]&HFF00FF[,]&H800080[,]purple])
   iwz_diffl([a], [11], [wall[,]5[,]&H00[,]&H00[,]black])
   iwz_diffl([a], [12], [wall[,]6[,]&HFFFF[,]&H8080[,]yellow])
   iwz_diffl([a], [13], [wall[,]7[,]&HFFFF00[,]&H808000[,]cyan])
   iwz_diffl([a], [14], [wall[,]8[,]&H8000[,]&H4000[,]darkgreen])
   iwz_diffl([a], [15], [wall[,]9[,]&HFF0000[,]&H800000[,]blue])
   iwz_diffl([x], [], [Map in rows/columns. Each number is a 0 for free space or a number from the wall table above.])
   iwz_diffl([a], [16], [map[,]1[,]1[,]1[,]1[,]1[,]1[,]1[,]1[,]1[,]1[,]1[,]1[,]1[,]1[,]1[,]1[,]1[,]1[,]1[,]1])
   iwz_diffl([a], [17], [map[,]8[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]1])
   iwz_diffl([a], [18], [map[,]8[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]1])
   iwz_diffl([a], [19], [map[,]8[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]6[,]6[,]6[,]0[,]0[,]0[,]0[,]0[,]1])
   iwz_diffl([a], [20], [map[,]8[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]6[,]0[,]6[,]0[,]0[,]0[,]0[,]0[,]1])
   iwz_diffl([a], [21], [map[,]8[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]6[,]5[,]6[,]0[,]0[,]0[,]0[,]0[,]5])
   iwz_diffl([a], [22], [map[,]8[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]1])
   iwz_diffl([a], [23], [map[,]8[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]1])
   iwz_diffl([a], [24], [map[,]8[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]1])
   iwz_diffl([a], [25], [map[,]8[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]6[,]6[,]6[,]0[,]0[,]1])
   iwz_diffl([a], [26], [map[,]8[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]5[,]0[,]6[,]0[,]0[,]1])
   iwz_diffl([a], [27], [map[,]8[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]6[,]6[,]6[,]0[,]0[,]1])
   iwz_diffl([a], [28], [map[,]8[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]1])
   iwz_diffl([a], [29], [map[,]8[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]1])
   iwz_diffl([a], [30], [map[,]8[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]1])
   iwz_diffl([a], [31], [map[,]8[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]1])
   iwz_diffl([a], [32], [map[,]8[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]1])
   iwz_diffl([a], [33], [map[,]8[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]1])
   iwz_diffl([a], [34], [map[,]8[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]0[,]1])
   iwz_diffl([a], [35], [map[,]8[,]8[,]8[,]8[,]8[,]8[,]8[,]8[,]8[,]8[,]8[,]8[,]8[,]8[,]8[,]8[,]8[,]8[,]8[,]1])
   iwz_diffl([x], [], [Mobile definition: name of the mobile[,] followed by X/Y position[,] two walking animation frames (in .ico format)[,] and a string to say on interaction.])
   iwz_diffl([a], [36], [mobile[,]Maid[,]2[,]2[,]s_maid1.ico[,]s_maid2.ico[,]Fine weather- isn't it?])
   iwz_diffl([x], [], [Warp definition: location to warp from on current map (X/Y)[,] followed by name of map to warp to and location to start there (X/Y)[,] followed by angular facing direction.])
   iwz_diffl([a], [37], [warp[,]5[,]18[,]Cave.csv[,]4[,]2[,]7.912095E-02[,]0.996865[,]0.657931[,]-5.221983E-02])
)

iwz_p([Mobile icons are 16 colors Windows 3.x format. In theory, they can be 32x32, but it's only been tested with 16x16.])

include([footer.m4])

