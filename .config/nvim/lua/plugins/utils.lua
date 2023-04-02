return {
	{ 'andrewradev/tagalong.vim', event = 'VeryLazy' },
	{ 'amadeus/vim-convert-color-to', event = 'VeryLazy' },
	{ 'ellisonleao/glow.nvim', opts = {}, cmd = 'Glow' },
	{ 'tpope/vim-eunuch', event = 'VeryLazy' },
	{ 'tpope/vim-endwise', event = 'VeryLazy' },
	{ 'kovetskiy/sxhkd-vim', event = 'VeryLazy' },
	{ 'waycrate/swhkd-vim', event = 'VeryLazy' },
	{ 'theRealCarneiro/hyprland-vim-syntax', event = 'VeryLazy' },
	{ 'nacro90/numb.nvim', opts = {}, event = 'VeryLazy' },
	{ 'max397574/better-escape.nvim', opts = {}, event = 'VeryLazy' },
	{
		'rmagatti/goto-preview',
		event = 'VeryLazy',
		opts = {
			default_mappings = true,
			-- resizing_mappings = true,
			references = {
				telescope = require('telescope.themes').get_dropdown({ hide_preview = false }),
			},
		},
	},
	{
		'kosayoda/nvim-lightbulb',
		event = 'BufReadPost',
		opts = {
			autocmd = {
				enabled = true,
			},
		},
	},
	-- { 'edluffy/hologram.nvim', opts = { auto_display = true }, event = 'VeryLazy' },
	-- { 'itspriddle/vim-shellcheck', event = 'VeryLazy', },
	-- { 'jparise/vim-graphql', event = 'VeryLazy', },
	-- { 'tmux-plugins/vim-tmux', event = 'VeryLazy', },
	-- {
	--   'monaqa/dial.nvim',
	--   keys = {
	--     { '<C-a>', '<cmd>lua require("dial.map").inc_normal()<cr>', { desc = 'Increment', noremap = true } },
	--     { '<C-x>', '<cmd>lua require("dial.map").dec_normal()<cr>', { desc = 'Decrement', noremap = true } },
	--     { '<C-a>', '<cmd>lua require("dial.map").inc_visual()<cr>', { desc = 'Increment', noremap = true, mode = 'v' } },
	--     { '<C-x>', '<cmd>lua require("dial.map").dec_visual()<cr>', { desc = 'Decrement', noremap = true }, mode = 'v' },
	--     {
	--       'g<C-a>',
	--       '<cmd>lua require("dial.map").inc_gvisual()<cr>',
	--       { desc = 'Increment', noremap = true, mode = 'v' },
	--     },
	--     {
	--       'g<C-x>',
	--       '<cmd>lua require("dial.map").dec_gvisual()<cr>',
	--       { desc = 'Decrement', noremap = true },
	--       mode = 'v',
	--     },
	--   },
	-- },
}
