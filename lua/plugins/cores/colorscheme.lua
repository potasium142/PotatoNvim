return {
	"neanias/everforest-nvim",
	lazy = false,
	priority = 1000,
	opts = {
		sign_column_background = "grey",
		italics = false,
		disable_italic_comment = true,
		diagnostic_text_highlight = true,
		diagnostic_virtual_text = "coloured",
		diagnostic_line_highlight = true,
		on_highlights = function(hl, p)
			hl.CmpItemAbbrDeprecated = { fg = p.grey1, bg = p.none, strikethrough = true }

			hl.CmpItemAbbrMatch = { fg = p.green, bg = p.none, bold = true }
			hl.CmpItemAbbrMatchFuzzy = { fg = p.aqua, bg = p.none, bold = true }
			hl.CmpItemMenu = { fg = p.purple, bg = p.none, italic = true }

			hl.CmpItemKindClass = { fg = p.yellow, bg = p.bg_yellow }
			hl.CmpItemKindColor = { fg = p.aqua, bg = p.bg_blue }
			hl.CmpItemKindConstant = { fg = p.blue, bg = p.bg_blue }
			hl.CmpItemKindConstructor = { fg = p.green, bg = p.bg_green }
			hl.CmpItemKindEnum = { link = "CmpItemKindClass" }
			hl.CmpItemKindEnumMember = { fg = p.purple, bg = p.bg_visual }
			hl.CmpItemKindEvent = { fg = p.orange, bg = p.bg_visual }
			hl.CmpItemKindField = { link = "CmpItemKindConstructor" }
			hl.CmpItemKindFile = { link = "CmpItemKindColor" }
			hl.CmpItemKindFolder = { link = "CmpItemKindColor" }
			hl.CmpItemKindFunction = { link = "CmpItemKindConstructor" }
			hl.CmpItemKindInterface = { link = "CmpItemKindClass" }
			hl.CmpItemKindKeyword = { fg = p.red, bg = p.bg_red }
			hl.CmpItemKindMethod = { link = "CmpItemKindConstructor" }
			hl.CmpItemKindModule = { link = "CmpItemKindClass" }
			hl.CmpItemKindOperator = { link = "CmpItemKindEvent" }
			hl.CmpItemKindProperty = { link = "CmpItemKindConstant" }
			hl.CmpItemKindReference = { link = "CmpItemKindColor" }
			hl.CmpItemKindSnippet = { link = "CmpItemKindColor" }
			hl.CmpItemKindStruct = { link = "CmpItemKindClass" }
			hl.CmpItemKindText = { fg = p.fg, bg = p.gray1 }
			hl.CmpItemKindTypeParameter = { link = "CmpItemKindClass" }
			hl.CmpItemKindUnit = { link = "CmpItemKindEnumMember" }
			hl.CmpItemKindValue = { link = "CmpItemKindEnumMember" }
			hl.CmpItemKindVariable = { link = "CmpItemKindConstant" }
		end,
	},
	config = function(_, opts)
		require("everforest").setup(opts)
		require("everforest").load()
	end,
}
