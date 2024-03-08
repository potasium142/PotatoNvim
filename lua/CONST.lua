local WIN32 = (jit.os == "Windows")

local M = {}

M.FONT_SIZE = WIN32 and 15 or 13
M.LOCAL_SYSTEM_MONOSPACE_FONT = os.getenv("MONOSPACE_FONT") or "Consolas"
M.FONTS = M.LOCAL_SYSTEM_MONOSPACE_FONT .. ",Symbols Nerd Font Mono:h"

return M
