return {
	dir = "~/develop/repos/deploy.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-neotest/nvim-nio" },
	event = "VeryLazy",
	config = function()
		require("deploy").setup({
			timeout = 3,
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
				},
			},
		})
	end,
}
