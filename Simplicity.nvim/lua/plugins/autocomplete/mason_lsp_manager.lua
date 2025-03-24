return {
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { { "williamboman/mason.nvim", lazy = true, cmd = { "Mason" } } },
		lazy = true,
		opts = {},
		config = true,
	},
	{
		"williamboman/mason.nvim",
		lazy = true,
		cmd = { "Mason", "MasonUpdate", "MasonInstall", "MasonUninstall", "MasonLog" },
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"nvim-lua/plenary.nvim",
			"neovim/nvim-lspconfig",
			"saghen/blink.cmp",
		},
		config = function()
			require("mason").setup()

			require("mason-lspconfig").setup({
				ensure_installed = {},
				automatic_installation = true,
			})

			local capabilities = require("blink.cmp").get_lsp_capabilities()

			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({ capabilities = capabilities })
				end,
			})

			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "✘",
						[vim.diagnostic.severity.WARN] = "▲",
						[vim.diagnostic.severity.HINT] = "⚑",
						[vim.diagnostic.severity.INFO] = "»",
					},
				},
				virtual_text = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		lazy = true,
		setup = {
			servers = {
				basedpyright = {
					settings = {
						basedpyright = {
							analysis = { typeCheckingMode = "standard" },
						},
					},
				},
			},
		},
	},
}
