local WIN32 = (jit.os == "Windows")

local M = {}

local LOCAL_SYSTEM_FONT_SIZE = os.getenv("MONOSPACE_FONT_SIZE")
M.FONT_SIZE = LOCAL_SYSTEM_FONT_SIZE or WIN32 and 15 or 13
M.FONTS = M.LOCAL_SYSTEM_MONOSPACE_FONT .. ",Symbols Nerd Font Mono:h"
M.FONT_WEIGHT = os.getenv("MONOSPACE_FONT_WEIGHT") or "Medium"

return M
