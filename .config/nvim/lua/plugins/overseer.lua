return {
	'stevearc/overseer.nvim',
	event = 'VeryLazy',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'stevearc/dressing.nvim',
    'akinsho/nvim-toggleterm.lua',
  },
	keys = {
		{ '<leader>ts', '<cmd>OverseerRun<cr>', { desc = 'Open task runner' } },
		{ '<leader>tt', '<cmd>OverseerToggle<cr>', { desc = 'Open task runner' } },
	},
	opts = {
		strategy = 'toggleterm',
	},
}
