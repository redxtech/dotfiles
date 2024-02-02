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
		'NeogitOrg/neogit',
		dependencies = {
			'nvim-lua/plenary.nvim', -- required
			'sindrets/diffview.nvim', -- optional - Diff integration
			'nvim-telescope/telescope.nvim', -- optional
		},
		keys = {
			{ '<leader>gg', '<cmd>Neogit kind=auto<cr>', desc = 'Open repo' },
			{ '<leader>gc', '<cmd>Neogit commit kind=auto<cr>', desc = 'Open commit popup' },
		},
		config = true,
	},
	{
		'sindrets/diffview.nvim',
		keys = {
			{ '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'View diff' },
		},
		config = true,
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
