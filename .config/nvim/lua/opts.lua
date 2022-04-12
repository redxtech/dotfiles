-- options

-- globals
vim.o.background     = "dark"
vim.o.completeopt    = "menu,menuone,noselect"
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


-- window
vim.wo.cursorcolumn   = true
vim.wo.foldexpr       = "nvim_treesitter#foldexpr()"
vim.wo.foldmethod     = "expr"
vim.wo.number         = true
vim.wo.relativenumber = true
vim.wo.signcolumn     = "yes"
vim.wo.wrap           = false

-- buffer
local indent       = 4
vim.bo.autoindent  = true
vim.bo.expandtab   = false
vim.bo.shiftwidth  = 0
vim.bo.softtabstop = indent
vim.bo.tabstop     = indent
vim.o.autoindent   = true
vim.o.expandtab    = false
vim.o.shiftwidth   = 0
vim.o.softtabstop  = indent
vim.o.tabstop      = indent

-- binds?
vim.g.mapleader               = " "
vim.b.mapleader               = " "
vim.g.AutoPairsShortcutToggle = ""

-- some config
vim.g.markdown_fenced_languages = {'ts=typescript'}

-- colours
vim.cmd('colo dracula')
-- vim.cmd('colo wal')

-- syntax highlighting
vim.cmd('syntax on')

