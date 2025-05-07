--- @type FormatterConfig
return {
	name = "clang_format",
	config = {
		prepend_args = {
			"--style",
			"{IndentWidth: 4}",
		},
	},
}
