return {
	url = "https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
	config = function()
		local set_hl = vim.api.nvim_set_hl
		set_hl(0, "RainbowDelimiterRed", { link = "GlobalBase9" })
		set_hl(0, "RainbowDelimiterGreen", { link = "GlobalBase10" })
		set_hl(0, "RainbowDelimiterYellow", { link = "GlobalBase11" })
		set_hl(0, "RainbowDelimiterBlue", { link = "GlobalBase12" })
		set_hl(0, "RainbowDelimiterViolet", { link = "GlobalBase13" })
		set_hl(0, "RainbowDelimiterCyan", { link = "GlobalBase14" })
		set_hl(0, "RainbowDelimiterOrange", { link = "GlobalBase15" })
	end,
}
