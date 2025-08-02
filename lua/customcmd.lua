local cmd = vim.api.nvim_create_user_command

cmd("Update", function()
	require("lazy").update()
	require("lazy").clean()
	vim.cmd("TSUpdate all")
end, {})

cmd("Config", function()
	vim.cmd.edit("$MYVIMRC")
	vim.cmd.cd("%:p:h")
end, {})
