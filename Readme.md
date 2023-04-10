# My Neovim Configuration

This is my personal Neovim configuration with various plugins and keymappings. It is designed to provide an optimal development experience for multiple languages, including JavaScript, TypeScript, C, Lua, Rust, and Go.

## Table of Contents

- [Installation](#installation)
- [Keymappings](#keymappings)
- [Plugins](#plugins)

## Installation

To use this Neovim configuration, follow these steps:

1. Ensure you have Neovim 0.5 or later installed.
2. Clone this repository to your Neovim configuration directory (usually `~/.config/nvim`).
3. Open Neovim, and the `lazy.nvim` package manager will take care of installing all necessary plugins and dependencies.

## Keymappings

Here are the custom keymappings defined in this configuration:

| Keymapping   | Description                      |
| ------------ | -------------------------------- |
| `<leader>gs` | Open the Git status window       |
| `<leader>pf` | Find files                       |
| `<C-p>`      | Find files in the Git repository |
| `<leader>ps` | Search for a string in files     |
| `<leader>u`  | Toggle UndoTree                  |
| `<leader>pv` | Open the file explorer           |
| `<leader>fp` | Format the current buffer        |
| `<leader>dd` | Open the diagnostics float       |
| `<leader>ff` | Format the current buffer        |
| `<leader>ss` | Save the current buffer          |
| `<leader>tt` | Open a new terminal              |
| `<leader>ll` | Toggle list characters           |

## Plugins

This configuration includes the following plugins:

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting and code analysis
- [lsp-zero](https://github.com/VonHeikemen/lsp-zero.nvim) - Language Server Protocol support
- [mason](https://github.com/williamboman/mason.nvim) - A lightweight package manager for Neovim
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Autocompletion
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippets
- [telescope](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
- [vim-fugitive](https://github.com/tpope/vim-fugitive) - Git integration
- [trouble](https://github.com/folke/trouble.nvim) - Diagnostics and quickfix list
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Automatic pairing of brackets and quotes
- [neoformat](https://github.com/sbdchd/neoformat) - Code formatting
- [lualine](https://github.com/nvim-lualine/lualine.nvim) - Status line
- [nerdcommenter](https://github.com/preservim/nerdcommenter) - Commenting functionality
- [vim-surround](https://github.com/tpope/vim-surround) - Quoting and parenthesizing
- [prettier](https://github.com/MunifTanjim/prettier.nvim) - Code formatting
- [undotree](https://github.com/mbbill/undotree) - Undo history visualization
