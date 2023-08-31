return {
	"kevinhwang91/nvim-ufo",
	lazy = false,
	enabled = true,
	dependencies = {
		"kevinhwang91/promise-async",
		"nvim-treesitter/nvim-treesitter",
	},
	init = function()
		Set.foldcolumn = "1" -- '0' is not bad
		Set.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		Set.foldlevelstart = -1
		Set.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
		Set.foldenable = true

		local fold_group = AutoGroup("FoldsGroup", { clear = true })
		AutoCMD({ "BufWritePre", "BufWinLeave", "InsertEnter" }, {
			group = fold_group,
			pattern = "*.*",
			callback = function()
				vim.cmd.mkview()
			end,
		})

		AutoCMD({ "BufWritePost", "BufWinEnter", "InsertLeave" }, {
			group = fold_group,
			pattern = "*.*",
			callback = function()
				vim.cmd.loadview({ mods = { emsg_silent = true } })
			end,
		})
	end,
	config = function()
		local handler = function(virtText, lnum, endLnum, width, truncate)
			local newVirtText = {}
			local suffix = ("    ⌊ %d⌉"):format(endLnum - lnum)
			local sufWidth = vim.fn.strdisplaywidth(suffix)
			local targetWidth = width - sufWidth
			local curWidth = 0
			for _, chunk in ipairs(virtText) do
				local chunkText = chunk[1]
				local chunkWidth = vim.fn.strdisplaywidth(chunkText)
				if targetWidth > curWidth + chunkWidth then
					table.insert(newVirtText, chunk)
				else
					chunkText = truncate(chunkText, targetWidth - curWidth)
					local hlGroup = chunk[2]
					table.insert(newVirtText, { chunkText, hlGroup })
					chunkWidth = vim.fn.strdisplaywidth(chunkText)
					if curWidth + chunkWidth < targetWidth then
						suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
					end
					break
				end
				curWidth = curWidth + chunkWidth
			end
			table.insert(newVirtText, { suffix, "MoreMsg" })
			return newVirtText
		end

		require("ufo").setup({
			provider_selector = function(bufnr, filetype, buftype)
				return { "treesitter", "indent" }
			end,
			fold_virt_text_handler = handler,
		})

		local function hateRepeatFold(char)
			local function setScrollOff(val)
				local view = vim.fn.winsaveview()
				vim.wo.so = val
				vim.fn.winrestview(view)
			end

			local event = require("ufo.lib.event")
			event:emit("setOpenFoldHl")
			vim.keymap.set("n", "h", function()
				local shouldClose = vim.fn.foldlevel(".") ~= 0
				if shouldClose then
					event:emit("setOpenFoldHl", false)
					setScrollOff(10)
				end
				return shouldClose and "zc" or "h"
			end, { buffer = 0, expr = true })
			vim.keymap.set("n", "l", function()
				local shouldOpen = vim.fn.foldclosed(".") ~= -1
				if shouldOpen then
					event:emit("setOpenFoldHl", false)
					setScrollOff(10)
				end
				return shouldOpen and "zo" or "l"
			end, { buffer = 0, expr = true })
			vim.api.nvim_create_autocmd("CursorMoved", {
				group = vim.api.nvim_create_augroup("HateRepeatFoldAug", {}),
				buffer = 0,
				once = true,
				callback = function()
					pcall(vim.keymap.del, "n", "h", { buffer = 0 })
					pcall(vim.keymap.del, "n", "l", { buffer = 0 })
					setScrollOff(0)
					event:emit("setOpenFoldHl")
				end,
			})
			return "mzz" .. char
		end

		for _, c in ipairs({ "c", "o", "a", "C", "O", "A", "v" }) do
			vim.keymap.set("n", "z" .. c, function()
				return hateRepeatFold(c)
			end, { expr = true })
		end
	end,
	keys = {
		{
			"zm",
			function()
				require("ufo").closeFoldsWith()
			end,
		},
	},
}
