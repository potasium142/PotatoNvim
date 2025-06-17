return {
	-- {
	-- 	"RRethy/base16-nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd.colorscheme("base16-everforest")
	-- 	end,
	-- },
	{

		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function(_, opts)
			local everforest = require("everforest")

			everforest.setup(opts)
			everforest.load()
		end,
	},
}
