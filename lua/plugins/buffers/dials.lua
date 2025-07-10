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
					elements = { "True", "False" },
					word = true,
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
	keys = function()
		local dial = require("dial.map").manipulate
		return {
			{
				"<C-a>",
				function()
					dial("increment", "normal")
				end,
			},
			{
				"<C-x>",
				function()
					dial("decrement", "normal")
				end,
			},
		}
	end,
}
