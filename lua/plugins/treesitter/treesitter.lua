return {
	"nvim-treesitter/nvim-treesitter",
	enabled = true,
	config = true,
	lazy = true,
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })
	end,
	opts = {
		ensure_installed = {
			"c",
			"cpp",
			"lua",
			"bash",
		},
		auto_install = true,
		sync_install = true,
		highlight = { enable = true },
		indent = { enable = true },
		ignore_install = {},
	},
}
