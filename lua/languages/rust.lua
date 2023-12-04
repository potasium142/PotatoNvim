require("lspconfig").rust_analyzer.setup({
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
return {
	"saecki/crates.nvim",
	event = { "BufRead Cargo.toml" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("crates").setup()
		vim.api.nvim_create_autocmd("BufRead", {
			group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
			pattern = "Cargo.toml",
			callback = function()
				cmp.setup.buffer({ sources = { { name = "crates" } } })
			end,
		})
	end,
}
