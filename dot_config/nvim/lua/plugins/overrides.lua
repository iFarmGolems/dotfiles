return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
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

  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        keymap = {
          accept = "<Tab>",
        },
      },
    },
  },

  {
    "MagicDuck/grug-far.nvim",
    keys = {
      {
        "<leader>sr",
        mode = { "n", "v" },
        false,
      },
    },
  },

  {
    "folke/flash.nvim",
    keys = {
      {
        "<c-space>",
        mode = { "n", "o", "x" },
        false,
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.sections.lualine_y = {}
      opts.sections.lualine_z = {
        function()
          return "D: " .. (vim.g.DEPLOY_ON_SAVE and vim.g.DEPLOY_LAST_HOST or "OFF")
        end,
      }
    end,
  },

  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.sources.default = vim.tbl_filter(function(source)
        return source ~= "buffer"
      end, opts.sources.default)

      opts.completion.menu.draw.columns = {
        { "kind_icon" },
        { "label" },
        { "kind" },
      }
    end,
  },

  {
    "ahmedkhalf/project.nvim",
    opts = function(_, opts)
      opts.manual_mode = false
      opts.silent_chdir = false
      opts.detection_methods = { "pattern" }
      opts.patterns = { "package.json", "tsconfig.json", "jsconfig.json", ".git" }
    end,
  },

  {
    "folke/snacks.nvim",
    opts = {
      zen = {
        toggles = {
          dim = false,
        },
      },
      indent = {
        enabled = false,
      },
      picker = {
        sources = {
          explorer = {
            hidden = true,
            layout = {
              layout = {
                width = 47,
              },
            },
          },
        },
      },
    },
  },

  {
    "folke/persistence.nvim",
    opts = {
      need = 0,
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      kind_filter = {
        default = {
          "Class",
          "Constructor",
          "Enum",
          "Field",
          "Function",
          "Interface",
          "Method",
          "Module",
          "Namespace",
          "Package",
          "Property",
          "Struct",
          "Trait",
          -- add these to symbol search
          "Constant",
          "Variable",
        },
      },
    },
  },
}
