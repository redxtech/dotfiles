-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local g = vim.g
local opt = vim.opt

opt.completeopt = 'menu,menuone,preview'
opt.clipboard = 'unnamed'
opt.breakindent = true
opt.smartindent = false
opt.cindent = true

-- neovide options
vim.o.guifont = 'Dank Mono,Symbols Nerd Font:h14'
g.neovide_transparency = 0.9

if vim.g.neovide then
	vim.keymap.set('n', '<C-s>', ':w<CR>') -- Save
	vim.keymap.set('v', '<C-c>', '"+y') -- Copy
	vim.keymap.set('n', '<C-v>', '"+P') -- Paste normal mode
	vim.keymap.set('v', '<C-v>', '"+P') -- Paste visual mode
	vim.keymap.set('c', '<C-v>', '<C-R>+') -- Paste command mode
	vim.keymap.set('i', '<C-v>', '<ESC>l"+Pli') -- Paste insert mode
end
