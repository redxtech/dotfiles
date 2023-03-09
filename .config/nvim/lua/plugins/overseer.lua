return {
	'stevearc/overseer.nvim',
	event = 'VeryLazy',
	keys = {
		{ '<leader>ts', '<cmd>OverseerRun<cr>', { desc = 'Open task runner' } },
		{ '<leader>tt', '<cmd>OverseerToggle<cr>', { desc = 'Open task runner' } },
	},
	opts = {
		strategy = 'toggleterm',
	},
}
