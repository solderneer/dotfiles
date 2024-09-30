local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
local uv = vim.uv or vim.loop

-- Auto-install lazy.nvim if not present
if not uv.fs_stat(lazypath) then
    print('Installing lazy.nvim....')
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
    print('Done.')
end

vim.opt.rtp:prepend(lazypath)
vim.opt.termguicolors = true

-- Automatically start CoqOn
vim.g.coq_settings = {
    auto_start = 'shut-up',
}

vim.cmd [[
  set termguicolors
	syntax enable

	" Setting backspace settings to be more convinient
	set backspace=indent,eol,start

	" turn absolute line numbers on
	:set number
	:set nu

	" Clear sign column color
	highlight clear SignColumn

	" Indent settings
	filetype plugin indent on
	set tabstop=4
	set shiftwidth=4
	set expandtab

	set undodir=~/.config/nvim/undodir
	set undofile
	set undolevels=100
	set undoreload=1000

	set backupdir=~/.config/nvim/backup
	set directory=~/.config/nvim/backup

	set ruler		" show the cursor position all the time
	set cursorline

	set showcmd		" display incomplete commands
]]

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install the plugins
require('lazy').setup({
    {
      "epwalsh/obsidian.nvim",
      version = "*",  -- recommended, use latest release instead of latest commit
      lazy = true,
      ft = "markdown",
      dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",
      },
      opts = {
        workspaces = {
          {
            name = "site",
            path = "~/Documents/solderneer/site/src/content",
          },
        },

        -- see below for full list of options 👇
      },
    },
    {
        "Tsuzat/NeoSolarized.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("NeoSolarized").setup({
                style = "light", -- "dark" or "light"
                transparent = false, -- true/false; Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
            })
            vim.cmd [[ colorscheme NeoSolarized ]]
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
    },
    {
        'goolord/alpha-nvim',
        config = function()
            require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
        end
    },
    {
        'nanozuki/tabby.nvim',
        event = 'VimEnter',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            -- configs...
        end,
    },
    {
       "nvim-tree/nvim-tree.lua",
       version = "*",
       lazy = false,
       dependencies = {
         "nvim-tree/nvim-web-devicons",
       },
       config = function()
         require("nvim-tree").setup {}
       end,
    },
    { 'lewis6991/gitsigns.nvim' },
    { 'nvim-tree/nvim-web-devicons' },
    { 'nvim-treesitter/nvim-treesitter' },
    { 'nvim-telescope/telescope.nvim',    tag = '0.1.6',       dependencies = { 'nvim-lua/plenary.nvim' } },
    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },
    { 'L3MON4D3/LuaSnip' },
    { 'ms-jpq/coq_nvim',                  branch = 'coq' },
    { 'ms-jpq/coq.artifacts',             branch = 'artifacts' },
    { 'ms-jpq/coq.thirdparty',            branch = '3p' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
})

-- Setting up lsp zero
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
    lsp_zero.set_sign_icons({ error = '✘', warn = '▲', hint = '⚑', info = '»' })
end)

require('lspconfig').clangd.setup({})

-- setting up mason for local lsp installation
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    },
})

-- Ensure Coq is loaded
require('coq')

-- Load treesitter
require("lazy").setup({ { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" } })

-- Load lualine
require('lualine').setup({
    options = {
        theme = 'NeoSolarized'
    }
})

-- keyboard shortcuts
local wk = require('which-key')
local mappings = {
    f = {
        name = 'Find',
        f = { '<cmd>Telescope find_files<cr>', 'Find File' },
        h = { '<cmd>Telescope oldfiles<cr>', 'Find Recent File' },
        g = { '<cmd>Telescope live_grep<cr>', 'Find Words' },
    },
    t = {
        name = 'Tab',
        a = { ':tabnew<CR>' , 'New Tab' },
        c = { ':tabclose<CR>', 'Close Tab' },
        n = { ':tabn<CR>', 'Next Tab' },
        p = { ':tabp<CR>', 'Previous Tab' }
    },
    d = { '<cmd>NvimTreeOpen<cr>', 'Show directory' },
}
local opts = { prefix = '<leader>' }
wk.register(mappings, opts)
