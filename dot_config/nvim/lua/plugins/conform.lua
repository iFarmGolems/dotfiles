return {
	"stevearc/conform.nvim",
	event = "BufReadPre",
	opts = {
		formatters = {
			biome = {
				require_cwd = true,
			},
		},
		format_on_save = {
			timeout_ms = 500,
		},
		formatters_by_ft = {
			["*"] = { "injected" }, -- enables injected-lang formatting for all filetypes
			lua = { "stylua" },
			javascript = { "biome" },
			typescript = { "biome" },
			json = { "prettierd" },
			markdown = { "prettierd" },
			html = { "prettierd" },
			css = { "prettierd" },
			yaml = { "prettierd" },
			vue = { "prettierd" },
		},
	},
}
