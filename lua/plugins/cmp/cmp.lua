local kind_icons = {
	Array = "",
	Boolean = "",
	Key = "",
	Namespace = "",
	Null = "󰟢",
	Number = "",
	Object = "",
	Package = "",
	Reference = "",
	Snippet = "",
	String = "",
	Text = "",
	TypeParameter = "",
	Unit = "",
	Method = "󰆧",
	Function = "󰡱",
	Constructor = "",
	Field = "󰜢",
	Variable = "",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Color = "󰏘",
	File = "󰈙",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "󰙅",
	Event = "",
	Operator = "󰆕",
}
return {
	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
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
					fields = { "kind", "abbr" },
					format = function(entry, vim_item)
						vim_item.kind = string.format(" %s  ", kind_icons[vim_item.kind])
						return vim_item
					end,
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "path" },
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
