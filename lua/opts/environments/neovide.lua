local CONST = require("const.sys_var")
local gtils = require("gtils")
local M = {}
local padding = 1

M.opt = {
	linespace = 0,
	guifont = CONST.FONTS .. ":h14:#h-none",
	winblend = 40,
	pumblend = 40,
	termguicolors = false,
}

M.g = {
	neovide_padding_top = padding,
	neovide_padding_bottom = padding,
	neovide_padding_left = padding,
	neovide_padding_right = padding,
	neovide_floating_blur_amount_x = 14,
	neovide_floating_blur_amount_y = 14,
	neovide_floating_z_height = 14,
	neovide_floating_shadow = true,
	neovide_light_angle_degrees = 5,
	neovide_light_radius = 5,
	neovide_remember_window_size = true,
	neovide_refresh_rate_idle = 5,
	neovide_profiler = false,
	neovide_scroll_animation_far_lines = 2,
	neovide_cursor_animation_length = 0.07,
	neovide_cursor_smooth_blink = true,
	neovide_cursor_trail_size = 0.7,
}

gtils.load_opt(M)
