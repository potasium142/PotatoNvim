return {
	"nvim-neo-tree/neo-tree.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	opts = {
		hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
		popup_border_style = "single",
		source_selector = {
			content_layout = "center",
			winbar = true,
			statusline = true,
		},
	},
	keys = {
		{ "<F2>", "<cmd>Neotree filesystem focus float toggle<cr>", mode = { "n", "i", "v" } },
		{ "<F3>", "<cmd>Neotree buffers focus float toggle<cr>",    mode = { "n", "i", "v" } }
	}
}
