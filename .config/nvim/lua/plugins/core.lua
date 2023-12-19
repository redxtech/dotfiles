return {
	{ 'dracula/vim', name = 'dracula', lazy = false, priority = 1000 },
	{
		'LazyVim/LazyVim',
		opts = {
			colorscheme = 'dracula',
		},
	},
	{
		'echasnovski/mini.comment',
		opts = {
			options = {
				ignore_blank_line = true,
			},
		},
	},
	{
		'HiPhish/rainbow-delimiters.nvim',
		opts = {
			highlight = {
				'DraculaPink',
				'DraculaGreen',
				'DraculaOrange',
				'DraculaBlue',
				-- 'DraculaRed',
				'DraculaViolet',
				'DraculaCyan',
				'DraculaYellow',

				-- 'RainbowDelimiterRed',
				-- 'RainbowDelimiterYellow',
				-- 'RainbowDelimiterBlue',
				-- 'RainbowDelimiterOrange',
				-- 'RainbowDelimiterGreen',
				-- 'RainbowDelimiterViolet',
				-- 'RainbowDelimiterCyan',
			},
		},
		config = function(_, opts)
			require('rainbow-delimiters.setup').setup(opts)
		end,
	},

	-- {
	-- 	'echasnovski/mini.surround',
	-- 	opts = {
	-- 		mappings = {
	-- 			add = 'sa', -- Add surrounding in Normal and Visual modes
	-- 			delete = 'sd', -- Delete surrounding
	-- 			find = 'sf', -- Find surrounding (to the right)
	-- 			find_left = 'sF', -- Find surrounding (to the left)
	-- 			highlight = 'sh', -- Highlight surrounding
	-- 			replace = 'sr', -- Replace surrounding
	-- 			update_n_lines = 'sn', -- Update `n_lines`

	-- 			suffix_last = 'l', -- Suffix to search with "prev" method
	-- 			suffix_next = 'n', -- Suffix to search with "next" method
	-- 		},
	-- 	},
	-- },
}
