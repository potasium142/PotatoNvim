return {
	{
		"MunifTanjim/nui.nvim",
		config = function()
			local Input = require("nui.input")

			local event = require("nui.utils.autocmd").event

			local function get_prompt_text(prompt, default_prompt)
				local prompt_text = prompt or default_prompt
				if prompt_text:sub(-1) == ":" then
					prompt_text = "[" .. prompt_text:sub(1, -2) .. "]"
				end
				return prompt_text
			end

			local ui_input = Input:extend("UIInput")

			function ui_input:init(opts, on_done)
				local border_top_text = get_prompt_text(opts.prompt, "[Input]")
				local default_value = tostring(opts.default or "")

				ui_input.super.init(self, {
					relative = "cursor",
					position = {
						row = 1,
						col = 0,
					},
					size = {
						width = math.max(40, vim.api.nvim_strwidth(default_value)),
					},
					border = {
						style = "single",
						text = {
							top = border_top_text,
							top_align = "left",
						},
					},
					win_options = {
						winhighlight = "NormalFloat:Normal,FloatBorder:Normal",
					},
				}, {
					default_value = default_value,
					on_close = function()
						on_done(nil)
					end,
					on_submit = function(value)
						on_done(value)
					end,
				})

				-- cancel operation if cursor leaves input
				self:on(event.BufLeave, function()
					on_done(nil)
				end, { once = true })

				-- cancel operation if <Esc> is pressed
				self:map("n", "<Esc>", function()
					on_done(nil)
				end, { noremap = true, nowait = true })
			end

			local input_ui

			vim.ui.input = function(opts, on_confirm)
				assert(type(on_confirm) == "function", "missing on_confirm function")

				if input_ui then
					-- ensure single ui.input operation
					vim.api.nvim_err_writeln("busy: another input is pending!")
					return
				end

				input_ui = ui_input(opts, function(value)
					if input_ui then
						-- if it's still mounted, unmount it
						input_ui:unmount()
					end
					-- pass the input value
					on_confirm(value)
					-- indicate the operation is done
					input_ui = nil
				end)

				input_ui:mount()
			end

			local Menu = require("nui.menu")

			local ui_select = Menu:extend("UISelect")

			function ui_select:init(items, opts, on_done)
				local border_top_text = get_prompt_text(opts.prompt, "[Select Item]")
				local kind = opts.kind or "unknown"
				local format_item = opts.format_item
					or function(item)
						return tostring(item.__raw_item or item)
					end

				local popup_options = {
					relative = "editor",
					position = {
						row = "10%",
						col = "50%",
					},
					border = {
						style = "single",
						text = {
							top = border_top_text,
							top_align = "left",
						},
					},
					win_options = {
						winhighlight = "NormalFloat:Normal,FloatBorder:Normal",
					},
					zindex = 999,
				}

				if kind == "codeaction" then
					-- change position for codeaction selection
					popup_options.relative = "cursor"
					popup_options.position = {
						row = 1,
						col = 0,
					}
				end

				local max_width = popup_options.relative == "editor" and vim.o.columns - 4
					or vim.api.nvim_win_get_width(0) - 4
				local max_height = popup_options.relative == "editor" and math.floor(vim.o.lines * 80 / 100)
					or vim.api.nvim_win_get_height(0)

				local menu_items = {}
				for index, item in ipairs(items) do
					if type(item) ~= "table" then
						item = { __raw_item = item }
					end
					item.index = index
					local item_text = string.sub(format_item(item), 0, max_width)
					menu_items[index] = Menu.item(item_text, item)
				end

				local menu_options = {
					min_width = vim.api.nvim_strwidth(border_top_text),
					max_width = max_width,
					max_height = max_height,
					lines = menu_items,
					on_close = function()
						on_done(nil, nil)
					end,
					on_submit = function(item)
						on_done(item.__raw_item or item, item.index)
					end,
				}

				ui_select.super.init(self, popup_options, menu_options)

				-- cancel operation if cursor leaves select
				self:on(event.BufLeave, function()
					on_done(nil, nil)
				end, { once = true })
			end

			local select_ui = nil

			vim.ui.select = function(items, opts, on_choice)
				assert(type(on_choice) == "function", "missing on_choice function")

				if select_ui then
					-- ensure single ui.select operation
					vim.api.nvim_err_writeln("busy: another select is pending!")
					return
				end

				select_ui = ui_select(items, opts, function(item, index)
					if select_ui then
						-- if it's still mounted, unmount it
						select_ui:unmount()
					end
					-- pass the select value
					on_choice(item, index)
					-- indicate the operation is done
					select_ui = nil
				end)

				select_ui:mount()
			end
		end,
	},
	{
		"folke/noice.nvim",
		enabled = true,
		lazy = false,
		priority = 1000,
		init = function()
			local signs = require("const.icons_text").diag
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		opts = {
			cmdline = {
				format = {
					cmdline = { icon = ">" },
					search_down = { icon = "\\/" },
					search_up = { icon = "/\\" },
					filter = { icon = "$" },
					lua = { icon = "L" },
					help = { icon = "?" },
				},
			},
			format = {
				level = {
					icons = {
						error = "X",
						warn = "W",
						info = "i",
					},
				},
			},
			popupmenu = {
				kind_icons = false,
			},
			inc_rename = {
				cmdline = {
					format = {
						IncRename = { icon = "R" },
					},
				},
			},
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = false,
			},
			views = {
				cmdline_popup = {
					border = {
						style = "single",
					},
				},
			},
			routes = {
				{
					view = "notify",
					filter = { event = "msg_showmode" },
				},
				{
					filter = {
						event = "msg_show",
						kind = "",
						find = "written",
					},
					opts = { skip = true },
				},
			},
			config = true,
		},
		keys = {
			{
				"tss",
				"<cmd>Telescope noice<cr>",
			},
		},
	},
}
