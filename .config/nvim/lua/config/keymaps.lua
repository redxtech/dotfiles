-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require('lazyvim.util')

local function map(mode, lhs, rhs, opts)
	local keys = require('lazy.core.handler').handlers.keys
	---@cast keys LazyKeysHandler
	-- do not create the keymap if a lazy keys handler exists
	if not keys.active[keys.parse({ lhs, mode = mode }).id] then
		opts = opts or { noremap = true }
		opts.silent = opts.silent ~= false
		vim.keymap.set(mode, lhs, rhs, opts)
	end
end

-- ease of use binds
map('n', ';', ';', { desc = 'Command' })
map('n', '<C-w>', 'daw', { desc = 'Delete word' })
map('n', '<leader>h', '<cmd>noh<cr>', { desc = 'Remove highlight' })
map('n', '<leader>qQ', '<cmd>qa!<cr>', { desc = 'Force quit all' })

-- re-implement window navigation binds
map('n', '<C-h>', '<C-w>h', { desc = 'Go to left window', remap = false })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window', remap = false })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window', remap = false })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to right window', remap = false })

-- save file
map('n', '<leader>fs', '<cmd>w<cr>', { desc = 'Write file' })
map('n', '<leader>fS', '<cmd>SudoWrite<cr>', { desc = 'Write file with sudo' })
map('v', '<leader>fs', '<cmd>w<cr>', { desc = 'Write file' })
map('v', '<leader>fS', '<cmd>SudoWrite<cr>', { desc = 'Write file with sudo' })

-- clipboard
map('v', '<leader>y', '"+y', { desc = 'Yank to system clipboard' })
map('v', '<leader>p', '"+p', { desc = 'Paste from system clipboard' })
map('n', '<leader>P', '<cmd>!pst %<CR>', { desc = 'Upload buffer to paste bin' })

map('n', '<leader>nn', '<cmd>Neoconf local<cr>', { desc = 'Open project local config' })
map('n', '<leader>ng', '<cmd>Neoconf global<cr>', { desc = 'Open Neoconf global config' })
map('n', '<leader>ns', '<cmd>Neoconf show<cr>', { desc = 'Show Neoconf lsp config' })
map('n', '<leader>nl', '<cmd>Neoconf lsp<cr>', { desc = 'Show Neoconf lsp config' })

-- extra spectre binds
map('n', '<leader>sp', "<cmd>lua require('spectre').open_file_search()<cr>")
map('n', '<leader>sP', "<cmd>lua require('spectre').open_file_search({select_word=true})<cr>")

-- buffer navigation
map('n', '<leader>1', '<cmd>BufferLineGoToBuffer 1<cr>', { desc = 'Goto buffer 1' })
map('n', '<leader>2', '<cmd>BufferLineGoToBuffer 2<cr>', { desc = 'Goto buffer 2' })
map('n', '<leader>3', '<cmd>BufferLineGoToBuffer 3<cr>', { desc = 'Goto buffer 3' })
map('n', '<leader>4', '<cmd>BufferLineGoToBuffer 4<cr>', { desc = 'Goto buffer 4' })
map('n', '<leader>5', '<cmd>BufferLineGoToBuffer 5<cr>', { desc = 'Goto buffer 5' })
map('n', '<leader>6', '<cmd>BufferLineGoToBuffer 6<cr>', { desc = 'Goto buffer 6' })
map('n', '<leader>7', '<cmd>BufferLineGoToBuffer 7<cr>', { desc = 'Goto buffer 7' })
map('n', '<leader>8', '<cmd>BufferLineGoToBuffer 8<cr>', { desc = 'Goto buffer 8' })
map('n', '<leader>9', '<cmd>BufferLineGoToBuffer 9<cr>', { desc = 'Goto buffer 9' })
map('n', '<leader>0', '<cmd>BufferLineGoToBuffer 10<cr>', { desc = 'Goto buffer 10' })
