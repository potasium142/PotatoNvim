local M = {}

local gr_name = "Global"

M.init_global_colors = function(colors)
	for i, color in ipairs(colors) do
		local name = gr_name .. "Base" .. i - 1

		local color_table = {
			fg = color,
			bg = colors[1],
			sp = color,
			ctermfg = i + 1,
			ctermbg = 0,
		}

		local color_table_i = {
			bg = color,
			fg = colors[1],
			sp = color,
			ctermfg = 0,
			ctermbg = 16 - i,
		}

		vim.api.nvim_set_hl(0, name, color_table)
		vim.api.nvim_set_hl(0, name .. "I", color_table_i)
	end
end

return M
