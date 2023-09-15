return {
	-- add yaml to treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			if type(opts.ensure_installed) == 'table' then
				vim.list_extend(opts.ensure_installed, { 'yaml' })
			end
		end,
	},

	-- setup lspconfig
	{
		'neovim/nvim-lspconfig',
		opts = {
			-- make sure mason installs the servers
			servers = {
				yamlls = {
					settings = {},
					on_attach = function(client, bufnr)
						-- wait 1 ms before checking to wait for the helm lsp to set the filetype
						vim.defer_fn(function()
							-- if the buffer is a helm file, detach the yamlls client
							if vim.bo[bufnr].filetype == 'helm' then
								vim.lsp.buf_detach_client(bufnr, client.id)
							end
						end, 1)
					end,
				},
				helm_ls = {},
			},
		},
	},

	-- helm plugin
	{ 'towolf/vim-helm', event = 'VeryLazy' },
}
