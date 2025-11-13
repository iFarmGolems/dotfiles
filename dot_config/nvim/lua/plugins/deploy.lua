return {
	-- "iFarmGolems/deploy.nvim",
	dir = "~/develop/repos/deploy.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-neotest/nvim-nio" },
	event = "VeryLazy",
	config = function()
		require("deploy").setup({
			timeout = 3,
			hosts = {
				{
					address = "10.111.8.26",
					label = "Bosna 1025 DEV",
				},
				{
					address = "172.18.1.235",
					label = "Bosna 1025 PROD",
				},
				{
					address = "192.168.111.220",
					label = "Kocka",
				},
				{
					address = "10.111.2.42",
					label = "IMSASAN 991 DEV",
				},
				{
					address = "192.168.151.90",
					label = "IMSASAN 991 PROD",
				},
			},
			mappings = {
				{
					fs = "/home/patrik/develop/repos/mis/sw/ims/ims4/Web/src/main/webapp",
					remote = "/opt/ims/tomcat/webapps/ims",
					rewrite = function(context)
						local skip_extensions = { "md", "ts", "lock", "sh", "md", "java" }

						if vim.tbl_contains(skip_extensions, context.extension or "") then
							return false
						end
					end,
				},
			},
		})
	end,
}
