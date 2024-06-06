return {
	"goolord/alpha-nvim",
	lazy = false,
	config = function()
		local function update()
			require("lazy").update()
			require("lazy").clean()
			vim.cmd("TSUpdate all")
		end

		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		--Footer
		local function info()
			local version = vim.version()
			local stats = require("lazy").stats()
			local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
			local startup = "󱐋 " .. stats.loaded .. "/" .. stats.count .. " loaded in " .. ms .. "ms"
			return startup .. "     v" .. version.major .. "." .. version.minor .. "." .. version.patch
		end

		-- Set header
		dashboard.section.header.val = {
			"                        ██████                        ",
			"                      ██▒▒▒▒▒▒██                      ",
			"                    ██▒▒▒▒▒▒▒▒▒▒██                    ",
			"                    ██▒▒▒▒▒▒▒▒▒▒██                    ",
			"                      ██▒▒▒▒▒▒██                      ",
			"                        ██░░██                        ",
			"                  ████████░░████████                  ",
			"              ████░░░░░░██░░▒▒░░░░▒▒████              ",
			"            ██▒▒░░░░░░░░░░░░░░░░░░░░▒▒▒▒██            ",
			"        ██░░░░░░░░░░░░░░▒▒▒▒░░░░░░░░  ▒▒░░▒▒██        ",
			"      ██░░░░░░░░░░░░░░▒▒  ██▒▒░░░░░░████░░▒▒██        ",
			"      ██▒▒░░░░░░▒▒░░░░▒▒████░░░░░░░░████░░░░▒▒██      ",
			"    ██░░░░░░░░░░░░░░░░░░████▒▒░░░░░░▒▒▒▒░░░░▒▒██      ",
			"    ██░░░░░░░░░░░░░░░░░░▒▒▒▒░░▒▒▒▒  ░░▒▒▒▒▒▒▒▒▒▒████  ",
			"  ████████░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒████▒▒██",
			"██▒▒██▒▒▒▒██████░░████████▒▒▒▒▒▒████▒▒░░██▒▒██▒▒▒▒████",
			"██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██▒▒▒▒▒▒▒▒██████▒▒▒▒████▒▒██▒▒▒▒▒▒██  ",
			"      ██████▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒██▒▒▒▒▒▒▒▒▒▒▒▒██████    ",
			"            ██  ████████  ████  ████  ████████        ",
		}

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("n", "  > New file (temp)", ":e /tmp/nvim<CR>"),
			dashboard.button("p", "  > Project", ":Telescope projects<CR>"),
			dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h <CR>"),
			dashboard.button("u", "  > Update", "", {
				callback = function()
					update()
				end,
			}),
			dashboard.button("q", "󰗼  > Quit", ":qa<CR>"),
		}

		alpha.setup(dashboard.opts)

		AutoCMD("User", {
			pattern = "LazyVimStarted",
			callback = function()
				dashboard.section.footer.val = info()
				pcall(vim.cmd.AlphaRedraw)
			end,
		})
	end,
	keys = {
		{ "<Home>", "<cmd>Alpha<cr>", "n" },
	},
}
