local font_size = 15
local fonts =
	"Iosevka Second Custom, Symbols Nerd Font Mono, Symbols Nerd Font Mono Regular,Symbols Nerd Font, Symbols Nerd Font Mono Regular:h"
local g_env = {}

g_env.neovide = {
	opt = {
		winblend = 40,
		linespace = -1,
		guifont = fonts .. font_size,
	},
	g = {
		neovide_transparency = 0.92,
		neovide_refresh_rate = 120,
		neovide_fullscreen = false,
		neovide_floating_blur_amount_x = 10,
		neovide_floating_blur_amount_y = 10,
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
