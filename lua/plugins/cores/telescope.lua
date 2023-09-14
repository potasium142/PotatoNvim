return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		dependencies = {
			"nvim-telescope/telescope-dap.nvim",
			"nvim-lua/plenary.nvim",
			"debugloop/telescope-undo.nvim",
			{
				"debugloop/telescope-undo.nvim",
				keys = {
					{ "tsu", "<cmd>Telescope undo<cr>" },
				},
			},
			{
				"tiagovla/scope.nvim",
				config = true,
				keys = {
					{ "tsb", "<cmd>Telescope scope buffers<cr>" },
				},
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
			require("telescope").load_extension("neoclip")
			require("telescope").load_extension("scope")
			require("telescope").load_extension("projects")
			require("telescope").load_extension("noice")
			require("telescope").load_extension("undo")
			require("telescope").load_extension("dap")
		end,
		keys = {
			{ "tsf", "<cmd>Telescope find_files<cr>" },
			{ "tsg", "<cmd>Telescope live_grep<cr>" },
			{ "tsh", "<cmd>Telescope help_tags<cr>" },
			{ "tsm", "<cmd>Telescope marks<cr>" },
		},
	},
}
