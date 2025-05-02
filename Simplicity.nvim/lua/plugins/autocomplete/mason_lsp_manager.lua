return {
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
		lazy = true,
		opts = {},
		event = { "BufAdd" },
		config = function()
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
		end,
	},
	{
		"williamboman/mason.nvim",
		lazy = true,
		cmd = { "Mason", "MasonUpdate", "MasonInstall", "MasonUninstall", "MasonLog" },
		event = { "UIEnter" },
		config = function()
			require("mason").setup()

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
		lazy = true,
	},
}
