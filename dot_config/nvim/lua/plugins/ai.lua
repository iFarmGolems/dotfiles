return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = { suggestion = { enabled = true, auto_trigger = true } },
	},
	{
		"yetone/avante.nvim",
		version = false,
		build = "make",
		event = "VeryLazy",
		dependencies = {
			"zbirenbaum/copilot.lua",
		},
		---@module 'avante'
		opts = {
			provider = "copilot",
			providers = {
				copilot = { model = "grok-code-fast-1" },
			},
			web_search_engine = {
				provider = "tavily",
			},
			selection = {
				hint_display = "none",
			},
			behaviour = {
				auto_add_current_file = false,
				auto_set_keymaps = true,
			},
		},
	},
}
