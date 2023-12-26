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
								return buffer.pick_letter
							end

							if buffer.is_modified then
								return icons.buffer.Modified .. " "
							end

							if buffer.is_readonly then
								return icons.buffer.Readonly .. " "
							end

							return false
						end

						local icon = state() or diagnostic() or buffer.devicon.icon
						return " " .. icon .. " "
					end,
					fg = function(buffer)
						return buffer.is_focused and palette.bg_dim or palette.fg
					end,
					bg = function(buffer)
						return buffer.is_focused and (buffer.is_readonly and palette.red or palette.green)
							or palette.bg_yellow
					end,
					bold = is_picking_focus(),
				},
				{
					text = function()
						return is_picking_focus() and "░ " or " "
					end,
				},
				{
					text = function(buffer)
						return buffer.filename
					end,
					bold = function(buffer)
						return buffer.is_focused
					end,
				},
				{
					text = " ",
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
