return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = { suggestion = { enabled = true, auto_trigger = true } },
	},

	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		keys = {
			{
				"<leader>ae",
				":CodeCompanion ",
				mode = { "v" },
				desc = "Code Companion inline edit",
			},
			{
				"<leader>aa",
				":CodeCompanionChat<CR>",
				mode = { "n" },
				silent = true,
				desc = "Code Companion Chat",
			},
		},
		config = function()
			require("codecompanion").setup({
				strategies = {
					chat = {
						adapter = "copilot",
						model = "grok-code-fast-1",
					},
					inline = {
						adapter = "copilot",
						model = "grok-code-fast-1",
					},
				},
				adapters = {
					http = {
						openrouter = function()
							return require("codecompanion.adapters").extend(
								"openai_compatible",
								{
									env = {
										url = "https://openrouter.ai/api",
										api_key = "OPENROUTER_API_KEY",
										chat_url = "/v1/chat/completions",
									},
									handlers = {
										parse_message_meta = function(_, data)
											local extra = data.extra
											if extra and extra.reasoning then
												data.output.reasoning = { content = extra.reasoning }
												if data.output.content == "" then
													data.output.content = nil
												end
											end
											return data
										end,
									},
								}
							)
						end,
					},
				},
				opts = {
					log_level = "DEBUG",
				},
			})
		end,
	},
}
