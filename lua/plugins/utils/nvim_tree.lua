return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	init = function()
		G.loaded_netrw = 1
		G.loaded_netrwPlugin = 1
	end,
	opts = function()
		local icons = require("config.icons")
		return {
			reload_on_bufenter = true,
			select_prompts = true,
			respect_buf_cwd = true,
			hijack_cursor = true,
			disable_netrw = true,
			hijack_netrw = true,
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						default = icons.ui.Text,
						symlink = icons.ui.FileSymlink,
						bookmark = icons.ui.BookMark,
						folder = {
							arrow_closed = icons.ui.TriangleShortArrowRight,
							arrow_open = icons.ui.TriangleShortArrowDown,
							default = icons.ui.Folder,
							open = icons.ui.FolderOpen,
							empty = icons.ui.EmptyFolder,
							empty_open = icons.ui.EmptyFolderOpen,
							symlink = icons.ui.FolderSymlink,
							symlink_open = icons.ui.FolderOpen,
						},
						git = {
							unstaged = icons.git.FileUnstaged,
							staged = icons.git.FileStaged,
							unmerged = icons.git.FileUnmerged,
							renamed = icons.git.FileRenamed,
							untracked = icons.git.FileUntracked,
							deleted = icons.git.FileDeleted,
							ignored = icons.git.FileIgnored,
						},
					},
				},
			},
			diagnostics = {},
		}
	end,
	config = function(_, opts)
		require("nvim-tree").setup(opts)
	end,
	keys = {
		{
			"<F2>",
			"<cmd>NvimTreeToggle<cr>",
		},
	},
}
