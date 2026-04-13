return {
	{
		"mfussenegger/nvim-lint",
		dependencies = { "mason-org/mason.nvim" },
		lazy = true,
		event = {
			"InsertLeave",
			"InsertEnter",
		},
		config = function()
			require("mason").setup()

			local lint = require("lint")

			lint.linters_by_ft = {
				rust = { "bacon" },
				rs = { "bacon" },
				c = { "cpplint" },
				cpp = { "cpplint" },
				python = { "pylint" },
				py = { "pylint" },
				lua = { "selene" },
				luau = { "selene" },
				bash = { "shellcheck" },
				sh = { "shellcheck" },
				zsh = { "shellcheck" },
				ksh = { "shellcheck" },
				csh = { "shellcheck" },
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			vim.api.nvim_create_autocmd({
				"BufWritePost",
			}, {
				group = lint_augroup,
				callback = function()
					local ft = vim.bo.filetype
					if lint.linters_by_ft[ft] then
						lint.try_lint(nil, { ignore_errors = true })
					end
				end,
			})
		end,
		keys = {
			{
				"<leader>ml",
				function()
					require("lint").try_lint()
				end,
				mode = "n",
				desc = "Trigger linting for file",
			},
		},
	},
}
