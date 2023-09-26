return {
	-- treesitter & lspconfig taken care of by lazyvim plugins.extra.langs.python

	-- formatter
	{
		'psf/black',
		event = 'VeryLazy',
		ft = 'python',
		init = function()
			vim.g.black_linelength = 78
		end,
		keys = { { '<leader>bf', '<cmd>Black<cr>', desc = 'Format file' } },
	},
}
