local open_bracket = {
	"(",
	"[",
	"<",
	"{",
	"'",
	'"',
	"|",
	"`",
}

local close_bracket = {
	")",
	"]",
	">",
	"}",
	"'",
	'"',
	"|",
	"`",
}

---Check bracket
---@param brackets table
---@param column integer
---@return boolean
local check_bracket = function(brackets, column)
	local current_char = vim.api.nvim_get_current_line():sub(column, column)
	return vim.tbl_contains(brackets, current_char) or false
end

local function tab(st_table, nd_table, offset, check_offset)
	local pos = vim.api.nvim_win_get_cursor(0)
	local exe_tab = function()
		vim.api.nvim_win_set_cursor(0, { pos[1], pos[2] + offset })
	end
	if check_bracket(st_table, pos[2] + check_offset) then
		exe_tab()
	elseif check_bracket(nd_table, pos[2] + check_offset) then
		exe_tab()
	else
		vim.api.nvim_put({ "\t" }, "c", false, true)
	end
end

vim.keymap.set("i", "<Tab>", function()
	tab(open_bracket, close_bracket, 1, 1)
end)

vim.keymap.set("i", "<S-Tab>", function()
	tab(close_bracket, open_bracket, -1, 0)
end)
