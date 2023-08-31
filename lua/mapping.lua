Map = vim.keymap.set
DelMap = vim.keymap.del

--Tabbing
Map("n", ">", ":><cr>", Opts)
Map("n", "<", ":<<cr>", Opts)

--Visual tabbing
Map("v", ">", ":><cr>gv", Opts)
Map("v", "<", ":<<cr>gv", Opts)

--Disable arrow
Map("n", "<Up>", "<nop>", Opts)
Map("n", "<Down>", "<nop>", Opts)
Map("n", "<Right>", "<nop>", Opts)
Map("n", "<Left>", "<nop>", Opts)

--Globle buffer paste
Map("n", "gp", '"+p<CR>', Opts)
Map("n", "gjp", "<cmd>pu+<CR>", Opts)
Map("n", "gkp", "<cmd>pu!+<CR>", Opts)
Map({ "v", "n" }, "gy", '"+y<CR>', Opts)

--Buffer
Map("n", "]b", "<cmd>bn<cr>", Opts)
Map("n", "[b", "<cmd>bp<cr>", Opts)
Map("n", "<Space>dd", "<cmd>bd!<cr>", Opts)

Map("n", "<CR>", ":noh<cr><cr>", Opts)

--Save
Map("n", "<Space>w", "<cmd>:w<cr>", Opts)

--Delete
Map({ "n", "v" }, "x", '"_x', Opts)

--Half buffer jump
Map({ "n", "v" }, "<C-j>", "<C-d>zz")
Map({ "n", "v" }, "<C-k>", "<C-u>zz")

Map({ 'n', 'v' }, 'q', 'b')
Map({ "n", "v" }, 'Q', 'B')

Map({ "i", "n" }, "<F1>", "<nop>", Opts)
