-- setup for plugins

-- treesitter setup
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  context_commentstring = {
    enable = true
  },
  matchup = {
    enable = true
  }
}

-- luasnip setup
-- require('luasnip.config.snippets')
require("luasnip/loaders/from_vscode").lazy_load()

-- telescope native fzf
require("telescope").setup{}
require("telescope").load_extension('fzf')
require('telescope').load_extension('projects')

-- set up bufferline
vim.opt.termguicolors = true
require("bufferline").setup {
  options = {
    numbers = "ordinal",
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "center"
      }
    }
  }
}

-- toggleterm setup
require("toggleterm").setup {}
function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- gitsigns setup
require('gitsigns').setup {
  yadm = {
    enable = true
  }
}

-- comment setup
require('Comment').setup({
  ignore = '^$'
})

-- nvim-tree setup
require('nvim-tree').setup({
  auto_close          = true,
  view = {
    auto_resize         = true
  }
})

-- project setup
vim.g.nvim_tree_respect_buf_cwd = 1
require("project_nvim").setup {
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true
  }
}

-- indent blankline setup
require("indent_blankline").setup {
  buftype_exclude = { "terminal" },
  filetype_exclude = { "startup" },
}

-- goto-preview setup
require('goto-preview').setup {
  default_mappings = true
}

-- autopairs setup
require('nvim-autopairs').setup {}

-- better escape setup
require("better_escape").setup {
  clear_empty_lines = true
}

-- neoscroll setup
require('neoscroll').setup {}

-- stabilize setup
require("stabilize").setup {}

-- colourizer setup
require('colorizer').setup {}

-- numb setup
require('numb').setup {}

-- nvim lastplace setup
require('nvim-lastplace').setup {}

-- todo comments setup
 require("todo-comments").setup {}

-- fix eslint errors on save
-- autocmd BufWritePre <buffer> <cmd>EslintFixAll<CR>
-- vim.api.nvim_command('autocmd BufWritePre <buffer> <cmd>EslintFixAll<CR>')

