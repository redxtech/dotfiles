return {
	'nvim-telescope/telescope-project.nvim',
	event = 'VeryLazy',
	keys = {
		{ '<C-p>', "<cmd>lua require('telescope').extensions.project.project({})<cr>" },
	},
	config = function()
		require('telescope').load_extension('project')
	end,
}
