return {
	"romus204/tree-sitter-manager.nvim",
	lazy = true,
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		require("tree-sitter-manager").setup({
			ensure_installed = {
				"c",
				"cpp",
				"lua",
				"python",
				"query",
				"rust",
				"javascript",
				"typescript",
				"bash",
				"json",
				"xml",
				"html",
				"yaml",
				"vim",
				"markdown",
				"markdown_inline",
			},
			auto_install = false,
			highlight = true,
			nohighlight = {},
		})
	end,
}
