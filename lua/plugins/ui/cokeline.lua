return {
	"willothy/nvim-cokeline",
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required for v0.4.0+
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
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
			default_hl = "GlobalBase0",
			components = {
				{
					text = " ",
					highlight = "bg",
				},
				{
					text = function(buffer)
						local diagnostic = function()
							local diag = buffer.diagnostics
							if diag.errors ~= 0 then
								return icons.diagnostics.Error
							end

							if diag.warnings ~= 0 then
								return icons.diagnostics.Warn
							end

							return false
						end

						local state = function()
							if is_picking_focus() then
								return buffer.is_focused and "" or buffer.pick_letter
							end

							if buffer.is_modified then
								return icons.buffer.Modified
							end

							if buffer.is_readonly then
								return icons.buffer.Readonly
							end

							return false
						end

						local focus = function()
							return buffer.is_focused and "" or " "
						end

						local icon = state() or diagnostic() or focus()
						return icon
					end,
					highlight = function(buffer)
						return buffer.is_focused and "GlobalBase10I" or "GlobalBase14I"
					end,
					bold = true,
				},
				{
					text = function(buffer)
						return " " .. buffer.filename .. " "
					end,
					highlight = function(buffer)
						return buffer.is_focused and "GlobalBase10I" or "GlobalBase14"
					end,
					bold = function(buffer)
						return buffer.is_focused
					end,
				},
			},
		}
	end,
	keys = {
		{
			"<Space>j",
			"<Plug>(cokeline-pick-focus)",
		},
	},
}
