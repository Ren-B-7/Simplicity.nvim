return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		enabled = true,
		lazy = true,
		config = true,
		cmd = { "Neotree" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			{
				"s1n7ax/nvim-window-picker",
				version = "2.*",
				config = function()
					require("window-picker").setup({
						filter_rules = {
							include_current_win = false,
							autoselect_one = true,
							-- filter using buffer options
							bo = {
								-- if the file type is one of following, the window will be ignored
								filetype = { "neo-tree", "neo-tree-popup", "notify" },
								-- if the buffer type is one of following, the window will be ignored
								buftype = { "terminal", "quickfix" },
							},
						},
					})
				end,
			},
		},
		opts = {
			filesystem = {
				filtered_items = { hide_dotfiles = false, hide_hidden = false, hide_gitignore = false },
				follow_current_file = {
					enabled = false, -- This will find and focus the file in the active buffer every time
					--               -- the current file is changed while the tree is open.
					leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
				},
				group_empty_dirs = false,
			},
			use_libuv_file_watcher = true,
		},
	},
}
