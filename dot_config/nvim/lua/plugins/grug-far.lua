return {
	"MagicDuck/grug-far.nvim",
	-- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
	-- additional lazy config to defer loading is not really needed...
	opts = {},
	keys = {
		{
			"<leader>sri",
			function()
				require("grug-far").open({
					transient = true,
					prefills = {
						search = vim.fn.expand("<cword>"),
						paths = vim.fn.expand("%"),
					},
				})
			end,
			desc = "Replace current word in current file",
		},
		{
			"<leader>sra",
			function()
				require("grug-far").open({
					transient = true,
					prefills = { search = vim.fn.expand("<cword>") },
				})
			end,
			desc = "Replace current word in all files",
		},
		{
			"<leader>sri",
			mode = "v",
			function()
				require("grug-far").with_visual_selection({
					transient = true,
					prefills = { paths = vim.fn.expand("%") },
				})
			end,
			desc = "Replace visual selection in current file",
		},
		{
			"<leader>sra",
			mode = "v",
			function()
				require("grug-far").with_visual_selection({ transient = true })
			end,
			desc = "Replace visual selection in all files",
		},
		{
			"<leader>srx",
			mode = "n",
			desc = "Grug-Far AST Grep",
			function()
				local current_buffer_ft = vim.bo.filetype

				local lang_map = {
					python = "py",
					javascript = "js",
					typescript = "ts",
					xhtml = "html",
					rust = "rs",
				}

				local lang = lang_map[current_buffer_ft] or current_buffer_ft

				require("grug-far").open({
					transient = true,
					engine = "astgrep",
					prefills = {
						flags = "--lang=" .. lang,
					},
				})
			end,
		},
	},
}
