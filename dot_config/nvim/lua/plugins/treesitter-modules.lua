return {
	"MeanderingProgrammer/treesitter-modules.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	---@module 'treesitter-modules'
	---@type ts.mod.UserConfig
	opts = {
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<c-space>",
				node_incremental = "<c-space>",
				scope_incremental = false,
				node_decremental = false,
			},
		},
	},
}
