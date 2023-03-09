return {
	{ 'tpope/vim-eunuch', event = 'VeryLazy' },
	{
		'rmagatti/goto-preview',
		opts = {
			default_mappings = true,
			-- resizing_mappings = true,
			references = {
				telescope = require('telescope.themes').get_dropdown({ hide_preview = false }),
			},
		},
	},
	{ 'andrewradev/tagalong.vim', event = 'VeryLazy' },
	-- { 'itspriddle/vim-shellcheck', event = 'VeryLazy', },
	-- { 'jparise/vim-graphql', event = 'VeryLazy', },
	-- { 'kovetskiy/sxhkd-vim', event = 'VeryLazy', },
	-- { 'tmux-plugins/vim-tmux', event = 'VeryLazy', },
}
