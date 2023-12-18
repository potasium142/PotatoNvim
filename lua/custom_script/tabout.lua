---Range for bracket scanning
local scan_range = 40
local jump_str = "qwertyuiop"
local max_bracket = 10
local namespace = vim.api.nvim_create_namespace("tabout")

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
	local table = {}
	for op, en in pairs(pairs_table) do
		table[op] = en
		table[en] = op
	end
	return table
end

local open_table = generate_table(pairs_bracket)

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
---@return table
local offset_cursor = function(off_row, off_col, cur_col, cur_row)
	vim.api.nvim_win_set_cursor(0, { cur_row + off_row, cur_col + off_col })
end

---Scan current string
---@param str string
---@param start integer
---@param eol integer
local scan_bracket = function(str, start, eol)
	local bracket_array = { 1 }
	local arr = { string.byte(str, start + 1, start + eol + 1) }
	for index, value in ipairs(arr) do
		local char = string.char(value)
		if open_table[char] then
			table.insert(bracket_array, index)
		end
	end
	return bracket_array
end

---Construct virtual line
---@param br_li table
---@param jmp_str string
---@return string
local construct_virt_line_str = function(br_li, jmp_str)
	local line = ""
	for i = 1, #br_li - 1, 1 do
		for _ = 2, br_li[i + 1] - br_li[i], 1 do
			line = line .. " "
		end
		line = line .. jmp_str:sub(i, i)
	end
	return line
end

local display_virt_line = function(col, row, line)
	vim.api.nvim_buf_set_extmark(0, namespace, row, col, {
		id = 1,
		virt_text = { { line } },
		virt_text_pos = "overlay",
		virt_lines_above = true,
	})
end

vim.keymap.set("i", "<Tab>", function()
	local pos = vim.api.nvim_win_get_cursor(0)
	if check_bracket(open_table, pos[2] + 1) then
		offset_cursor(0, 1, pos[2], pos[1])
	else
		vim.api.nvim_put({ "\t" }, "c", false, true)
	end
end)

-- vim.keymap.set("n", "`", function()
-- 	-- print(vim.fn.getchar())
-- 	local current_char = vim.api.nvim_get_current_line()
-- 	local pos = vim.api.nvim_win_get_cursor(0)
-- 	local bracks = scan_bracket(current_char, pos[2], 100)
-- 	print(vim.inspect(pos))
-- 	local virt_line = construct_virt_line_str(bracks, jump_str)
-- 	display_virt_line(pos[2], pos[1], virt_line)
-- end, { expr = true })
