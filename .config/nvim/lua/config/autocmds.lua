-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
	return vim.api.nvim_create_augroup('lazyvim_' .. name, { clear = true })
end

-- disable spelling on buffer read
vim.api.nvim_create_autocmd('BufReadPost', {
	group = augroup('no_spell'),
	callback = function()
		vim.opt_local.spell = false
	end,
})

vim.cmd([[autocmd BufRead,BufNewFile ~/.config/waybar/config set syntax=jsonc]])
vim.cmd([[autocmd BufRead,BufNewFile *.rasi set syntax=css]])
