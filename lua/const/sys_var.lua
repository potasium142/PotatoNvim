local LOCAL_MONO_FONT = os.getenv("MONOSPACE_FONT") or "Consolas"
local LOCAL_FNT_SIZE = os.getenv("MONOSPACE_FONT_SIZE") or 13
local WIN32 = vim.fn.has("win32")

--- @enum SYSTEM_VAR
local M = {
	FONTS = LOCAL_MONO_FONT .. ":h" .. LOCAL_FNT_SIZE,
	FONT_WEIGHT = os.getenv("MONOSPACE_FONT_WEIGHT") or "Medium",
	IS_WIN32 = WIN32,
	IS_TTY = (os.getenv("DISPLAY") == nil) and (WIN32 == 0),
}

print(M.IS_WIN32)

return M
