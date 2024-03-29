return {
	{
		'Mofiqul/dracula.nvim',
		lazy = false,
		priority = 1000,
		opts = {
			show_end_of_buffer = true,
			transparent_bg = true,
			italic_comment = true,
			lualine_bg_color = '#44475a',
			overrides = function(colors)
				return {
					Normal = { bg = colors.bg },
					NotifyBackground = { bg = colors.bg },
					NeogitDiffAdd = { fg = colors.green, bg = '#003A00' },
					NeogitDiffAddHighlight = { fg = colors.bright_green, bg = '#003A00' },
					DiffviewDiffAdd = { fg = colors.green, bg = '#003A00' },
				}
			end,
		},
	},
	{
		'LazyVim/LazyVim',
		opts = {
			colorscheme = 'dracula',
		},
	},
	{
		'nvim-lualine/lualine.nvim',
		opts = {
			options = {
				theme = 'dracula-nvim',
			},
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
		'folke/flash.nvim',
		-- 'ggandor/flit.nvim',
		enabled = false,
	},
	{
		'ahmedkhalf/project.nvim',
		opts = {
			manual_mode = false,
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
