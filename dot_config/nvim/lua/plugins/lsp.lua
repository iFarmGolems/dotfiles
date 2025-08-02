return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          settings = {
            javascript = {
              suggest = {
                names = false,
                autoImports = false,
              },
            },
          },
        },
      },
    },
  },
}
