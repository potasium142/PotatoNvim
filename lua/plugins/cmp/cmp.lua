local icons = require("config.icons")
return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"FelipeLema/cmp-async-path",
			"nvim-tree/nvim-web-devicons",
			"windwp/nvim-autopairs",
			"L3MON4D3/LuaSnip",
			"neovim/nvim-lspconfig",
			"saadparwaiz1/cmp_luasnip",
			"chrisgrieser/cmp_yanky",
		},
		opts = function()
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local luasnip = require("luasnip")
			local cmp = require("cmp")
			local mapping = cmp.mapping
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
			return {
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				mapping = {
					["<C-k>"] = mapping(mapping.scroll_docs(-1), { "i", "c" }),
					["<C-j>"] = mapping(mapping.scroll_docs(1), { "i", "c" }),
					["<C-Space>"] = mapping(mapping.complete(), { "i", "c" }),
					["<CR>"] = mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
					["<Esc>"] = mapping({
						i = mapping.abort(),
						c = mapping.close(),
					}),
					["<Tab>"] = mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				},
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						vim_item.kind = string.format(" %s ", icons.kind_icons[vim_item.kind])
						vim_item.menu = ({
							luasnip = "LuaSnip",
							nvim_lsp = "LSP",
							path = "Path",
							async_path = "APath",
							cmp_yanky = "Yanky",
						})[entry.source.name]
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
					{ name = "cmp_yanky", priority = 2 },
				},
				window = {
					completion = {
						winhighlight = "Normal:Pmenu,FloatBorder:None,Search:None",
						col_offset = -4,
						side_padding = 0,
						border = { "", "", "┃", "┃", "┃", "", "", "" },
					},
					documentation = {
						border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
					},
				},
				view = {
					entries = { name = "custom", selection_order = "near_cursor" },
				},
			}
		end,
	},
}
