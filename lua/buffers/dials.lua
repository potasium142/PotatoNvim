return {
	"monaqa/dial.nvim",
	lazy = false,
	config = function()
		local augend = require("dial.augend")
		require("dial.config").augends:register_group({
			default = {
				augend.integer.alias.decimal,
				augend.integer.alias.hex,
				augend.date.alias["%m/%d/%Y"],
				augend.constant.alias.bool,
				augend.constant.new({
					elements = { "==", "!=" },
					word = false, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
					cyclic = true, -- "or" is incremented into "and".
				}),
				augend.constant.new({
					elements = { "and", "or" },
					word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
					cyclic = true, -- "or" is incremented into "and".
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
	}
}
