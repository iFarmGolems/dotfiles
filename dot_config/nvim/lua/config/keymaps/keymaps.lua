vim.keymap.set(
	"n",
	"<leader>xx",
	"A,<Esc>",
	{ desc = "Add comma to the end of the line" }
)

-- delete character without copying to clipboard
vim.keymap.set("n", "x", '"_x', { desc = "Delete character" })

vim.keymap.set(
	"n",
	"<M-o>",
	":SwitchIMSFileType<CR>",
	{ silent = true, desc = "Switch IMS page files" }
)
