return {
	"folke/snacks.nvim",
	lazy = false,
	priority = 1000,
	cmd = "Snacks",
	config = function()
		require("snacks").setup({
			words = { enabled = false },
			toggle = { enabled = false },
			notifier = { enabled = false },
			terminal = { enabled = false },
			lazygit = { enabled = false },
			git = { enabled = false },
			rename = { enabled = false },

			bigfile = { enabled = true, disabled = { "latex", "markdown" } },
			quickfile = { enabled = true },
			bufdelete = { enabled = true },
			gitbrowse = { enabled = true },

			statuscolumn = {
				enabled = true,
				left = { "mark", "sign" }, -- priority of signs on the left (high to low)
				right = { "git" }, -- priority of signs on the right (high to low)
				folds = {
					open = true, -- show open fold icons
					git_hl = true, -- use Git Signs hl for fold icons
				},
				git = {
					patterns = { "GitSign", "MiniDiffSign" },
				},
				refresh = 200, -- refresh at most every 50ms
			},
			win = {
				show = true,
				relative = "editor",
				position = "bottom",
				minimal = true,
				wo = {
					cursorcolumn = true,
					cursorline = true,
					cursorlineopt = "both",
					fillchars = "eob: ,lastline:…",
					list = false,
					listchars = "extends:…,tab:  ",
					number = false,
					relativenumber = false,
					signcolumn = "no",
					spell = false,
					winbar = "",
					winhighlight = "Normal:SnacksDashboardNormal,NormalFloat:SnacksDashboardNormal",
					statuscolumn = "",
					wrap = false,
					sidescrolloff = 0,
				},
				bo = {},
				keys = {
					q = "close",
				},
			},
			dashboard = {
				row = nil, -- dashboard position. nil for center
				col = nil, -- dashboard position. nil for center},
				preset = {
					header = [[
  ____  _                 _ _      _ _         
 / ___|(_)_ __ ___  _ __ | (_) ___(_) |_ _   _ 
 \___ \| | '_ ` _ \| '_ \| | |/ __| | __| | | |
  ___) | | | | | | | |_) | | | (__| | |_| |_| |
 |____/|_|_| |_| |_| .__/|_|_|\___|_|\__|\__, |
                   |_|                   |___/ ]],
					keys = {
						{
							icon = " ",
							key = "f",
							desc = "Find File",
							action = ":lua Snacks.dashboard.pick('files')",
						},
						{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
						{
							icon = " ",
							key = "g",
							desc = "Find Text",
							action = ":lua Snacks.dashboard.pick('live_grep')",
						},
						{
							icon = " ",
							key = "r",
							desc = "Recent Files",
							action = ":lua Snacks.dashboard.pick('oldfiles')",
						},
						{
							icon = " ",
							key = "c",
							desc = "Config",
							action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
						},
					},
					{ icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy },
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
				sections = {
					{ section = "header" },
					{
						icon = " ",
						title = "Git Status",
						section = "terminal",
						enabled = vim.fn.isdirectory(".git") == 1,
						cmd = "git status --short --branch --renames",
						pane = 2,
						height = 5,
						padding = 1,
						ttl = 5 * 60,
						indent = 3,
					},
					{
						icon = " ",
						title = "Recent Files",
						section = "recent_files",
						pane = 2,
						indent = 2,
						padding = { 2, 2 },
					},
					{ section = "keys", gap = 1, padding = 1 },
					{ title = "Bookmarks", padding = 1, pane = 2 },
					{ section = "startup", pane = 1 },
				},
			},
		})
	end,
}
