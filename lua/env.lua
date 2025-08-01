local win32 = vim.fn.has("win32")
return {
	IS_WIN32 = win32,
	IS_TTY = (os.getenv("DISPLAY") == nil) and (win32 == 0),
}
