vim.keymap.set(
	"n",
	"x",
	'"_x',
	{ desc = "Delete character without storing it in register" }
)

vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode" })

vim.keymap.set(
	"i",
	"xx",
	"<Esc>A,<Esc>i",
	{ desc = "Insert comma at the end of a row" }
)

vim.keymap.set(
	"n",
	"<M-o>",
	":SwitchIMSFileType<CR>",
	{ silent = true, desc = "Switch IMS page files" }
)
