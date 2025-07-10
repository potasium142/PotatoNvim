local gtils = require("gtils")
local path = vim.fn.stdpath("config") .. "/lua/userspace/lsp"

local default_setup = require("userspace.lsp_capabilities")
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local lsp_lazy_load = augroup("lsp_lazy_load", {})

gtils.run_by_file(path, function(file)
	local f = file:gsub("%.lua$", "")

	--- @type LspConfig
	local lsp_config = require("userspace.lsp." .. f)

	local setup = vim.tbl_deep_extend("force", default_setup.capabilities, lsp_config.config or {})

	autocmd({ "BufEnter" }, {
		pattern = lsp_config.ft_pattern,
		callback = function()
			vim.lsp.config(lsp_config.name, setup)
			vim.lsp.enable(lsp_config.name)
		end,
		group = lsp_lazy_load,
		once = true,
	})
end)
