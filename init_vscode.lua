local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "plugins.buffers.moveline" },
        { import = "plugins.buffers.dials" },
        { import = "plugins.buffers.surround" },
    }
})

vim.opt.runtimepath:prepend(lazypath)

G = vim.g
Set = vim.o
HL = vim.api.nvim_set_hl

require("config.mapping")

Map = vim.keymap.set
Opts = { noremap = true, silent = true }

local code = require("vscode-neovim")

Map("n", "gcc", function()
    code.call("editor.action.commentLine")
end)

Map("v", "gc", function()
    code.call("editor.action.commentBlock")
end)

Map("n", "<space>w", function()
    code.call("workbench.action.files.save")
end)

Map("n", "<space>ca", function()
    code.call("editor.action.quickFix")
end)

Map("n", "<space>rn", function()
    code.call("editor.action.rename")
end)

Map("n", "<space>tt", function()
    code.call("workbench.actions.view.problems")
end)

Map("n", "tsf", function()
    code.call("workbench.action.quickOpen")
end)
