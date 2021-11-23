-- autocommands

-- highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- run packer compile when plugins.lua is saved
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]


-- resize split to 85%
-- vim.cmd [[
--   function! ResizeSplits()
--     set winwidth=85
--     wincmd =
--   endfunction
-- ]]

-- resize split to 85% on enter
-- vim.cmd [[
--   augroup ReduceNoise
--     autocmd!
--     " Automatically resize active split to 85 width
--     autocmd WinEnter * :call ResizeSplits()
--   augroup END
-- ]]
