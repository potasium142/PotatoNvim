local icons = require("const.icons_text")
return {
	{

		"hrsh7th/nvim-cmp",
		event = { "LspAttach" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"FelipeLema/cmp-async-path",
			-- "nvim-tree/nvim-web-devicons",
			"windwp/nvim-autopairs",
			"neovim/nvim-lspconfig",
		},
		name = "cmp",
		opts = function()
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			local mapping = cmp.mapping
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
			return {
				snippet = {
					expand = function(arg)
						vim.snippet.expand(arg.body)
					end,
				},
				mapping = {
					["<C-k>"] = mapping(mapping.scroll_docs(-1), { "i", "c" }),
					["<C-j>"] = mapping(mapping.scroll_docs(1), { "i", "c" }),
					["<C-Space>"] = mapping(mapping.complete(), { "i", "c" }),
					["<CR>"] = mapping.confirm({
						behavior = cmp.ConfirmBehavior.Insert,
						select = true,
					}),
					["<Esc>"] = mapping({
						i = mapping.abort(),
						c = mapping.close(),
					}),
					["<Tab>"] = mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif vim.snippet.active({ direction = 1 }) then
							vim.snippet.jump(1)
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif vim.snippet.active({ direction = -1 }) then
							vim.snippet.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				},
				formatting = {
					fields = { "kind", "abbr" },
					format = function(_, vim_item)
						vim_item.kind = string.format("[%s]", icons.kinds[vim_item.kind])
						return vim_item
					end,
				},
				sources = {
					{ name = "nvim_lsp", priority = 5 },
					{ name = "async_path", priority = 4 },
					{
						name = "luasnip",
						option = {
							use_show_condition = false,
							show_autosnippets = true,
						},
						priority = 3,
					},
				},
				window = {
					completion = {
						-- winhighlight = "Normal:Pmenu,FloatBorder:None,Search:None",
						-- col_offset = -7,
						-- side_padding = 0,
						border = { "", "", "┃", "┃", "┃", "", "", "" },
					},

					documentation = {
						border = { "", "", "", " ", "", "", "", " " },
					},
				},
				view = {
					entries = { name = "custom", selection_order = "near_cursor" },
				},
				experimental = {
					ghost_text = true,
				},
			}
		end,
		config = true,
	},
}
