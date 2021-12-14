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
map('n', '<leader>h',       ':noh<CR>')           -- remove highlight
map('n', '<leader>y',       '"+y')                -- yank to system clip
map('n', '<leader>p',       '"+p')                -- paste from system clip
map('n', '<C-h>',           '<C-w>h')             -- navigate windows (left)
map('n', '<C-j>',           '<C-w>j')             -- navigate windows (down)
map('n', '<C-k>',           '<C-w>k')             -- navigate windows (up)
map('n', '<C-l>',           '<C-w>l')             -- navigate windows (right)
map('n', 'sv',              ':vsplit<CR>')        -- vertical split
map('n', 'sg',              ':split<CR>')         -- horizontal split
map('n', '<C-w>',           'daw')                -- delete word
map('n', 'S',               ':%s//g<Left><Left>') -- replace all
map('n', '<C-n>',           '<cmd>NvimTreeToggle<CR>') -- open nvim tree
map('n', '<leader>r',       '<cmd>NvimTreeRefresh<CR>') -- open nvim tree
map('n', '<leader>n',       '<cmd>NvimTreeFindFile<CR>') -- open nvim tree
map('n', '<leader>-',       ":wincmd _<cr>:wincmd \\|<cr>")
map('n', '<leader>=',       ":wincmd =<cr>")
map('n', '<leader>cl',      'gcc', {noremap=false})                             -- toggle comment
map('n', '<leader>ts',      ':setlocal spell! spelllang=en_us<CR>')             -- toggle spellcheck
map('n', '<leader>ss',      ':wa<CR>:mksession! $HOME/.cache/nvim/sessions/')   -- save session
map('n', '<leader>rs',      ':wa<CR>:source $HOME/.cache/nvim/sessions/')       -- restore session

-- lsp binds (moved to lsp.lua)

-- telescope binds
map('n', '<leader><space>', '<cmd>Telescope buffers<cr>')       -- find buffer
map('n', '<leader>ff',      '<cmd>Telescope find_files<cr>')    -- find files
map('n', '<leader>fg',      '<cmd>Telescope git_files<cr>')     -- find git files
map('n', '<leader>fb',      '<cmd>Telescope file_browser<cr>')  -- find git files
map('n', '<leader>fh',      '<cmd>Telescope help_tags<cr>')     -- search help tags
map('n', '<leader>sg',      '<cmd>Telescope live_grep<cr>')     -- live live_grep

-- packer binds
map('n', '<leader>ps',      '<cmd>PackerSync<cr>')    -- sync packages
map('n', '<leader>pu',      '<cmd>PackerUpdate<cr>')    -- sync packages
map('n', '<leader>pc',      '<cmd>PackerCompile<cr>')    -- sync packages

-- bufferline binds
map('n', ']b',              ':BufferLineCycleNext<CR>', {silent = true})      -- next tab
map('n', '[b',              ':BufferLineCyclePrev<CR>', {silent = true})      -- prev tab
map('n', ']B',              ':BufferLineMoveNext<CR>', {silent = true})      -- prev tab
map('n', '[B',              ':BufferLineCyclePrev<CR>', {silent = true})      -- prev tab
map('n', '<leader>1',       '<Cmd>BufferLineGoToBuffer 1<CR>', {noremap=true, silent=true})
map('n', '<leader>2',       '<Cmd>BufferLineGoToBuffer 2<CR>', {noremap=true, silent=true})
map('n', '<leader>3',       '<Cmd>BufferLineGoToBuffer 3<CR>', {noremap=true, silent=true})
map('n', '<leader>4',       '<Cmd>BufferLineGoToBuffer 4<CR>', {noremap=true, silent=true})
map('n', '<leader>5',       '<Cmd>BufferLineGoToBuffer 5<CR>', {noremap=true, silent=true})
map('n', '<leader>6',       '<Cmd>BufferLineGoToBuffer 6<CR>', {noremap=true, silent=true})
map('n', '<leader>7',       '<Cmd>BufferLineGoToBuffer 7<CR>', {noremap=true, silent=true})
map('n', '<leader>8',       '<Cmd>BufferLineGoToBuffer 8<CR>', {noremap=true, silent=true})
map('n', '<leader>9',       '<Cmd>BufferLineGoToBuffer 9<CR>', {noremap=true, silent=true})
map('n', '<leader>0',       '<Cmd>BufferLineGoToBuffer 10<CR>', {noremap=true, silent=true})

-- which key
map('n', '<leader>',        ":WhichKey '<Space>'<CR>", {silent = true})  -- open whichkey

-- TODO
