return {
	{
		"windwp/nvim-autopairs",
		lazy = false,
		opts = {
			fast_wrap = {
				map = "<M-e>",
				chars = { "{", "[", "(", '"', "'" },
				pattern = [=[[%'%"%)%>%]%)%}%,]]=],
				end_key = "$",
				keys = "qwertyuiopzxcvbnmasdfghjkl",
				check_comma = true,
				highlight = "Search",
				highlight_grey = "Comment",
			},
			enable_check_bracket_line = true,
			check_ts = true,
		}
	},
	{
		"kylechui/nvim-surround",
		config = true
	}
}
