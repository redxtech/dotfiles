-- install and configuure language servers automatically

local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
	'bashls',
	'denols',
	'eslint',
	'pyright',
  'sumneko_lua',
	'tsserver',
	'volar',
})

lsp.setup_nvim_cmp({
  sources = {
    -- default sources for lsp-zero
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'buffer', keyword_length = 2},
    {name = 'luasnip', keyword_length = 2},
  }
})

lsp.nvim_workspace({
	library = vim.api.nvim_get_runtime_file('', true)
})

-- configure language servers
local nvim_lsp = require('lspconfig')

-- make deno only work in deno projects
lsp.configure('denols', {
	root_dir = nvim_lsp.util.root_pattern('deno.json'),
	init_options = {
		lint = true
	}
})

-- make typescript only work in typescript projects
lsp.configure('tsserver', {
	root_dir = nvim_lsp.util.root_pattern('package.json'),
	init_options = {
		lint = true
	}
})

-- configure lua lsp to work with vim
lsp.configure('sumneko_lua', {
	settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.stdpath('config') .. '/lua'] = true,
        }
      }
    }
  }
})

-- manual cmp config
local cmp = require('cmp')

-- configure nvim-autopairs to work with completion
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

-- `/` cmdline setup.
cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})
-- `:` cmdline setup.
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	preselect = cmp.PreselectMode.None,
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{
			name = 'cmdline',
			option = {
				ignore_cmds = { 'Man', '!' }
			}
		}
	})
})

-- finally, run the lsp-zero setup function
lsp.setup()

