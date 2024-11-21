return {
	"debugloop/telescope-undo.nvim",
	lazy = true,
	dependencies = {
		{
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
	},
	config = function()
		-- Calling telescope's setup from multiple specs does not hurt, it will happily merge the configs
		require("telescope").setup({ extensions = { "undo" } })
		require("telescope").load_extension("undo")
	end,
}
