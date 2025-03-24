local set = vim.keymap.set
local del = vim.keymap.del
-- local
local lsp = vim.lsp.buf
local diagn = vim.diagnostic
-- telescope

set("n", "<C-s>", ":w <CR>", { desc = "Save the current selected file" })

-- Moving and resizing windows
set("n", "<C-Up>", ":resize -2<CR>", { desc = "Decrease window height" })
set("n", "<C-Down>", ":resize +2<CR>", { desc = "Increase window height" })
set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- terminal resize
set("t", "<C-Up>", "<cmd>resize -2<CR>", { desc = "Decrease terminal height" })
set("t", "<C-Down>", "<cmd>resize +2<CR>", { desc = "Increase terminal height" })
set("t", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease terminal width" })
set("t", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase terminal width" })

-- Switching windows
set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- terminal window movements
set("t", "<C-h>", "<cmd>wincmd h<CR>", { desc = "Move to left terminal" })
set("t", "<C-j>", "<cmd>wincmd j<CR>", { desc = "Move to bottom terminal" })
set("t", "<C-k>", "<cmd>wincmd k<CR>", { desc = "Move to top terminal" })
set("t", "<C-l>", "<cmd>wincmd l<CR>", { desc = "Move to right terminal" })

-- moving blocks of text
set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move block down" })
set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move block up" })

-- easy indenting
set("v", "<", "<gv", { desc = "Indent left" })
set("v", ">", ">gv", { desc = "Indent right" })

-- easy buffer change
set("n", "<TAB>", "<cmd>bn<CR>", { desc = "Move to next buffer" })
set("n", "<S-TAB>", "<cmd>bp<CR>", { desc = "Move to previous buffer" })
set("n", "gt", ":bnext<CR>", { desc = "Go to next buffer" })
set("n", "tg", ":bprev<CR>", { desc = "Go to previous buffer" })
set("n", "<leader>bd", "<cmd>bd!<CR>", { desc = "Close current buffer" })

-- lsp keymaps
set("n", "gd", lsp.definition, { desc = "Go to definition" })
set("n", "K", lsp.hover, { desc = "Show LSP hover information" })
set("n", "<leader>vs", lsp.workspace_symbol, { desc = "Search workspace symbols" })
set("n", "<leader>vd", diagn.open_float, { desc = "Open diagnostics float" })
set("n", "[d", diagn.goto_next, { desc = "Go to next diagnostic" })
set("n", "]d", diagn.goto_prev, { desc = "Go to previous diagnostic" })
set("n", "<leader>ca", lsp.code_action, { desc = "Show code actions" })
set({ "n", "v" }, "<leader>gr", lsp.references, { desc = "Find references" })
set({ "n", "v" }, "<leader>rn", lsp.rename, { desc = "Rename symbol" })

-- Errors
set("n", "<leader>of", diagn.open_float, { desc = "Open diagnostic float window" })
set("n", "g]", diagn.goto_next, { desc = "Go to next diagnostic" })
set("n", "g[", diagn.goto_prev, { desc = "Go to previous diagnostic" })

set("n", "<leader>tl", function()
	local val = (
		vim.api.nvim_get_option_value("colorcolumn", {}) == ""
			and tostring(vim.api.nvim_get_option_value("textwidth", {}))
		or ""
	)
	vim.api.nvim_set_option_value("colorcolumn", val, {})
	vim.cmd("set list!")
end, { desc = "Toggle whitespace and line length display" })

set("n", "<leader>tf", function()
	vim.g.autoformat = not vim.g.autoformat
	vim.cmd('echo "Autoformat ' .. (vim.g.autoformat and "true" or "false") .. '"')
end, { desc = "Toggle format on save" })
