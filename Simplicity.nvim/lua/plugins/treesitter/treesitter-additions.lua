return {
	"HiPhish/rainbow-delimiters.nvim",
	dependencies = { { "nvim-treesitter/nvim-treesitter" } },
	lazy = true,
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function() end,
	opts = {},
}
