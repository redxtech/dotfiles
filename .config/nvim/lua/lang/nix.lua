return {
	-- add nix to treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			if type(opts.ensure_installed) == 'table' then
				vim.list_extend(opts.ensure_installed, { 'nix' })
			end
		end,
	},

	-- setup lspconfig
	{
		'neovim/nvim-lspconfig',
		opts = {
			-- make sure mason installs the server
			servers = {
				nixd = {},
			},
		},
	},

	-- extra language support
	{
		'LnL7/vim-nix',
		event = 'VeryLazy',
	},
}
