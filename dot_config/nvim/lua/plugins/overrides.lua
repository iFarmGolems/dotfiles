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
            layout = {
              layout = {
                width = 45,
              },
            },
            hidden = true,
          },
        },
      },
    },
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    build = "make tiktoken",
    opts = function(_, opts)
      opts.model = "gpt-5-mini"
      opts.system_prompt = require("CopilotChat.config.prompts").COPILOT_INSTRUCTIONS.system_prompt
        .. "\n"
        .. "When outputting code, add newline after each block."
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        keymap = {
          accept = "<M-l>",
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
