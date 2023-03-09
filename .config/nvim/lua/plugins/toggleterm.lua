return {
	'akinsho/nvim-toggleterm.lua',
	event = 'VeryLazy',
	opts = { -- size can be a number or function which is passed the current terminal
		open_mapping = [[<c-\>]],
	},
	-- {
	-- 	'lukas-reineke/indent-blankline.nvim',
	-- 	opts = {
	-- 		char = '│',
	-- 		buftype_exclude = { 'terminal' },
	-- 		filetype_exclude = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy' },
	-- 		show_trailing_blankline_indent = false,
	-- 		show_current_context = false,
	-- 	},
	-- },
}
