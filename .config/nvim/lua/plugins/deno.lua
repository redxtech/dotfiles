local nvim_lsp = require('lspconfig')

return {
	-- correctly setup lspconfig
	{
		'neovim/nvim-lspconfig',
		dependencies = { 'sigmasd/deno-nvim' },
		opts = {
			-- make sure mason installs the servers
			servers = {
				denols = {},
			},
			setup = {
				denols = function(_, opts)
					require('deno-nvim').setup({ server = opts })
					return true
				end,
			},
		},
	},
}
