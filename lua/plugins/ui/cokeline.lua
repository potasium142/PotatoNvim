return {
	"willothy/nvim-cokeline",
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required for v0.4.0+
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	},
	lazy = false,
	opts = function()
		local is_picking_focus = require("cokeline.mappings").is_picking_focus
		local palette = require("everforest.colours").generate_palette(require("everforest").config, vim.o.background)
		local icons = require("config.icons")
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
				max_buffer_width = 24,
			},
			default_hl = {
				bg = function(buffer)
					return buffer.is_focused and palette.bg_green or palette.bg_dim
				end,
			},
			components = {
				{
					text = " ",
					bg = palette.bg1,
				},
				{
					text = function(buffer)
						return " " .. (is_picking_focus() and buffer.pick_letter or buffer.devicon.icon) .. " "
					end,
					fg = function(buffer)
						return buffer.is_focused and palette.bg0 or palette.fg
					end,
					bg = function(buffer)
						return buffer.is_focused and (buffer.is_readonly and palette.red or palette.green)
							or palette.bg_yellow
					end,
					bold = is_picking_focus(),
				},
				{
					text = function(buffer)
						return is_picking_focus() and "░ " or " "
					end,
				},
				{
					text = function(buffer)
						return buffer.filename .. "  "
					end,
					bold = function(buffer)
						return buffer.is_focused
					end,
				},
				{
					text = function(buffer)
						local warning = buffer.diagnostics.warnings == 0 and " " or icons.diagnostics.Warn
						local error = buffer.diagnostics.errors ~= 0 and icons.diagnostics.Error
						return buffer.is_modified and icons.buffer.Modified .. " " or (error and error or warning)
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
