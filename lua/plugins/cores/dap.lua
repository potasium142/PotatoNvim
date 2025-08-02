local conf = require("loader.debugger")
local adapter_config = conf.adapter
local lang_config = conf.lang

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local adapter_lazy_load = augroup("adap_lazy_load", {})
local lang_dap_lazy_load = augroup("lang_dap_lazy_load", {})

return {
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		config = function()
			local dap = require("dap")

			for name, config in pairs(adapter_config) do
				autocmd({ "BufEnter" }, {
					pattern = config.pattern,
					callback = function()
						dap.adapters[name] = config.config
					end,
					group = adapter_lazy_load,
					once = true,
				})
			end

			for name, config in pairs(lang_config) do
				autocmd({ "BufEnter" }, {
					pattern = config.pattern,
					callback = function()
						dap.configurations[name] = config.config
					end,
					group = lang_dap_lazy_load,
					once = true,
				})
			end
		end,
	},
	{
		"igorlfs/nvim-dap-view",
		lazy = true,
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			local dap, dapui = require("dap"), require("dap-view")

			dapui.setup()

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
		keys = function()
			local dap = require("dap")
			return {
				{
					"<F8>",
					dap.toggle_breakpoint,
				},
				{
					"<F10>",
					dap.continue,
				},
				{
					"<F11>",
					dap.step_over,
				},
				{
					"<F12>",
					dap.step_into,
				},
			}
		end,
	},
}
