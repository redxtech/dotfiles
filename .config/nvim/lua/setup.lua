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

-- telescope native fzf
require("telescope").setup{}
require("telescope").load_extension('fzf')

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

-- toggleterm setup
require("toggleterm").setup {}

-- colourizer setup
require('colorizer').setup {}

-- fix eslint errors on save
-- autocmd BufWritePre <buffer> <cmd>EslintFixAll<CR>
-- vim.api.nvim_command('autocmd BufWritePre <buffer> <cmd>EslintFixAll<CR>')

