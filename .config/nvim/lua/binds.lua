-- keybind config

-- leader is space
vim.g.mapleader = ' '

-- a mapping function to make it easier to apply
local function map(mode, combo, mapping, opts)
  local options = {noremap = true}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, combo, mapping, options)
end

map('n', '<leader>fs',  ':w<CR>')             -- write file
map('n', '<leader>fS',  ':SudoWrite<CR>')     -- write file
map('n', '<leader>qq',  ':q<CR>')             -- close buffer
map('n', '<leader>qQ',  ':q!<CR>')            -- close buffer (force)
map('n', '<leader>cl',  ':Commentary<CR>')    -- close buffer (force)
map('n', '<leader>h',   ':noh<CR>')           -- remove highlight
map('n', '<leader>y',   '"+y')                -- yank to system clip
map('n', '<leader>p',   '"+p')                -- paste from system clip

-- TODO
-- <leader>p - paste from system clip
-- <leader>y - yank to system clip
