return {
	"saghen/blink.cmp",
	lazy = true,
	event = { "InsertEnter" },
	dependencies = { "rafamadriz/friendly-snippets" },

	-- Use a release tag to download pre-built binaries
	version = "*",
	opts = {
		completion = {
			ghost_text = { enabled = true, show_with_menu = false },
			menu = { auto_show = false },
			list = { selection = { preselect = true, auto_insert = true } },
		},
		-- Key mappings preset
		keymap = {
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide", "fallback" },
			["<CR>"] = { "accept", "fallback" },

			["<Tab>"] = { "snippet_forward", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "fallback" },

			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev", "fallback" },
			["<C-n>"] = { "select_next", "fallback" },
			["<A-k>"] = { "select_next", "fallback" },
			["<A-j>"] = { "select_prev", "fallback" },

			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
		},

		appearance = {
			-- Use nvim-cmp highlight groups if the theme doesn't support blink.cmp
			use_nvim_cmp_as_default = true,
			-- Adjust spacing for Nerd Fonts
			nerd_font_variant = "mono",
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			providers = {
				lsp = {
					name = "lsp",
					enabled = true,
					module = "blink.cmp.sources.lsp",
					score_offset = 90, -- Higher number = higher priority
				},
				path = {
					name = "Path",
					module = "blink.cmp.sources.path",
					score_offset = 25,
					fallbacks = { "snippets", "buffer" },
					opts = {
						trailing_slash = false,
						label_trailing_slash = true,
						get_cwd = function(context)
							return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
						end,
						show_hidden_files_by_default = true,
					},
				},
				buffer = {
					name = "Buffer",
					enabled = true,
					max_items = 3,
					module = "blink.cmp.sources.buffer",
					min_keyword_length = 4,
					score_offset = 15,
				},
				snippets = {
					name = "snippets",
					enabled = true,
					min_keyword_length = 2,
					module = "blink.cmp.sources.snippets",
					score_offset = 85,
				},
			},
		},
	},
	opts_extend = { "sources.default" },
}
