return {
	"nvim-focus/focus.nvim",
	lazy = false,
	enabled = true,
	init = function()
		local ignore_filetypes = { "neo-tree", "gitsigns-blame" }
		local ignore_buftypes = { "nofile", "prompt", "popup" }

		local augroup = vim.api.nvim_create_augroup("FocusDisable", { clear = true })
		vim.api.nvim_create_autocmd("WinEnter", {
			group = augroup,
			callback = function(_)
				if vim.tbl_contains(ignore_buftypes, vim.bo.buftype) then
					vim.w.focus_disable = true
				else
					vim.w.focus_disable = false
				end
			end,
			desc = "Disable focus autoresize for BufType",
		})

		vim.api.nvim_create_autocmd("FileType", {
			group = augroup,
			callback = function(_)
				if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
					vim.b.focus_disable = true
				else
					vim.b.focus_disable = false
				end
			end,
			desc = "Disable focus autoresize for FileType",
		})
	end,
	opts = {
		ui = {
			relativenumber = true,
			absolutenumber_unfocussed = true,
		},
	},
	config = function(opts, _)
		require("focus").setup(opts)
	end,
}
