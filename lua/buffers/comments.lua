return {
	"numToStr/Comment.nvim",
	opts = {
		pre_hook =
			function()
				if not vim.g.vscode then
					require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
				end
			end
	}
}
