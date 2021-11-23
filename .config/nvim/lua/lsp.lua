-- functions needed
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

-- setup nvim-cmp
local cmp = require('cmp')

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
		end,
	},
  mapping = {
    ['<C-b>']				= cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>']				= cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>']		= cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>']				= cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>']				= cmp.mapping({
      								i = cmp.mapping.abort(),
      								c = cmp.mapping.close(),
    								}),
    ['<CR>']				= cmp.mapping.confirm({ select = true }),
    ["<Tab>"]       = cmp.mapping(function(fallback)
                      if cmp.visible() then
                        cmp.select_next_item()
                      elseif vim.fn["vsnip#available"](1) == 1 then
                        feedkey("<Plug>(vsnip-expand-or-jump)", "")
                      elseif has_words_before() then
                        cmp.complete()
                      else
                        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
                      end
                    end, { "i", "s" }),

    ["<S-Tab>"]     = cmp.mapping(function()
                      if cmp.visible() then
                        cmp.select_prev_item()
                      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                        feedkey("<Plug>(vsnip-jump-prev)", "")
                      end
                    end, { "i", "s" }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  }),
	formatting = {
  	format = require("lspkind").cmp_format({
				with_text = true,
				menu = ({
      		buffer = "[Buffer]",
      		nvim_lsp = "[LSP]",
      		luasnip = "[LuaSnip]",
      		nvim_lua = "[Lua]",
      		latex_symbols = "[Latex]",
  			})
		}),
	},
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- set up lsp servers
local servers = { 'bashls',  'clangd', 'cmake', 'dockerls', 'eslint', 'pyright', 'tailwindcss', 'tsserver', 'vimls' }
for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    capabilities = capabilities
  }
end

