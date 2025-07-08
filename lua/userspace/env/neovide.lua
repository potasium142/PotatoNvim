local detection = function()
	return vim.g.neovide
end

local option = {
	opt = {
		winblend = 20,
		pumblend = 20,
	},
	g = {
		neovide_opacity = 0.9,
		neovide_cursor_trail_size = 0.7,
		neovide_cursor_animation_length = 0.14,
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
	},
}

--- @type EnvConfig
return {
	opt = option,
	detection = detection(),
}
