local tabout_list = {
	["'"] = true,
	['"'] = true,
	[")"] = true,
	["]"] = true,
	["|"] = true,
	["`"] = true,
	[">"] = true,
	["}"] = true,
}

local cursor_col = vim.fn.col(".")
local cursor_line = vim.fn.line(".")

local is_end_bracket = function()
	cursor_col = vim.fn.col(".")
	cursor_line = vim.fn.line(".")
	local next_bracket = string.sub(vim.fn.getline("."), cursor_col, cursor_col)

	return tabout_list[next_bracket]
end

vim.keymap.set("i", "<Tab>", function()
	return is_end_bracket() and vim.fn.cursor(cursor_line, cursor_col + 1)
		or vim.api.nvim_put({ "\t" }, "c", false, true)
end)
