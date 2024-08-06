return {
	"monaqa/dial.nvim",
	lazy = true,
	config = function()
		local augend = require("dial.augend")
		require("dial.config").augends:register_group({
			default = {
				augend.integer.alias.decimal,
				augend.constant.alias.bool,
				augend.constant.new({
					elements = { "==", "!=" },
					word = false,
					cyclic = true,
				}),
				augend.constant.new({
					elements = { "and", "or" },
					word = true,
					cyclic = true,
				}),
				augend.constant.new({
					elements = { ">", "<" },
					word = false,
					cyclic = true,
				}),
				augend.constant.new({
					elements = { ">=", "<=" },
					word = false,
					cyclic = true,
				}),
				augend.constant.new({
					elements = { "&&", "||" },
					word = false,
					cyclic = true,
				}),
			},
		})
	end,
	keys = {
		{ "<C-a>", "<Plug>(dial-increment)", mode = { "n", "v" } },
		{ "<C-x>", "<Plug>(dial-decrement)", mode = { "n", "v" } },
	},
}
