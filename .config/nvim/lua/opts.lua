-- options

-- globals
vim.o.ruler                 = true
vim.o.splitright            = true
vim.o.splitbelow            = true
vim.o.smartcase             = true
vim.o.hlsearch              = true
vim.o.background            = "dark"
vim.o.termguicolors         = true
vim.o.hidden                = true
vim.o.scrolloff             = 5
vim.o.sidescrolloff         = 5
vim.o.completeopt           = "menu,menuone,noselect"
vim.o.showmode              = true
vim.o.mouse                 = "a"

-- window
vim.wo.number               = true
vim.wo.relativenumber       = true
vim.wo.signcolumn           = "number"
vim.wo.wrap                 = false

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

-- colours
vim.cmd('colo dracula')
-- vim.cmd('colo wal')
vim.cmd('syntax on')
