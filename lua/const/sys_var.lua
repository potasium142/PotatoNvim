local M = {}

local LOCAL_MONO_FONT = os.getenv("MONOSPACE_FONT") or "Consolas"
local LOCAL_FNT_SIZE = os.getenv("MONOSPACE_FONT_SIZE") or 13

M.FONTS = LOCAL_MONO_FONT .. ":h" .. LOCAL_FNT_SIZE
M.FONT_WEIGHT = os.getenv("MONOSPACE_FONT_WEIGHT") or "Medium"
M.IS_WIN32 = vim.fn.has("win32") == 1
M.IS_TTY = os.getenv("DISPLAY") == nil and not M.IS_WIN32

return M
