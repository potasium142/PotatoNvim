local ascii_potato = require("const.potato_ascii")
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
			local ver = vim.version()
			local stats = require("lazy").stats()
			local ms = math.floor(stats.startuptime)
			local startup = "󱐋 " .. stats.loaded .. "/" .. stats.count .. " loaded in " .. ms .. "ms"
			return startup .. "     v" .. ver.major .. "." .. ver.minor .. "." .. ver.patch
		end

		-- Set header
		math.randomseed(os.time())
		dashboard.section.header.val = ascii_potato[math.random(#ascii_potato)]

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("p", "  > Quick tempfile", ":e /tmp/nvim<CR>"),
			dashboard.button("e", "  > New/Edit file", "", {
				callback = function()
					vim.ui.input({
						prompt = "File path",
						default = nil,
						completion = "file",
					}, function(f)
						if f ~= nil then
							vim.cmd.edit(f)
						end
					end)
				end,
			}),
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
			once = true,
		})
	end,
	keys = {
		{ "<Home>", "<cmd>Alpha<cr>", "n" },
	},
}
