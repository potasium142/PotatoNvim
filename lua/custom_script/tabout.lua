local pairs_bracket = {
	["("] = ")",
	["["] = "]",
	["<"] = ">",
	["{"] = "}",
	["'"] = "'",
	['"'] = '"',
	["|"] = "|",
	["`"] = "`",
}

---Generate pairs table
---@param pairs_table table
---@return table
local generate_table = function(pairs_table)
	local jump_table = {}
	for op, en in pairs(pairs_table) do
		jump_table[op] = true
		jump_table[en] = true
	end
	return jump_table
end

local jump_tables = generate_table(pairs_bracket)

---Check bracket
---@param brackets table
---@param column integer
---@return boolean
local check_bracket = function(brackets, column)
	local current_char = vim.api.nvim_get_current_line():sub(column, column)
	return brackets[current_char] and true or false
end

---Offset cursor
---@param off_row integer
---@param off_col integer
---@param cur_col integer
---@param cur_row integer
local offset_cursor = function(off_row, off_col, cur_col, cur_row)
	vim.api.nvim_win_set_cursor(0, { cur_row + off_row, cur_col + off_col })
end

vim.keymap.set("i", "<Tab>", function()
	local pos = vim.api.nvim_win_get_cursor(0)
	if check_bracket(jump_tables, pos[2] + 1) then
		offset_cursor(0, 1, pos[2], pos[1])
	else
		vim.api.nvim_put({ "\t" }, "c", false, true)
	end
end)

vim.keymap.set("i", "<S-Tab>", function()
	local pos = vim.api.nvim_win_get_cursor(0)
	if check_bracket(jump_tables, pos[2]) then
		offset_cursor(0, -1, pos[2], pos[1])
	else
		vim.api.nvim_put({ "\t" }, "c", false, true)
	end
end)
