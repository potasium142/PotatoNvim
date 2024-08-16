local get_hl = require("gtils").get_hl
return {
	"willothy/nvim-cokeline",
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required for v0.4.0+
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	},
	lazy = false,
	opts = function()
		local is_picking_focus = require("cokeline.mappings").is_picking_focus

		local p = {
			bg = get_hl("p_bg", "sp"),
			fg = get_hl("p_fg", "sp"),
			green = get_hl("p_green", "sp"),
			dim3 = get_hl("p_dim3", "sp"),
			dim4 = get_hl("p_dim4", "sp"),
			dim5 = get_hl("p_dim5", "sp"),
		}

		local icons = require("const.icons")
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
			default_hl = {
				bg = function(buffer)
					return buffer.is_focused and p.dim4 or p.bg
				end,
			},
			components = {
				{
					text = " ",
					bg = p.bg,
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
						return buffer.is_focused and p.bg or p.fg
					end,
					bg = function(buffer)
						return buffer.is_focused and (buffer.is_readonly and p.red or p.green) or p.dim4
					end,
					bold = true,
				},
				{
					text = function()
						return is_picking_focus() and "░ " or " "
					end,
					bg = function(buffer)
						return buffer.is_focused and p.dim4 or p.dim5
					end,
				},
				{
					text = function(buffer)
						return buffer.filename
					end,
					bold = function(buffer)
						return buffer.is_focused
					end,
					bg = function(buffer)
						return buffer.is_focused and p.dim4 or p.dim5
					end,
				},
				{
					text = " ",
					bg = function(buffer)
						return buffer.is_focused and p.dim4 or p.dim5
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
