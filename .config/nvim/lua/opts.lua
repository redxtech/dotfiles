-- options

-- globals
vim.o.background            = "dark"
vim.o.completeopt           = "menu,menuone,noselect"
vim.o.hidden                = true
vim.o.hlsearch              = true
vim.o.mouse                 = "a"
vim.o.ruler                 = true
vim.o.scrolloff             = 5
vim.o.showmode              = true
vim.o.sidescrolloff         = 5
vim.o.smartcase             = true
vim.o.inccommand            = "split"
vim.o.splitbelow            = true
vim.o.splitright            = true
vim.o.termguicolors         = true
vim.o.undofile              = true


-- window
vim.wo.number               = true
vim.wo.relativenumber       = true
vim.wo.signcolumn           = "yes"
vim.wo.wrap                 = false
vim.wo.cursorcolumn         = true

-- buffer
local indent                = 2
vim.o.tabstop               = indent
vim.bo.tabstop              = indent
vim.o.softtabstop           = indent
vim.bo.softtabstop          = indent
vim.o.shiftwidth            = indent
vim.bo.shiftwidth           = indent
vim.o.autoindent            = true
vim.bo.autoindent           = true
vim.o.expandtab             = true
vim.bo.expandtab            = true

-- binds?
vim.g.mapleader             = " "
vim.b.mapleader             = " "
vim.g.AutoPairsShortcutToggle = ""

-- some config
vim.g.dashboard_default_executive = 'telescope'

-- colours
vim.cmd('colo dracula')
-- vim.cmd('colo wal')
vim.g.airline_theme         = "dracula"

-- syntax highlighting
vim.cmd('syntax on')

