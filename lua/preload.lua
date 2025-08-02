local is_tty = require("env").IS_TTY

if is_tty then
	vim.cmd.colorscheme("default")
else
	vim.cmd.colorscheme("retrobox")
end

require("scripts.tabout")

require("loader.env")

require("autocmd")
