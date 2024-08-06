local M = {}

M.name = "clang_format"

M.config = {
	prepend_args = {
		"--style",
		"{IndentWidth: 4}",
	},
}

return M
