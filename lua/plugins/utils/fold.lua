return {
	"kevinhwang91/nvim-ufo",
	lazy = false,
	enabled = true,
	dependencies = {
		"kevinhwang91/promise-async",
		"nvim-treesitter/nvim-treesitter",
		"neovim/nvim-lspconfig",
	},
	init = function()
		Set.foldcolumn = "1" -- '0' is not bad
		Set.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		Set.foldlevelstart = -1
		Set.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
		Set.foldenable = true

		local fold_group = AutoGroup("FoldsGroup", { clear = true })

		AutoCMD("FileType", {
			group = fold_group,
			pattern = { "sagaoutline", "neo-tree" },
			callback = function()
				require("ufo").detach()
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

		local function customizeSelector(bufnr)
			local function handleFallbackException(err, providerName)
				if type(err) == "string" and err:match("UfoFallbackException") then
					return require("ufo").getFolds(bufnr, providerName)
				else
					return require("promise").reject(err)
				end
			end

			return require("ufo")
				.getFolds(bufnr, "lsp")
				:catch(function(err)
					return handleFallbackException(err, "treesitter")
				end)
				:catch(function(err)
					return handleFallbackException(err, "indent")
				end)
		end

		require("ufo").setup({
			provider_selector = function(bufnr, filetype, buftype)
				return customizeSelector
			end,
			fold_virt_text_handler = handler,
		})
	end,
}
