local font_size = 15
local fonts = "Iosevka Second Custom,Symbols Nerd Font:h"
local g_env = {}

g_env.neovide = {
	opt = {
		winblend = 00,
		linespace = -1,
		guifont = fonts .. font_size,
	},
	g = {
		neovide_transparency = 0.97,
		neovide_floating_z_height = 3,
		neovide_floating_blur_amount_x = 10,
		neovide_floating_blur_amount_y = 10,
		neovide_scroll_animation_far_lines = 5,
		neovide_unlink_border_highlights = true,
		neovide_scroll_animation_length = 0.2,
	},
}

for env, opt in pairs(g_env) do
	if vim.g[env] then
		for op, conf in pairs(opt) do
			for k, v in pairs(conf) do
				vim[op][k] = v
			end
		end
	end
end
