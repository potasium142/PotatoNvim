local CONST = require("const.sys_var")
local gtils = require("gtils")
local M = {}

M.opt = {
	linespace = -1,
	guifont = CONST.FONTS .. ":h13:#h-none",
	winblend = 40,
	pumblend = 40,
}

M.g = {
	neovide_padding_top = 10,
	neovide_padding_bottom = 10,
	neovide_padding_left = 3,
	neovide_padding_right = 3,
	neovide_floating_blur_amount_x = 14,
	neovide_floating_blur_amount_y = 14,
	neovide_floating_z_height = 3,
	neovide_floating_shadow = true,
	neovide_light_angle_degrees = 95,
	neovide_light_radius = 25,
	neovide_remember_window_size = true,
	neovide_scroll_animation_far_lines = true,
}

gtils.load_opt(M)
