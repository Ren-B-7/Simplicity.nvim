# Simplicity neovim  

Simplicity neovim is neovim repository perfectly setup for speed and the basics

## Includes

Large file support, faster file loading, completion, linting, tabs, intro windows and formatting.

# Plugins
## Plugin loader
- [x] [lazy.nvim](https://github.com/folke/lazy.nvim) (Lazy loading plugin manager)  

## File tree
- [x] [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) (File explorer replacement for NERDTree)
           - [nui.nvim](https://github.com/MunifTanjim/nui.nvim) (UI components library for Neovim plugins)
           - [nvim-window-picker](https://github.com/s1n7ax/nvim-window-picker) (Simplified window selection interface)  

## Protocols
- [x] [mason.nvim](https://github.com/williamboman/mason.nvim) (Package manager for LSP, DAP, linters, and formatters)  

### LSP
- [x] [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) (Quick LSP configuration setup)  
- [x] [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) (Bridge for Mason and LSPConfig)  

- [x] [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) (Completion framework for Neovim)  
- [x] [blink-cmp](https://github.com/Saghen/blink.cmp) (Faster completion engine with lsp hooks)

### Formatting
- [x] [conform.nvim](https://github.com/stevearc/conform.nvim) (Code formatting setup)  

### Linting
- [x] [nvim-lint](https://github.com/mfussenegger/nvim-lint) (Code linting integration)  

### Snippets
- [x] [nvim-snippets](https://github.com/garymjr/nvim-snippets) (Customizable code snippets)  
- [x] [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) (Predefined snippets for multiple languages)  

## Telescope
- [x] [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) (Fuzzy finder and file searching)  
           - [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) (Utility functions for Neovim plugins)  
- [x] [telescope-undo.nvim](https://github.com/debugloop/telescope-undo.nvim) (Enhanced undo tree exploration)  

## Quality of life plugins
- [x] [mini-git](https://github.com/echasnovski/mini-git) (Minimalist Git utilities for Neovim)  
- [x] [mini.comment](https://github.com/echasnovski/mini.comment) (Effortless commenting of code)  
- [x] [mini.indentscope](https://github.com/echasnovski/mini.indentscope) (Highlights current code scope's indentation)
- [x] [which-key.nvim](https://github.com/folke/which-key.nvim) (Displays keybindings as you type)
- [x] [snacks.nvim](https://github.com/folke/snacks.nvim) (Large file support and improved loading)

## Position plugins\
- [x] [mini.statusline](https://github.com/echasnovski/mini.statusline) (Lightweight and customizable statusline)  
- [x] [mini.tabline](https://github.com/echasnovski/mini.tabline) (Minimalist tabline management)  
- [x] [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) (Git integration and signs in the editor)  

## Highlighting
- [x] [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) (Better syntax highlighting and parsing)  

# Keymaps?
Keymaps will likely be added to the wiki later.  

# Why
I have a way to select my neovim config on startup, or launch directly, sometimes you just want to go with bare bones, this is it.  

[Selecting different neovim configs?](https://github.com/Ren-B-7/Complexity.nvim/blob/bc88c944b1ff2fdf332c985a083c700c6b4f472f/.zshrc#L108)
