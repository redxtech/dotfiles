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
          '.direnv',
          '.devenv',
          'devenv.lock',
					'node_modules',
					'dist',
				},
				never_show = {
					'node_modules',
				},
			},
		},
	},
}
