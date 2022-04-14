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

-- simple maps
map('n', ';',               ':')                  -- easier command
map('n', '<C-w>',           'daw')                -- delete word

map('n', '<leader>fs',      ':w<CR>')             -- write file
map('n', '<leader>fS',      ':SudoWrite<CR>')     -- write file
map('n', '<leader>y',       '"+y')                -- yank to system clip
map('n', '<leader>p',       '"+p')                -- paste from system clip
map('n', '<C-h>',           '<C-w>h')             -- navigate windows (left)
map('n', '<C-j>',           '<C-w>j')             -- navigate windows (down)
map('n', '<C-k>',           '<C-w>k')             -- navigate windows (up)
map('n', '<C-l>',           '<C-w>l')             -- navigate windows (right)
map('n', '<leader>sv',      ':vsplit<CR>')        -- vertical split
map('n', '<leader>sg',      ':split<CR>')         -- horizontal split
map('n', '<leader>sa',      ':%s//g<left><left>', {noremap=false}) -- replace all
map('n', '<leader>cl',      'gcc', {noremap=false})                             -- toggle comment
map('v', '<leader>cl',      'gc', {noremap=false})                              -- toggle comment (visual mode)
map('n', '<leader>ts',      ':setlocal spell! spelllang=en_us<CR>')             -- toggle spellcheck
map('n', '<leader>ss',      ':wa<CR>:mksession! $HOME/.cache/nvim/sessions/')   -- save session
map('n', '<leader>rs',      ':wa<CR>:source $HOME/.cache/nvim/sessions/')       -- restore session

-- renamer
map('n', '<leader>rn',      '<cmd>lua require("renamer").rename()<CR>', {silent=true})
map('v', '<leader>rn',      '<cmd>lua require("renamer").rename()<CR>', {silent=true})
map('i', '<F2>',            '<cmd>lua require("renamer").rename()<CR>', {silent=true})

map('v', '<leader>cc',       ':OSCYank<CR>')   -- yank over ssh
-- indent lines better
-- vnoremap < <gv
-- vnoremap > >gv

map('x', 'ga',              '<Plug>(EasyAlign)', {noremap=false})
map('n', 'ga',              '<Plug>(EasyAlign)', {noremap=false})

-- buffer binds
map('n', '<leader>qq',      ':q<CR>')                         -- close buffer
map('n', '<leader>qQ',      ':q!<CR>')                        -- close buffer (force)
map('n', '<leader>bd',      '<cmd>Bdelete<CR>')               -- close current buffer without closing window
map('n', '<leader>bD',      '<cmd>Bdelete!<CR>')              -- close current buffer without closing window (force)
map('n', '<leader><space>', '<cmd>Telescope buffers<CR>')     -- find buffer

-- misc general binds
map('n', '<leader>h',       ':noh<CR>')           -- remove highlight
map('n', '<leader>tt',       '<cmd>ToggleTerm<CR>')           -- remove highlight
map('n', '<leader>so',       '<cmd>SymbolsOutline<CR>')           -- remove highlight

-- nvim tree binds
map('n', '<C-n>',           '<cmd>NvimTreeToggle<CR>')    -- open nvim tree
map('n', '<leader>r',       '<cmd>NvimTreeRefresh<CR>')   -- refresh nvim tree
map('n', '<leader>n',       '<cmd>NvimTreeFindFile<CR>')  -- nvim tree find file

-- telescope binds
map('n', '<leader>ff',      '<cmd>Telescope find_files<CR>')    -- find files
map('n', '<leader>fg',      '<cmd>Telescope git_files<CR>')     -- find git files
map('n', '<leader>fh',      '<cmd>Telescope help_tags<CR>')     -- search help tags
map('n', '<leader>lg',      '<cmd>Telescope live_grep<CR>')     -- live live_grep
map('n', '<leader>op',      '<cmd>Telescope projects<CR>')      -- find project
map('n', '<leader>cs',      '<cmd>Telescope colorscheme<CR>')   -- change colourscheme
map('n', '<leader>of',      '<cmd>Telescope oldfiles<CR>')      -- recent files
map('n', '<leader>?',       '<cmd>:Cheatsheet<CR>')             -- recent files

-- trouble binds
map('n', '<leader>xx',		'<cmd>Trouble<cr>')
map('n', '<leader>xw',		'<cmd>Trouble workspace_diagnostics<cr>')
map('n', '<leader>xd',		'<cmd>Trouble document_diagnostics<cr>')
map('n', '<leader>xl',		'<cmd>Trouble loclist<cr>')
map('n', '<leader>xq',		'<cmd>Trouble quickfix<cr>')
map('n', 'gR',				'<cmd>Trouble lsp_references<cr>')

-- packer binds
map('n', '<leader>ps',      '<cmd>PackerSync<CR>')    -- sync packages
map('n', '<leader>pu',      '<cmd>PackerUpdate<CR>')    -- sync packages
map('n', '<leader>pc',      '<cmd>PackerCompile<CR>')    -- sync packages

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
