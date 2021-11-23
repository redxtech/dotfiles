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

map('n', '<leader>fs',      ':w<CR>')             -- write file
map('n', '<leader>fS',      ':SudoWrite<CR>')     -- write file
map('n', '<leader>qq',      ':q<CR>')             -- close buffer
map('n', '<leader>qQ',      ':q!<CR>')            -- close buffer (force)
map('n', '<leader>cl',      ':Commentary<CR>')    -- close buffer (force)
map('n', '<leader>h',       ':noh<CR>')           -- remove highlight
map('n', '<leader>y',       '"+y')                -- yank to system clip
map('n', '<leader>p',       '"+p')                -- paste from system clip
map('n', '<C-h>',           '<C-w>h')             -- navigate windows (left)
map('n', '<C-j>',           '<C-w>j')             -- navigate windows (down)
map('n', '<C-k>',           '<C-w>k')             -- navigate windows (up)
map('n', '<C-l>',           '<C-w>l')             -- navigate windows (right)
map('n', 'sv',              ':vsplit<CR>')            -- vertical split
map('n', 'sg',              ':split<CR>')             -- horizontal split
map('n', '<leader>ss',      ':wa<CR>:mksession! $HOME/.cache/nvim/sessions/')
map('n', '<leader>rs',      ':wa<CR>:source $HOME/.cache/nvim/sessions/')

-- telescope binds
map('n', '<leader>ff',      '<cmd>Telescope find_files<cr>')  -- find files
map('n', '<leader>fg',      '<cmd>Telescope live_grep<cr>')   -- live live_grep
map('n', '<leader><space>', '<cmd>Telescope buffers<cr>')     -- find buffer
map('n', '<leader>fh',      '<cmd>Telescope help_tags<cr>')   -- search help tags
map('n', '<leader>gf',      '<cmd>Telescope git_files<cr>')   -- find git files
map('n', '<leader>bf',      '<cmd>Telescope file_browser<cr>')   -- find git files

-- bufferline binds
map('n', '[b',  ':BufferLineCycleNext<CR>', {silent = true})      -- next tab
map('n', 'b]',  ':BufferLineCyclePrev<CR>', {silent = true})      -- prev tab

-- which key
map('n', '<leader>', ":WhichKey '<Space>'<CR>", {silent = true})  --k

-- TODO
