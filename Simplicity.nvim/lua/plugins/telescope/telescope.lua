return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = true,
	cmd = "Telescope",
	opts = {
		defaults = {
			mappings = {
				i = {
					["<C-n>"] = require("telescope.actions").cycle_history_next,
					["<C-p>"] = require("telescope.actions").cycle_history_prev,

					["<C-j>"] = require("telescope.actions").move_selection_next,
					["<C-k>"] = require("telescope.actions").move_selection_previous,

					["<C-q>"] = require("telescope.actions").close,
				},
				n = {
					["<esc>"] = require("telescope.actions").close,
					["j"] = require("telescope.actions").move_selection_next,
					["k"] = require("telescope.actions").move_selection_previous,
					["q"] = require("telescope.actions").close,
				},
			},
		},
		pickers = { buffers = { show_all_buffers = true } },
	},
}
