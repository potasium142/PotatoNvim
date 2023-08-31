return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	config = function()
		require("dapui").setup()
		local dap, dapui = require("dap"), require("dapui")

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		local HL = vim.api.nvim_set_hl
		local sign_define = vim.fn.sign_define

		local namespace = 0
		HL(namespace, "DapBreakpoint", { link = "red" })
		HL(namespace, "DapLogPoint", { link = "green" })
		HL(namespace, "DapStopped", { link = "yellow" })

		sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", numhl = "DapBreakpoint" })
		sign_define("DapBreakpointCondition", { text = "ﳁ", texthl = "DapBreakpoint", numhl = "DapBreakpoint" })
		sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpoint", numhl = "DapBreakpoint" })
		sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint", numhl = "DapLogPoint" })
		sign_define("DapStopped", { text = "", texthl = "DapStopped", numhl = "DapStopped" })
	end
}
