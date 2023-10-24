return {
	-- copilot
	{
		'zbirenbaum/copilot.lua',
		cmd = 'Copilot',
		event = 'InsertEnter',
		build = ':Copilot auth',
		keys = {
			{ '<leader>cp', '<cmd>Copilot panel<cr>', desc = 'Open copilot panel' },
		},
		opts = {
			suggestion = {
				enabled = true,
				debounce = 50,
				auto_trigger = true,
				keymap = {},
			},
			panel = {
				enabled = true,
				auto_refresh = true,
				keymap = {
					jump_prev = '[[',
					jump_next = ']]',
					accept = '<CR>',
					refresh = 'gr',
				},
				layout = {
					position = 'right',
					ratio = 0.4,
				},
			},
			filetypes = {
				markdown = true,
				yaml = true,
			},
		},
	},

	-- lualine module
	{
		'nvim-lualine/lualine.nvim',
		optional = true,
		event = 'VeryLazy',
		opts = function(_, opts)
			local Util = require('lazyvim.util')
			local colors = {
				[''] = Util.ui.fg('Special'),
				['Normal'] = Util.ui.fg('Special'),
				['Warning'] = Util.ui.fg('DiagnosticError'),
				['InProgress'] = Util.ui.fg('DiagnosticWarn'),
			}
			table.insert(opts.sections.lualine_x, 2, {
				function()
					local icon = require('lazyvim.config').icons.kinds.Copilot
					local status = require('copilot.api').status.data
					return icon .. (status.message or '')
				end,
				cond = function()
					local ok, clients = pcall(vim.lsp.get_active_clients, { name = 'copilot', bufnr = 0 })
					return ok and #clients > 0
				end,
				color = function()
					if not package.loaded['copilot'] then
						return
					end
					local status = require('copilot.api').status.data
					return colors[status.status] or colors['']
				end,
			})
		end,
	},
}
