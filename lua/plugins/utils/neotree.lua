local icons = require("const.icons_text")
return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	opts = {
		filesystem = {
			hijack_netrw_behavior = "open_current",
			window = {
				mappings = {
					["e"] = "open_in_explorer",
				},
			},
			commands = {
				open_in_explorer = function(state)
					local node = state.tree:get_node()
					local path = node:get_id()
					vim.ui.open(path)
				end,
			},
		},
		default_component_configs = {
			git_status = {
				symbols = {
					added = icons.git.FileStaged,
					modified = icons.git.FileModified,
					deleted = icons.git.FileDeleted,
					renamed = icons.git.FileRenamed,
					untracked = icons.git.FileUntracked,
					ignored = icons.git.FileIgnored,
					unstaged = icons.git.FileUnstaged,
					staged = icons.git.FileStaged,
					conflict = icons.git.FileConflict,
				},
			},
			modified = {
				symbol = icons.buffer.Modified,
			},
		},
		window = {
			width = 30,
			position = "left",
		},
		sources = {
			"filesystem",
			"buffers",
			"git_status",
			"document_symbols",
		},
	},
	config = function(_, opts)
		vim.fn.sign_define("DiagnosticSignError", { text = "E", texthl = "DiagnosticSignError" })
		vim.fn.sign_define("DiagnosticSignWarn", { text = "W", texthl = "DiagnosticSignWarn" })
		vim.fn.sign_define("DiagnosticSignInfo", { text = "I", texthl = "DiagnosticSignInfo" })
		vim.fn.sign_define("DiagnosticSignHint", { text = "H", texthl = "DiagnosticSignHint" })

		require("neo-tree").setup(opts)
	end,

	keys = {
		{ "<F2>", "<cmd>Neotree toggle<cr>" },
		{ "<F3>", "<cmd>Neotree toggle buffers<cr>" },
		{ "<F4>", "<cmd>Neotree toggle document_symbols<cr>" },
		{ "<F5>", "<cmd>Neotree toggle git_status<cr>" },
	},
}
