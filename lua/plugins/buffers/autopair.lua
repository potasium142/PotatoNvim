return {
	{
		"windwp/nvim-autopairs",
		lazy = false,
		enabled = false,
		event = "InsertEnter",
		opts = {
			fast_wrap = {
				map = "<M-e>",
				chars = { "{", "[", "(", '"', "'", "<", "|" },
				pattern = [=[[%'%"%)%>%]%)%}%,]]=],
				end_key = "$",
				before_key = "h",
				after_key = "l",
				cursor_pos_before = true,
				keys = "qwertyuiopzxcvbnmasdfghjkl",
				manual_position = true,
				highlight = "Search",
				highlight_grey = "Comment",
				use_virt_lines = true,
			},
			enable_check_bracket_line = true,
		},
	},
}
