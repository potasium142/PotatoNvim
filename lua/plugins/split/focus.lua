return {
	"nvim-focus/focus.nvim",
	lazy = false,
	enabled = true,
	version = false,
	init = function()
		local ignore_filetypes = { "neo-tree" }
		local ignore_buftypes = { "nofile", "prompt", "popup" }

		local augroup = vim.api.nvim_create_augroup("FocusDisable", { clear = true })

		vim.api.nvim_create_autocmd("WinEnter", {
			group = augroup,
			callback = function(_)
				vim.b.focus_disable = vim.tbl_contains(ignore_buftypes, vim.bo.filetype)
			end,
			desc = "Disable focus autoresize for BufType",
		})

		vim.api.nvim_create_autocmd("FileType", {
			group = augroup,
			callback = function()
				vim.b.focus_disable = vim.tbl_contains(ignore_filetypes, vim.bo.filetype)
			end,
			desc = "Disable focus autoresize for FileType",
		})
	end,
	opt = {},
}
