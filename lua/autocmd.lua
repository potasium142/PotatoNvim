local fn = vim.fn

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local general = augroup("general", {})

autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
	group = general,
	desc = "Disable New Line Comment",
})

autocmd({ "BufLeave", "InsertLeave" }, {
	callback = function()
		if vim.bo.filetype ~= "" and vim.bo.buftype == "" then
			vim.cmd("silent! w")
		end
	end,
	group = general,
	desc = "Auto Save",
})
