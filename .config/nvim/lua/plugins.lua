--  packer bootstrap
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.isdirectory(vim.fn.glob(install_path)) == 0 then
	Packer_bootstrap = vim.fn.system {'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path}
end

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'                     -- package manager

	use { 'dracula/vim', as = 'dracula' }            -- colourscheme
	use { 'catppuccin/nvim', as = 'catppuccin' }     -- colourscheme

	use 'andymass/vim-matchup'                       -- better matching with % key - language specific keywords, not just single chars
	use 'christoomey/vim-sort-motion'                -- sort lines (gs*)
	use 'famiu/bufdelete.nvim'                       -- better buffer deletion support
	use 'felipec/vim-sanegx'                         -- open link under cursor
	use 'ggandor/lightspeed.nvim'                    -- jump to place in file
	use 'glts/vim-textobj-comment'                   -- comment object (ac, ic, aC)
	use 'gpanders/editorconfig.nvim'                 -- editorconfig
	use 'itspriddle/vim-shellcheck'                  -- shell script validation
	use 'jghauser/mkdir.nvim'                        -- make new directory on save if it doesn't exist
	use 'joosepalviste/nvim-ts-context-commentstring'-- context based commentstring setting
	use 'junegunn/vim-easy-align'                    -- align on characters
	use 'kana/vim-textobj-entire'                    -- text object for entire buffer (ae, ie)
	use 'kana/vim-textobj-indent'                    -- text object for indent (ai, ii, aI, iI)
	use 'kana/vim-textobj-line'                      -- text object for line (al, il)
	use 'kana/vim-textobj-user'                      -- allow user defined text objects
	use 'kdheepak/lazygit.nvim'                      -- git client
	use 'kovetskiy/sxhkd-vim'                        -- syntax highlighting
	use 'liuchengxu/vim-which-key'                   -- show which keybinds are available
	use 'matze/vim-move'                             -- move selections
	use 'miyakogi/conoline.vim'                      -- highlight current line
	use 'monaqa/dial.nvim'                           -- increment works on other things too
	use 'nvim-telescope/telescope-ui-select.nvim'    -- telescope picker for vim.ui.select
	use 'nvim-lua/lsp-status.nvim'                   -- lsp status utility commands
	use 'onsails/lspkind-nvim'                       -- show icons for lsp type
	use 'rafamadriz/friendly-snippets'               -- snippet collection
	use 'romainl/vim-cool'                           -- auto :noh when moving away from search
	use 'tmux-plugins/vim-tmux'                      -- syntax highlighting
	use 'tpope/vim-dotenv'                           -- load dotenv file into vim
	use 'tpope/vim-endwise'                          -- pair do->end, if->fi, etc.
	use 'tpope/vim-eunuch'                           -- unix helpers
	use 'tpope/vim-jdaddy'                           -- json objects (aj), actions (gqaj: clean, gwaj, insert)
	use 'tpope/vim-repeat'                           -- <.> repeats plugin stuff too
	use 'tpope/vim-sensible'                         -- sensible defaults everyone can agree on
	use 'tpope/vim-surround'                         -- surround objects with stuff (cs<from><to>)
	use 'tpope/vim-unimpaired'                       -- navigate between pairs
	use 'tyru/open-browser.vim'                      -- allow opening browser

	use { -- buffer line
		'akinsho/bufferline.nvim',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function ()
			vim.opt.termguicolors = true
			require('bufferline').setup {
				options = {
					numbers = 'ordinal',
					diagnostics = 'nvim_lsp',
					offsets = {
						{
							filetype = 'NvimTree',
							text = 'File Explorer',
							highlight = 'Directory',
							text_align = 'center'
						}
					}
				}
			}
		end
	}
	use { -- toggleable terminal
		'akinsho/toggleterm.nvim',
		config = function()
			require('toggleterm').setup {
				open_mapping = [[<c-\>]],
				start_in_insert = true,
				insert_mappings = true,
				terminal_mappings = true,
				direction = 'float'
			}
		end
	}
	use {
		'andweeb/presence.nvim',
		config = function()
			require('presence'):setup({
				-- general options
				auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
				neovim_image_text   = 'The One True Text Editor', -- Text displayed when hovered over the Neovim image
				main_image          = 'neovim',                   -- Main image display (either 'neovim' or 'file')
				client_id           = '793271441293967371',       -- Use your own Discord application client id (not recommended)
				log_level           = nil,                        -- Log messages at or above this level (one of the following: 'debug', 'info', 'warn', 'error')
				debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
				enable_line_number  = false,                      -- Displays the current line number instead of the current project
				blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
				buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = '<label>', url = '<url>' }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
				file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
				show_time           = true,                       -- Show the timer

				-- rich presence text options
				editing_text        = 'editing %s',               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
				file_explorer_text  = 'browsing %s',              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
				git_commit_text     = 'committing changes',       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
				plugin_manager_text = 'managing plugins',         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
				reading_text        = 'reading %s',               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
				workspace_text      = 'working on %s',            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
				line_number_text    = 'line %s out of %s',        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
			})
		end
	}
	use { -- use as obsidian editor
		'epwalsh/obsidian.nvim',
		config = function() require('obsidian').setup {
			dir = '~/Documents/Obsidian/Main',
			use_advanced_uri = true,
			completion = {
				nvim_cmp = true
			}
		} end
	}
	use { -- reopen files in last used place
		'ethanholz/nvim-lastplace',
		config = function () require('nvim-lastplace').setup {} end
	}
	use { -- task runner
		'EthanJWright/vs-tasks.nvim',
		config = function()
			require('vstask').setup {
				terminal = 'toggleterm',
				autodetect = { -- auto load scripts
					npm = 'on'
				}
			}
		end
	}
	use { -- rename variables
		'filipdutescu/renamer.nvim',
		branch = 'master',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function () require('renamer').setup {} end
	}
	use { -- highlight special comments
		'folke/todo-comments.nvim',
		requires = 'nvim-lua/plenary.nvim',
		config = function() require('todo-comments').setup {} end
	}
	use {
		'folke/trouble.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function()
			require('trouble').setup {}
		end
	}
	use {
		'fymyte/rasi.vim',
		ft = 'rasi'
	}
	use {
		'goolord/alpha-nvim',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function ()
			local dashboard = require('alpha.themes.dashboard')
			local button = dashboard.button

			-- choose custom buttons
			dashboard.config.layout[4].val = {
				button('e', '  new file', '<cmd>ene <CR>'),
        button('SPC f f', '  find file'),
        button('SPC o f', '  recently opened files'),
				-- button('SPC f m', '  jump to bookmarks'),
        button('SPC l g', '  find word/live grep'),
        button('SPC G G', '  open git folders'),
        button('SPC r s', '  open session'),
				button('SPC s l', '  last session'),
				button('q', '  quit', '<cmd>q<CR>'),
			}

			require('alpha').setup(dashboard.config)
		end
	}
	use { -- lsp status notification thing
		'j-hui/fidget.nvim',
		config = function() require('fidget').setup {} end
	}
	use { -- show when code actions available under cursor
		'kosayoda/nvim-lightbulb',
		config = function ()
			require('nvim-lightbulb').setup {
				autocmd = {
					enabled = true
				}
			}
		end
	}
	use { -- file browser
		'kyazdani42/nvim-tree.lua',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function()
			require('nvim-tree').setup ({
				auto_reload_on_write = false,
				reload_on_bufenter = true,
				respect_buf_cwd = true,
				select_prompts = true,
				update_focused_file = {
					enable = true,
					update_cwd = true
				},
				view = {
					adaptive_size = true
				},
				log = {
					enable = true,
					truncate = true,
					types = {
						dev = true,
						diagnostics = true,
						watcher = true
					}
      	}
			})
		end
	}
	use { -- snippet engine
		'L3MON4D3/LuaSnip',
		config = function () require('luasnip/loaders/from_vscode').lazy_load() end
	}
	use { -- git signs
		'lewis6991/gitsigns.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('gitsigns').setup {
				yadm = {
					enable = true
				}
			}
		end
	}
	use { -- show indent guides
		'lukas-reineke/indent-blankline.nvim',
		config = function ()
			require('indent_blankline').setup {
				buftype_exclude = { 'terminal' },
				filetype_exclude = { 'alpha' },
			}
		end
	}
	use { -- stabilize buffer content on window open/close
		'luukvbaal/stabilize.nvim',
		config = function() require('stabilize').setup {} end
	}
	use { -- escape insert mode quickly
		'max397574/better-escape.nvim',
		config = function() require('better_escape').setup {
			clear_empty_lines = true
		} end,
	}
	-- TODO make this work, wasn't doing anything
	-- use { 'melkster/modicator.nvim',
	-- 	after = 'dracula', -- colorscheme
	-- 	setup = function()
	-- 		-- required for modicator to work
	-- 		vim.o.cursorline = true
	-- 		vim.o.number = true
	-- 		vim.o.termguicolors = true
	-- 	end,
	-- 	config = function() require('modicator').setup {} end
	-- }
	use { -- preview line before jump
		'nacro90/numb.nvim',
		config = function () require('numb').setup {} end
	}
	use { -- commenting plugin (gc* = line, gb* = block)
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup {
				ignore = '^$'
			}
		end
	}
	use { -- highlight hex colours with their colour
		'NvChad/nvim-colorizer.lua',
		config = function() require('colorizer').setup {} end
	}
	use { -- fzf for telescope
		'nvim-telescope/telescope-fzf-native.nvim',
		run = 'make'
	}
	use { -- statusline
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function()
			require('lualine').setup {
				options = {
					theme = 'dracula',
					globalstatus = true
				},
				sections = {
					lualine_a = { 'mode' },
					lualine_b = { 'branch' },
					lualine_c = { 'filename' },
					lualine_x = { 'diagnostics', 'diff', 'require(\'lsp-status\').status()' },
					lualine_y = { 'filetype', 'encoding', 'fileformat', 'filesize', 'progress' },
					lualine_z = {'location' }
				},
				extensions = { 'fugitive', 'nvim-tree', 'toggleterm' }
			}
		end
	}
	use {
		'nvim-pack/nvim-spectre',
		config = function ()
			require("spectre").setup {
				live_update = true,
				is_insert_mode = false
			}
		end
	}
	use { -- telescope selector thing
		'nvim-telescope/telescope.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function ()
			require('telescope').setup {
				extensions = {
					['ui-select'] = {require('telescope.themes').get_dropdown {}}
				},
				pickers = {
					live_grep = {
						additional_args = {"--hidden"}
					}
				}
			}
			require('telescope').load_extension('fzf')
			require('telescope').load_extension('lazygit')
			require('telescope').load_extension('notify')
			require('telescope').load_extension('ui-select')
		end
	}
	use { -- better syntax highlighting
		'nvim-treesitter/nvim-treesitter',
		config = function ()
			require('nvim-treesitter.configs').setup {
				ensure_installed = 'all',
				sync_install = false,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				context_commentstring = {
					enable = true
				},
				matchup = {
					enable = true
				}
			}
		end
	}
	use {
		'nvim-treesitter/nvim-treesitter-context',
		config = function () require'treesitter-context'.setup {} end
	}
	use { -- shows function signature
		'ray-x/lsp_signature.nvim',
		config = function() require('lsp_signature').setup {
			bind = true, -- This is mandatory, otherwise border config won't get registered.
			handler_opts = {
				border = 'rounded'
			}
		} end
	}
	use { -- notifications !
		'rcarriga/nvim-notify',
		config = function() vim.notify = require('notify') end
	}
	use { -- show preview of definition
		'rmagatti/goto-preview',
		config = function ()
			require('goto-preview').setup {
				default_mappings = true
			}
		end
	}
	use { -- session management
		'shatur/neovim-session-manager',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('session_manager').setup {
				autoload_mode = require('session_manager.config').AutoloadMode.Disabled,
				autosave_only_in_session = true, -- always autosaves session. if true, only autosaves after a session is active.
			}
		end
	}
	use {
		'sudormrfbin/cheatsheet.nvim',
		requires = {
			{'nvim-telescope/telescope.nvim'},
			{'nvim-lua/popup.nvim'},
			{'nvim-lua/plenary.nvim'},
		}
	}
	use {
		'weilbith/nvim-code-action-menu',
		cmd = 'CodeActionMenu'
	}
	use { -- autopairs
		'windwp/nvim-autopairs',
		config = function () require('nvim-autopairs').setup {} end
	}

	-- lsp
	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- lsp support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-cmdline'},
			{'hrsh7th/cmp-path'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},
			{'ray-x/cmp-treesitter'},
			{'saadparwaiz1/cmp_luasnip'},

			-- snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'}
		}
	}

	-- unused plugins
	-- use 'christoomey/vim-tmux-navigator'           -- navigate tmux panes
	-- use 'christoomey/vim-tmux-runner'              -- navigate tmux panes
	-- use 'dense-analysis/ale'                       -- async lint engine
	-- use 'fvictorio/vim-textobj-backticks'          -- backtick object (a`, i`)
	-- use 'honza/vim-snippets'                       -- snippets
	-- use 'posva/vim-vue'                            -- vim vue
	-- use 'prettier/vim-prettier'                    -- formatting
	-- use 'sheerun/vim-polyglot'                     -- syntax highlighting for many langs
	-- use 'simrat39/symbols-outline.nvim'            -- code outline sidebar (BROKEN in nvim 0.7)
	-- use 'tpope/vim-dispatch'                       -- compile wrapper (:Make)
	-- use 'tpope/vim-obsession'                      -- session management
	-- use 'tpope/vim-sleuth'                         -- autodetect indents
	-- use 'tpope/vim-speeddating'                    -- ctrl+(a/x) works properly on dates and times
	-- use 'tpope/vim-tbone'                          -- run tmux commands through vim

	-- if just bootstrapped, run sync
	if Packer_bootstrap then
		require('packer').sync()
	end
end)

