local m = {}

local cmd_conf = function(cmp)
	local cmd_line_options = { ":", "/", "?" }
	local cmd_line_commands = {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "cmdline", max_item_count = 5, group_index = 1 },
		}),
	}

	cmp.setup.cmdline(cmd_line_options, cmd_line_commands)
end

local global_conf = function(cmp)
	return {
		snippet = {
			expand = function(args)
				vim.snippet.expand(args.body)
			end,
		},
		completion = { completeopt = "menu, menuone, noselect" },

		view = {
			entries = { name = "custom", selection_order = "near_cursor", follow_cursor = false },
			docs = { auto_open = true },
		},
		formatting = {
			fields = { "kind", "abbr", "menu" },
		},
		mapping = {
			["<C-c>"] = cmp.mapping.open_docs(),
			["<C-d>"] = cmp.mapping.close_docs(),
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-UP>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
			["<C-DOWN>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<cr>"] = cmp.mapping.confirm({ select = true }),
		},
		sources = cmp.config.sources({
			{ name = "nvim_lsp", max_item_count = 10, group_index = 1 },
			{ name = "snippets", max_item_count = 2, group_index = 1 },
			{ name = "buffer", max_item_count = 5, ground_index = 2 },
			{ name = "cmdline", max_item_count = 5, group_index = 3 },
		}),
		experimental = {
			ghost_text = true,
		},
		performance = {
			max_view_entries = 15,
		},
	}
end

return {
	{
		"hrsh7th/nvim-cmp",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"garymjr/nvim-snippets",
		},
		config = function()
			require("cmp").setup(global_conf(require("cmp")))
			cmd_conf(require("cmp"))
		end,
	},
	{
		"garymjr/nvim-snippets",
		dependencies = { "rafamadriz/friendly-snippets" },
		lazy = true,
		opts = { friendly_snippets = true, create_cmp_source = true },
		keys = {
			{
				"<Tab>",
				function()
					if vim.snippet.active({ direction = 1 }) then
						vim.schedule(function()
							vim.snippet.jump(1)
						end)
						return
					end
					return "<Tab>"
				end,
				expr = true,
				silent = true,
				mode = "i",
			},
			{
				"<Tab>",
				function()
					vim.schedule(function()
						vim.snippet.jump(1)
					end)
				end,
				expr = true,
				silent = true,
				mode = "s",
			},
			{
				"<S-Tab>",
				function()
					if vim.snippet.active({ direction = -1 }) then
						vim.schedule(function()
							vim.snippet.jump(-1)
						end)
						return
					end
					return "<S-Tab>"
				end,
				expr = true,
				silent = true,
				mode = { "i", "s" },
			},
		},
	},
}
