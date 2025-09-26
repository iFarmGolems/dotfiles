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
vim.api.nvim_create_user_command("CopyPath", function()
  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  local file_path = vim.fn.expand("%:p")
  local path_to_copy = file_path

  if vim.v.shell_error == 0 then
    path_to_copy = file_path:sub(#git_root + 2)
  end

  vim.fn.setreg("+", path_to_copy)
  print("Copied: " .. path_to_copy)
end, {})

vim.api.nvim_create_user_command("EditProjects", function()
  vim.cmd("edit " .. vim.fn.expand("~/.local/share/nvim/project_nvim/project_history"))
end, {})

vim.api.nvim_create_user_command("WslView", function()
  local file_folder = vim.fn.expand("%:p:h")
  vim.fn.system("wslview " .. file_folder)
end, {})
