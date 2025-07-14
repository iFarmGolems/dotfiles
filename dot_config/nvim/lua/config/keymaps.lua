-- deleting with "x" will not save the deleted text to the register
vim.keymap.set("n", "x", '"_x')

-- grug-far overrides
vim.keymap.del({ "n", "v" }, "<leader>sr")

-- normal mode
vim.keymap.set("n", "<leader>sri", function()
  require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>"), paths = vim.fn.expand("%") } })
end, {
  desc = "Replace current word in current file",
})

vim.keymap.set("n", "<leader>sra", function()
  require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })
end, {
  desc = "Replace current word in all files",
})

-- visual mode
vim.keymap.set("v", "<leader>sri", function()
  require("grug-far").with_visual_selection({ prefills = { paths = vim.fn.expand("%") } })
end, {
  desc = "Replace visual selection in current file",
})

vim.keymap.set("v", "<leader>sra", function()
  require("grug-far").with_visual_selection()
end, {
  desc = "Replace visual selection in all files",
})

vim.keymap.set("n", "<leader>fc", function()
  local results = require("chezmoi.commands").list({
    args = {
      "--path-style",
      "absolute",
      "--include",
      "files",
      "--exclude",
      "externals",
    },
  })
  local items = {}

  for _, czFile in ipairs(results) do
    table.insert(items, {
      text = czFile,
      file = czFile,
    })
  end

  ---@type snacks.picker.Config
  local opts = {
    items = items,
    confirm = function(picker, item)
      picker:close()
      require("chezmoi.commands").edit({
        targets = { item.text },
        args = { "--watch" },
      })
    end,
  }
  Snacks.picker.pick(opts)
end, {
  desc = "Chezmoi",
})
