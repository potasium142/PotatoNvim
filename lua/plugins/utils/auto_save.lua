return {
	"pocco81/auto-save.nvim",
	lazy = false,
	opts = function()
		return {
			trigger_events = { "InsertLeave", "TextChanged" }, -- vim events that trigger auto-save. See :h events
			condition = function(buf)
				local fn = vim.fn
				local undotree = vim.fn.undotree()
				if undotree.seq_last ~= undotree.seq_cur then
					return false -- don't try to save again if I tried to undo. k thanks
				end
			end,
		}
	end,
}
