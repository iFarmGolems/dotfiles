vim.cmd("cd ~")

if vim.g.neovide then
  vim.g.snacks_animate = false
  vim.g.neovide_fullscreen = true
  vim.api.nvim_set_keymap("n", "<F11>", ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
end

vim.g.ai_cmp = false
vim.g.copilot_nes = true

vim.o.tabstop = 2
vim.opt.autoindent = true

-- vim.opt.termguicolors = true
vim.opt.list = false
vim.opt.colorcolumn = "81"
vim.opt.scrolloff = 10
vim.o.linespace = 4
vim.wo.signcolumn = "auto:1"

-- User Commands ---------------------------------------------------------------
require("config.commands")
