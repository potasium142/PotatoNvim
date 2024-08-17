local CONST = require("const.sys_var")
local gtils = require("gtils")
local M = {}

M.opt = {
	linespace = -1,
	guifont = CONST.FONTS .. ":#h-none",
	winblend = 40,
}
M.g = {
	neovide_floating_blur_amount_x = 14,
	neovide_floating_blur_amount_y = 14,
	neovide_scroll_animation_length = 0.2,
	neovide_floating_z_height = 3,
	neovide_floating_shadow = true,
	neovide_light_angle_degrees = 95,
	neovide_light_radius = 25,
	neovide_remember_window_size = true,
	neovide_scroll_animation_far_lines = true,
}

gtils.load_opt(M)
