-- options

-- globals
vim.o.background     = "dark"
vim.o.completeopt    = "menu,menuone"
vim.o.foldlevelstart = 99
vim.o.guifont        = "DankMono Nerd Font"
vim.o.hidden         = true
vim.o.hlsearch       = true
vim.o.inccommand     = "split"
vim.o.laststatus     = 3
vim.o.ruler          = true
vim.o.scrolloff      = 5
vim.o.showmode       = true
vim.o.sidescrolloff  = 5
vim.o.smartcase      = true
vim.o.splitbelow     = true
vim.o.splitright     = true
vim.o.termguicolors  = true
vim.o.undofile       = true
vim.o.updatetime     = 1000


-- window
vim.wo.cursorcolumn   = true
vim.wo.foldexpr       = "nvim_treesitter#foldexpr()"
vim.wo.foldmethod     = "expr"
vim.wo.number         = true
vim.wo.relativenumber = true
vim.wo.signcolumn     = "yes"
vim.wo.wrap           = false

-- indentation
vim.o.autoindent   = true
vim.o.expandtab    = false
vim.o.shiftwidth   = 0
vim.o.softtabstop  = 0
vim.o.tabstop      = 2

-- binds?
vim.g.mapleader               = " "
vim.b.mapleader               = " "
vim.g.AutoPairsShortcutToggle = ""

-- disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- some config
vim.g.markdown_fenced_languages = {'ts=typescript'}

-- colours
vim.cmd('colo dracula')
-- vim.cmd('colo catppuccin-frappe')

-- syntax highlighting
vim.cmd('syntax on')

