local nvim_create = vim.api.nvim_create_autocmd
nvim_create("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({})
	end,
	desc = "highlights yank",
})
