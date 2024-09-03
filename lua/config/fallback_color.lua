local gtils = require("gtils")
local base16_color = {
	0x000000, -- #000
	0x800000, -- #800
	0x008000, -- #080
	0x808000, -- #880
	0x000080, -- #008
	0x800080, -- #808
	0x008080, -- #088
	0xc0c0c0, -- #ccc
	0x808080, -- #888
	0xf00000, -- #f00
	0x00f000, -- #0f0
	0xf0f000, -- #ff0
	0x0000f0, -- #00f
	0xf000f0, -- #f0f
	0x00f0f0, -- #0ff
	0xf0f0f0, -- #fff
}

local base16_24grey = gtils.gradent_rgb(0x080808, 0xeeeeee, 24)

gtils.set_group_hl_non_label("p_", base16_color)
gtils.set_group_hl_non_label("g_", base16_24grey)
