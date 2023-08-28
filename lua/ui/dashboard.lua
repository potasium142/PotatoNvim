return {
	"goolord/alpha-nvim",
	lazy = false,
	config = function()
		local function update()
			vim.cmd "TSUpdate all"
			require("lazy").update()
			require("lazy").clean()
		end

		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		local version = vim.version()
		--Footer
		local function info()
			local total_plugins = require('lazy').stats().count
			local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
			local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
			return datetime .. "   " .. total_plugins .. " plugins" .. nvim_version_info
		end


		-- Set header
		dashboard.section.header.val = {
			"                                                     ",
			"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			"                                                     ",
			info(),
		}

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("c", "󱛣  > Restore Session", ":SessionLoadLast<CR>"),
			dashboard.button("p", "  > Project", ":Telescope projects<CR>"),
			dashboard.button("r", "󱃕  > Session", ":Telescope persisted<CR>"),
			dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h <CR>"),
			dashboard.button("u", "  > Update", "", {
				callback = function()
					update()
				end
			}),
			dashboard.button("q", "󰗼  > Quit NVIM", ":qa<CR>"),
		}


		alpha.setup(dashboard.opts)
	end,
	keys = {
		{ "<Home>", "<cmd>Alpha<cr>", mode = { 'n', 'v', 'i' } }
	}
}
