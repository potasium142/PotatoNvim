return {
	"kevinhwang91/nvim-ufo",
	config = function()
		Set.foldcolumn = "1" -- '0' is not bad
		Set.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		Set.foldlevelstart = -1
		Set.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
		Set.foldenable = true
		Set.foldmethod = 'manual'

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
				return { 'treesitter', 'indent' }
			end,
			fold_virt_text_handler = handler,
		})
		Map('n', 'zm', require('ufo').closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
	end
}
