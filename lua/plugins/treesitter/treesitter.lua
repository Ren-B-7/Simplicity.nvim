return {
	"romus204/tree-sitter-manager.nvim",
	enabled = true,
	config = true,
	lazy = true,
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	build = ":TSUpdate",
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
