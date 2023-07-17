return {
	-- edgy
	{
		'folke/edgy.nvim',
		opts = {
			left = {
				{
					title = 'Neo-Tree Git',
					ft = 'neo-tree',
					filter = function(buf)
						return vim.b[buf].neo_tree_source == 'git_status'
					end,
					pinned = false,
					open = 'Neotree position=right git_status',
				},
				{
					title = 'Neo-Tree Buffers',
					ft = 'neo-tree',
					filter = function(buf)
						return vim.b[buf].neo_tree_source == 'buffers'
					end,
					pinned = false,
					open = 'Neotree position=top buffers',
				},
				'neo-tree',
			},
			bottom = {
				{
					ft = 'toggleterm',
					size = { height = 0.3 },
					filter = function(buf, win)
						return vim.api.nvim_win_get_config(win).relative == ''
					end,
				},
			},
		},
	},
}
