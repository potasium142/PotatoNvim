local icons = require("config.icons")
return {
	{
		"L3MON4D3/LuaSnip",
		event = { "LspAttach" },
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	{
		"hrsh7th/nvim-cmp",
		event = { "LspAttach" },
		commit = "b356f2c80cb6c5bae2a65d7f9c82dd5c3fdd6038",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"FelipeLema/cmp-async-path",
			"nvim-tree/nvim-web-devicons",
			"windwp/nvim-autopairs",
			"L3MON4D3/LuaSnip",
			"neovim/nvim-lspconfig",
		},
		opts = function()
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local luasnip = require("luasnip")
			local cmp = require("cmp")
			local mapping = cmp.mapping
			require("luasnip.loaders.from_vscode").lazy_load()
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
						elseif luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				},
				formatting = {
					fields = { "kind", "abbr" },
					format = function(entry, vim_item)
						vim_item.kind = string.format(" %s ", icons.kind_icons[vim_item.kind])
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
				experimental = {
					ghost_text = true,
				},
			}
		end,
		config = function(_, opts)
			require("cmp").setup(opts)
			AutoCMD("InsertLeave", {
				callback = function()
					if
						require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
						and not require("luasnip").session.jump_active
					then
						require("luasnip").unlink_current()
					end
				end,
			})
		end,
	},
}
