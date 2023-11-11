local icons = require("config.icons")
return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	lazy = true,
	opts = {
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
		sources = {
			"filesystem",
			"buffers",
			"git_status",
			"document_symbols",
		},
	},
	keys = {
		{ "<F2>", "<cmd>Neotree toggle position=left<cr>" },
		{ "<F3>", "<cmd>Neotree toggle buffers<cr>" },
		{ "<F4>", "<cmd>Neotree toggle document_symbols<cr>" },
		{ "<F5>", "<cmd>Neotree toggle git_status<cr>" },
	},
}
