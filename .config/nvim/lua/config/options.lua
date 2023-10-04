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
g.neovide_transparency = 0.85
