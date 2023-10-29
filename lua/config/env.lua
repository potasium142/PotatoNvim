local font_size = 16
if G.neovide then
	Set.guifont = "Iosevka Second Custom, Symbols Nerd Font Mono, Symbols Nerd Font Mono Regular,Symbols Nerd Font, Symbols Nerd Font Mono Regular:h"
		.. font_size
	G.neovide_transparency = 0.92
	G.neovide_refresh_rate = 60
	G.neovide_fullscreen = false
	Set.winblend = 40
	G.neovide_floating_blur_amount_x = 10
	G.neovide_floating_blur_amount_y = 10
	Set.linespace = -1
end
