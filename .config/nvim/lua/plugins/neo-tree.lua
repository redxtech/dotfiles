return {
	'nvim-neo-tree/neo-tree.nvim',
	opts = {
		sort_case_insensitive = true,
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = false,
				hide_by_name = {
					'.git',
					'.github',
					'node_modules',
				},
				never_show = {
					'node_modules',
				},
			},
			bind_to_cwd = false,
			follow_current_file = true,
		},
	},
}
