local M = {}

local gr_name = "Global"

M.init_global_colors = function(colors)
	for i, color in ipairs(colors) do
		local name = gr_name .. "Base" .. i - 1

		local color_table = {
			fg = color,
			bg = "none",
			sp = color,
			ctermfg = i - 1,
			ctermbg = "none",
		}

		local color_table_i = {
			bg = color,
			fg = "bg",
			sp = color,
			ctermfg = 0,
			ctermbg = i - 1,
		}

		vim.api.nvim_set_hl(0, name, color_table)
		vim.api.nvim_set_hl(0, name .. "I", color_table_i)
	end
end

return M
