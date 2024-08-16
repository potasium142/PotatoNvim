local CONST = require("const.sys_var")
local gtils = require("gtils")
local M = {}

M.opt = {
	linespace = -1,
	guifont = CONST.FONTS .. ":#h-none",
}
M.g = {
	neovide_floating_z_height = 3,
	neovide_floating_blur_amount_x = 10,
	neovide_floating_blur_amount_y = 10,
	neovide_scroll_animation_far_lines = 5,
	neovide_scroll_animation_length = 0.2,
}

gtils.load_opt(M)
