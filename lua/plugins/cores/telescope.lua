return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		dependencies = {
			"nvim-telescope/telescope-dap.nvim",
			"nvim-lua/plenary.nvim",
			"debugloop/telescope-undo.nvim",
			{
				"nvim-telescope/telescope-file-browser.nvim",
				dependencies = {
					"nvim-lua/plenary.nvim",
				},
			},
			{
				"debugloop/telescope-undo.nvim",
			},
			{
				"tiagovla/scope.nvim",
				config = true,
			},
			{
				"ahmedkhalf/project.nvim",
				config = function()
					require("project_nvim").setup()
				end,
			},

			"AckslD/nvim-neoclip.lua",
			"folke/noice.nvim",
		},
		opts = function()
			local actions = require("telescope.actions")
			return {
				defaults = {
					mappings = {
						n = {
							["s"] = actions.select_horizontal,
							["v"] = actions.select_vertical,
							["q"] = actions.close,
							["C-j"] = actions.preview_scrolling_down,
							["<C-k>"] = actions.preview_scrolling_up,
						},
					},
					borderchars = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
				},
				extensions = {
					file_browser = {
						hijack_netrw = true,
					},
					undo = {
						side_by_side = true,
						mappings = {
							n = {
								["<cr>"] = require("telescope-undo.actions").yank_additions,
								["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
								["<C-cr>"] = require("telescope-undo.actions").restore,
							},
						},
					},
				},
			}
		end,
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)
			telescope.load_extension("undo")
			telescope.load_extension("neoclip")
			telescope.load_extension("scope")
			telescope.load_extension("projects")
			telescope.load_extension("noice")
			telescope.load_extension("undo")
			telescope.load_extension("dap")
			telescope.load_extension("file_browser")
		end,
		keys = {
			{ "tsf", "<cmd>Telescope find_files<cr>" },
			{ "tsg", "<cmd>Telescope live_grep<cr>" },
			{ "tsh", "<cmd>Telescope help_tags<cr>" },
			{ "tsm", "<cmd>Telescope marks<cr>" },
			{ "<F2>", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>" },
			{ "tsu", "<cmd>Telescope undo<cr>" },
			{ "tsb", "<cmd>Telescope scope buffers<cr>" },
		},
		cmd = {
			"Telescope",
		},
	},
}
