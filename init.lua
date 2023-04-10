local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "

require("lazy").setup({
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require 'nvim-treesitter.configs'.setup {
        -- A list of parser names, or "all"
        ensure_installed = { "javascript", "typescript", "c", "lua", "rust", "go" },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,
        highlight = {
          -- `false` will disable the whole extension
          enable = true,
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
      }
    end
  },
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' }, -- Required
    {
      -- Optional
      'williamboman/mason.nvim',
      build = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    { 'williamboman/mason-lspconfig.nvim' }, -- Optional

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },     -- Required
    { 'hrsh7th/cmp-nvim-lsp' }, -- Required
    { 'L3MON4D3/LuaSnip' },     -- Required
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate"
  },
  "rebelot/kanagawa.nvim",
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  'tpope/vim-fugitive',
  {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    build = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  },
  'sbdchd/neoformat',
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
  },
  'preservim/nerdcommenter',
  'tpope/vim-surround',
  'neovim/nvim-lspconfig',
  {
    'MunifTanjim/prettier.nvim',
    config = function()
      require('prettier').setup({
        bin = 'prettier', -- or `'prettierd'` (v0.22+)
        filetypes = {
          "css",
          "graphql",
          "html",
          "javascript",
          "javascriptreact",
          "json",
          "less",
          "markdown",
          "scss",
          "typescript",
          "typescriptreact",
          "yaml",
        },
        cli_options = {
          arrow_parens = "always",
          bracket_spacing = true,
          bracket_same_line = false,
          embedded_language_formatting = "auto",
          end_of_line = "lf",
          html_whitespace_sensitivity = "css",
          -- jsx_bracket_same_line = false,
          jsx_single_quote = false,
          print_width = 80,
          prose_wrap = "always",
          quote_props = "as-needed",
          semi = true,
          single_attribute_per_line = false,
          single_quote = false,
          tab_width = 2,
          trailing_comma = "es5",
          use_tabs = false,
          vue_indent_script_and_style = false,
        },
      })
    end
  },
  'mbbill/undotree',
  {
    'lewis6991/gitsigns.nvim',
    build = function()
      require('gitsigns').setup()
    end
  },
  "https://github.com/github/copilot.vim"
})

require('lualine').setup()

vim.keymap.set("n", "<leader>gs", vim.cmd.git);

local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.ensure_installed({
  'tsserver',
  'eslint',
  'tailwindcss',
  'dockerls',
  'gopls',
})

lsp.setup()
--enable inline errors aka set diagnostics to default
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>fp", vim.cmd.LspZeroFormat)
vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>ff", vim.cmd.Neoformat)


vim.api.nvim_set_keymap('n', '<leader>ss', '<cmd>w<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>tt', '<cmd>terminal<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ll', ':set list<cr>', { noremap = true })

vim.g.copilot_assume_mapped = true


vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opthlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true


vim.opt.listchars = { tab = ">>", trail = "-", eol = "$", space = "·" }

function ColorMyPencils(color)
  color = color or "kanagawa"
  vim.cmd("colorscheme " .. color)
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()

--[[require'nvim-treesitter.configs'.setup {]]
--[[-- A list of parser names, or "all"]]
--[[ensure_installed = { "help", "javascript", "typescript", "c", "lua", "rust", "go"  },]]
--[[-- Install parsers synchronously (only applied to `ensure_installed`)]]
--[[sync_install = false,]]
--[[-- Automatically install missing parsers when entering buffer]]
--[[-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally]]
--[[auto_install = true,]]
--[[highlight = {]]
--[[-- `false` will disable the whole extension]]
--[[enable = true,]]
--[[-- Setting this to true will run `:h syntax` and tree-sitter at the same time.]]
--[[-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).]]
--[[-- Using this option may slow down your editor, and you may see some duplicate highlights.]]
--[[-- Instead of true it can also be a list of languages]]
--[[additional_vim_regex_highlighting = false,]]
--[[},]]
--[[}]]
