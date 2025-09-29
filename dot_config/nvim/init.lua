--require bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

if #vim.fn.argv() == 0 then
  require("persistence").load({ last = true })
end
