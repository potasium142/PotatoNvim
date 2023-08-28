return {
	'chentoast/marks.nvim',
	lazy = false,
	opts = {
		default_mappings = true,
		cyclic = true,
		force_write_shada = false,
		refresh_interval = 250,
		sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
	}
}
