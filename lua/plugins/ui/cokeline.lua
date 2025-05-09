return {
	"willothy/nvim-cokeline",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	lazy = false,
	opts = function()
		local is_picking_focus = require("cokeline.mappings").is_picking_focus

		local icons = require("const.icons_text")
		return {
			sidebar = {
				filetype = { "NvimTree", "neo-tree" },
				components = {
					{
						text = function()
							return ""
						end,
						bold = true,
					},
				},
			},
			rendering = {
				max_buffer_width = 40,
			},
			components = {
				{
					text = " ",
					highlight = "Normal",
				},
				{
					text = function(buffer)
						if is_picking_focus() then
							return buffer.is_focused and ">" or buffer.pick_letter
						end

						if buffer.is_modified then
							return icons.buffer.Modified
						end

						if buffer.is_readonly then
							return icons.buffer.Readonly
						end

						return " "
					end,
					highlight = function(buffer)
						return buffer.is_focused and "Normal" or is_picking_focus() and "ColorColumn" or "ColorColumn"
					end,
				},
				{
					text = function(buffer)
						return " " .. buffer.filename .. " "
					end,
					highlight = function(buffer)
						return buffer.is_focused and "Normal" or is_picking_focus() and "ColorColumn" or "bg"
					end,
				},
			},
		}
	end,
	keys = {
		{
			"<leader>j",
			"<Plug>(cokeline-pick-focus)",
		},
	},
}
