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
	-- ensure deno command is available
	-- {
	-- 	'williamboman/mason.nvim',
	-- 	opts = function(_, opts)
	-- 		table.insert(opts.ensure_installed, 'deno')
	-- 	end,
	-- },
	-- add deno formatter to null-ls
	-- {
	-- 	'jose-elias-alvarez/null-ls.nvim',
	-- 	opts = function(_, opts)
	-- 		local nls = require('null-ls')
	-- 		table.insert(opts.sources, nls.builtins.formatting.deno_fmt)
	-- 	end,
	-- },
}
