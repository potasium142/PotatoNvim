return {
	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup {}
		end
	},
	{
		"axieax/urlview.nvim",
		config = function()
			require("urlview").setup()
		end,
	},
	{
		"AckslD/nvim-neoclip.lua",
		config = function()
			local function is_whitespace(line)
				return vim.fn.match(line, [[^\s*$]]) ~= -1
			end

			local function all(tbl, check)
				for _, entry in ipairs(tbl) do
					if not check(entry) then
						return false
					end
				end
				return true
			end

			require("neoclip").setup({
				filter = function(data)
					return not all(data.event.regcontents, is_whitespace)
				end,
			})
		end
	},
	{
		"tiagovla/scope.nvim",
		lazy = false,
		config = true
	},
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		dependencies = {
			"axieax/urlview.nvim",
			"debugloop/telescope-undo.nvim",
			"ahmedkhalf/project.nvim",
			"AckslD/nvim-neoclip.lua",
			"tiagovla/scope.nvim",
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
					},
				},
			}
		end,
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)
			telescope.load_extension("noice")
			telescope.load_extension('projects')
			telescope.load_extension("persisted")
			telescope.load_extension("scope")
			telescope.load_extension("neoclip")
			telescope.load_extension("undo")
		end,
		keys = {
			{ "tsf", "<cmd>Telescope find_files<cr>" },
			{ "tsb", "<cmd>Telescope scope buffers<cr>" },
			{ "tsu", "<cmd>Telescope undo<cr>" },
			{ "tsg", "<cmd>Telescope live_grep<cr>" },
			{ "tsh", "<cmd>Telescope help_tags<cr>" },
			{ "tsy", "<cmd>Telescope neoclip<CR>" },
			{ "tsl", "<cmd>UrlView<cr>" }
		}
	}
}
