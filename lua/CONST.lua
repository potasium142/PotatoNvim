local WIN32 = vim.fn.has("win32") == 1

local M = {}

local LOCAL_SYSTEM_MONOSPACE_FONT = os.getenv("MONOSPACE_FONT") or "Consolas"
local LOCAL_SYSTEM_FONT_SIZE = os.getenv("MONOSPACE_FONT_SIZE") or WIN32 and 15 or 13

M.FONTS = LOCAL_SYSTEM_MONOSPACE_FONT .. ",Symbols Nerd Font Mono" .. ":h" .. LOCAL_SYSTEM_FONT_SIZE .. ":#h-none"
M.FONT_WEIGHT = os.getenv("MONOSPACE_FONT_WEIGHT") or "Medium"
M.WIN32 = WIN32
-- M.PALETTE = require("everforest.colours").generate_palette(require("everforest").config, vim.o.background)

return M
