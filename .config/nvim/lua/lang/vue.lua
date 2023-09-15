return {
	-- add vue to treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			if type(opts.ensure_installed) == 'table' then
				vim.list_extend(opts.ensure_installed, { 'vue', 'tsx' })
			end
		end,
	},

	-- setup lspconfig
	{
		'neovim/nvim-lspconfig',
		opts = {
			-- make sure mason installs the server
			servers = {
				volar = {},
			},
		},
	},
}
