local b = require("bit")
local M = {}

M.load_opt = function(opt_table)
	for key, value in pairs(opt_table) do
		for opt, cfg in pairs(value) do
			vim[key][opt] = cfg
		end
	end
end

---Get hex color from highlight
---@param name string
---@param key string
---@return string
M.get_hl = function(name, key)
	local dec_color = vim.api.nvim_get_hl(0, { name = name, link = false })[key]
	if dec_color == nil then
		return "#ff00ff"
	end
	return "#" .. string.sub(b.tohex(dec_color), 3)
end

---Set group hl
---@param prefix string
---@param hls table
M.set_group_hl = function(prefix, hls)
	for name, color in pairs(hls) do
		vim.api.nvim_set_hl(0, prefix .. name, color)
	end
end

M.set_group_hl_non_label = function(prefix, hls)
	for index, color in ipairs(hls) do
		color = {
			sp = color,
			fg = color,
			bg = color,
		}
		vim.api.nvim_set_hl(0, prefix .. (index - 1), color)
	end
end

M.set_group_hl_non_label_cterm = function(prefix, hls)
	for index, color in ipairs(hls) do
		color = {
			cterm = color,
			ctermfg = color,
			ctermbg = color,
		}
		vim.api.nvim_set_hl(0, prefix .. (index - 1), color)
	end
end

M.gradent = function(start_hex, end_hex, res)
	res = res - 1
	local delta = (end_hex - start_hex) / res
	local color_table = {}

	for i = 0, res, 1 do
		color_table[i] = (i * delta + start_hex)
	end

	return color_table
end

M.gradent_rgb = function(start_hex, end_hex, res)
	-- why luajit?
	-- local delta_r = (((end_hex - start_hex) & 0xff0000) >> 16) / res
	-- local delta_g = (((end_hex - start_hex) & 0xff00) >> 8) / res
	-- local delta_b = ((end_hex - start_hex) & 0xff) / res

	local delta_r = math.floor(b.rshift(end_hex - start_hex, 16) / res)
	local delta_g = math.floor(b.band((b.rshift(end_hex - start_hex, 8)), 0xff) / res)
	local delta_b = math.floor(b.band((end_hex - start_hex), 0xff) / res)

	local color_table = {}

	for i = 0, res, 1 do
		local dr = delta_r * i
		local dg = delta_g * i
		local db = delta_b * i

		local color = b.lshift(dr, 16) + b.lshift(dg, 8) + db
		color_table[i] = (color + start_hex)
	end

	return color_table
end

return M
