return {
	{
		'pwntester/octo.nvim',
		-- event = 'VeryLazy',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope.nvim',
			'nvim-tree/nvim-web-devicons',
		},
		opts = {},
		keys = {
			{ '<leader>gr', '<cmd>Octo repo view<cr>', desc = 'Open repo' },
		},
	},
	{
		'f-person/git-blame.nvim',
		event = 'VeryLazy',
		init = function()
			vim.g.gitblame_enabled = 0
			vim.g.gitblame_virtual_text_column = 80
		end,
		keys = {
			{ '<leader>gb', '<cmd>GitBlameToggle<cr>', desc = 'Blame line' },
			{ '<leader>go', '<cmd>GitBlameOpenCommitURL<cr>', desc = 'Open line commit' },
		},
	},
}
