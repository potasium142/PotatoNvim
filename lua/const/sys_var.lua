local M = {}

local LOCAL_MONO_FONT = os.getenv("MONOSPACE_FONT") or "Consolas"
local LOCAL_FNT_SIZE = os.getenv("MONOSPACE_FONT_SIZE") or 13

M.FONTS = LOCAL_MONO_FONT .. ",Symbols Nerd Font Mono" .. ":h" .. LOCAL_FNT_SIZE
M.FONT_WEIGHT = os.getenv("MONOSPACE_FONT_WEIGHT") or "Medium"

return M
