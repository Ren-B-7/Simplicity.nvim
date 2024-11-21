local g = vim.g
local opt = vim.opt

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.mapleader = " "
g.autoformat = true

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes:1"

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.textwidth = 80
opt.expandtab = true

vim.smartindent = true

opt.wrap = false

opt.hlsearch = false
opt.incsearch = true
opt.inccommand = "split"

opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.modifiable = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Set nvim clipboard and system clipboard
opt.clipboard = "unnamedplus"

opt.scrolloff = 5
opt.updatetime = 100

opt.termguicolors = true

opt.sessionoptions = {
	"buffers",
	"globals",
	"resize",
}
