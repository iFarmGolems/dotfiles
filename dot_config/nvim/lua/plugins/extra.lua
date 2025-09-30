return {

  { "lukas-reineke/virt-column.nvim", opts = {} },

  {
    "MeanderingProgrammer/treesitter-modules.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ---@module 'treesitter-modules'
    ---@type ts.mod.UserConfig
    opts = {
      incremental_selection = {
        enable = true,
        disable = false,
        -- set value to `false` to disable individual mapping
        keymaps = {
          init_selection = "<c-space>",
          node_incremental = "<c-space>",
          scope_incremental = false,
          node_decremental = false,
        },
      },
    },
  },

  {
    "OXY2DEV/helpview.nvim",
    lazy = false, -- Recommended

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },

  {
    "iFarmGolems/deploy.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = function()
      require("deploy").setup({
        timeout = 10,
        honor_gitignore = true,
        tool = "rsync",
        hosts = {
          {
            host = "10.111.8.26",
            label = "Bosna 1025 DEV",
          },
          {
            host = "192.168.111.220",
            label = "Kocka",
          },
          {
            host = "10.111.2.42",
            label = "IMSASAN 991 DEV",
          },
          {
            host = "192.168.151.90",
            label = "IMSASAN 991 PROD",
          },
        },
        mapping = {
          {
            fs = "/home/patrik/develop/repos/mis/sw/ims/ims4/Web/src/main/webapp",
            remote = "/opt/ims/tomcat/webapps/ims",
            -- remote = "/var/www/app.ims/ims",
          },
        },
      })
    end,
  },

  {
    "emmanueltouzery/apidocs.nvim",
    dependencies = {
      "folke/snacks.nvim",
    },
    cmd = { "ApidocsSearch", "ApidocsInstall", "ApidocsOpen", "ApidocsSelect", "ApidocsUninstall" },
    config = function()
      require("apidocs").setup()
      -- Picker will be auto-detected. To select a picker of your choice explicitly you can set picker by the configuration option 'picker':
      -- require('apidocs').setup({picker = "snacks"})
      -- Possible options are 'ui_select', 'telescope', and 'snacks'
    end,
    keys = {
      { "<leader>ad", "<cmd>ApidocsOpen<cr>", desc = "Search Api Doc" },
    },
  },
}
