--  packer bootstrap
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	Packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
	vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function()
	use 'wbthomason/packer.nvim'			-- package manager


	-- oob plugins
	use {'dracula/vim', as = 'dracula'}		-- colourscheme
	use {'catppuccin/nvim', as = 'catppuccin'} -- colourscheme
	use 'dylanaraps/wal.vim'			-- pywal colourscheme

	use 'andymass/vim-matchup'			-- better matching with % key - language specific keywords, not just single chars
	use 'christoomey/vim-sort-motion'		-- sort lines (gs*)
	use 'famiu/bufdelete.nvim'			-- better buffer deletion support
	use 'felipec/vim-sanegx'			-- open link under cursor
	use 'ggandor/lightspeed.nvim'			-- jump to place in file
	use 'gpanders/editorconfig.nvim' -- editorconfig
	use 'glts/vim-textobj-comment'			-- comment object (ac, ic, aC)
	use 'itspriddle/vim-shellcheck'			-- shell script validation
	use 'JoosepAlviste/nvim-ts-context-commentstring' -- context based commentstring setting
	use 'kana/vim-textobj-entire'			-- text object for entire buffer (ae, ie)
	use 'kana/vim-textobj-indent'			-- text object for indent (ai, ii, aI, iI)
	use 'kana/vim-textobj-line'			-- text object for line (al, il)
	use 'kana/vim-textobj-user'			-- allow user defined text objects
	use 'kovetskiy/sxhkd-vim'			-- syntax highlighting
	use 'liuchengxu/vim-which-key'			-- show which keybinds are available
	use 'matze/vim-move'				-- move selections
	use 'miyakogi/conoline.vim'			-- highlight current line
	use 'monaqa/dial.nvim'				-- increment works on other things too
	use 'onsails/lspkind-nvim'			-- show icons for lsp type
	use 'romainl/vim-cool' -- auto :noh when moving away from search
	use 'tmux-plugins/vim-tmux'			-- syntax highlighting
	use 'tpope/vim-dotenv'				-- load dotenv file into vim
	use 'tpope/vim-endwise'				-- pair do->end, if->fi, etc.
	use 'tpope/vim-eunuch'				-- unix helpers
	use 'tpope/vim-jdaddy'				-- json objects (aj), actions (gqaj: clean, gwaj, insert)
	use 'tpope/vim-repeat'				-- <.> repeats plugin stuff too
	use 'tpope/vim-sensible'			-- sensible defaults everyone can agree on
	use 'tpope/vim-sleuth'				-- autodetect indents
	use 'tpope/vim-surround'			-- surround objects with stuff (cs<from><to>)
	use 'tpope/vim-unimpaired'			-- navigate between pairs
	use 'tyru/open-browser.vim'			-- allow opening browser
	use 'vim-airline/vim-airline'			-- statusline
	use 'vim-airline/vim-airline-themes'		-- statusline themes

	-- inline setup
	use {	-- project management
		'ahmedkhalf/project.nvim',
		config = function() require('project_nvim').setup {} end
	}
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
	use {	-- toggleable terminal
		'akinsho/toggleterm.nvim',
		config = function ()
			require('toggleterm').setup {}
			function _G.set_terminal_keymaps()
				local opts = {noremap = true}
				vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
				vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
				vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
				vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
				vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
				vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
			end
			vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
		end
	}
	use {	-- reopen files in last used place
		'ethanholz/nvim-lastplace',
		config = function () require('nvim-lastplace').setup {} end
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
	use {	-- fzf but lua
		'ibhagwan/fzf-lua',
		requires = { 'kyazdani42/nvim-web-devicons' }
	}
	use({
		'jose-elias-alvarez/null-ls.nvim',
		requires = { 'neovim/nvim-lspconfig', 'nvim-lua/plenary.nvim' },
		config = function()
			local null_ls = require('null-ls')
			null_ls.setup({
					sources = {
						-- code actions
						-- null_ls.builtins.code_actions.eslint -- linter
						-- null_ls.builtins.code_actions.xo, -- nice linter

						-- completions
						-- null_ls.builtins.completion.luasnip, -- snippet engine
						null_ls.builtins.completion.spell, -- spelling mistakes
						-- null_ls.builtins.completion.tags, -- tags

						-- diagnostics
						-- null_ls.builtins.diagnostics.alex
						-- null_ls.builtins.diagnostics.codespell.with({
						-- 		args = { '--builtin', 'clear,rare,code', '-' },
						-- }),
						-- null_ls.builtins.diagnostics.eslint, -- js linter
						-- null_ls.builtins.diagnostics.flake8, -- python
						null_ls.builtins.diagnostics.markdownlint, -- markdown
						-- null_ls.builtins.diagnostics.pylint, -- python
						null_ls.builtins.diagnostics.shellcheck, -- shell scripts
						-- null_ls.builtins.diagnostics.standardjs, -- js standard style
						-- null_ls.builtins.diagnostics.xo, -- nice linter

						-- formatting
						null_ls.builtins.formatting.codespell, -- common code misspellings
						null_ls.builtins.formatting.deno_fmt, -- deno
						-- null_ls.builtins.formatting.eslint, -- js linter
						null_ls.builtins.formatting.markdownlint, -- markdown
						-- null_ls.builtins.formatting.nginx_beautifier, -- nginx
						-- null_ls.builtins.formatting.prettier, -- js yaml html markdown
						-- null_ls.builtins.formatting.prettier_standard,
						null_ls.builtins.formatting.rustfmt, -- rust
						-- null_ls.builtins.formatting.rustywind, -- tailwind classes
						null_ls.builtins.formatting.shellharden, -- harden shell scripts
						-- null_ls.builtins.formatting.standardjs, -- js standard style
						-- null_ls.builtins.formatting.prettier_standard,
						null_ls.builtins.formatting.stylua,

					},
					on_attach = function()
						vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
					end,
				})
		end,
	})
	use { -- file browser
		'kyazdani42/nvim-tree.lua',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function()
			vim.g.nvim_tree_respect_buf_cwd = 1
			require('nvim-tree').setup ({
				update_cwd = true,
				update_focused_file = {
					enable = true,
					undate_cwd = true
				},
				view = {
					auto_resize = true
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
				filetype_exclude = { 'startup' },
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
	use { -- dim unused functions & variables
		'narutoxy/dim.lua',
		requires = { 'nvim-treesitter/nvim-treesitter', 'neovim/nvim-lspconfig' },
		config = function() require('dim').setup {} end
	}
	use { -- preview line before jump
		'nacro90/numb.nvim',
		config = function () require('numb').setup {} end
	}
	use { -- highlight hex colours with their colour
		'norcalli/nvim-colorizer.lua',
		config = function () require('colorizer').setup {} end
	}
	use {	-- commenting plugin
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup {
				ignore = '^$'
			}
		end
	}
	use { -- fzf for telescope
		-- 'nvim-telescope/telescope-fzf-native.nvim',
		-- 'nvim-telescope/telescope-fzy-native.nvim',
		'natecraddock/telescope-zf-native.nvim',
		-- run = 'make'
	}
	use { -- telescope selector thing
		'nvim-telescope/telescope.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function ()
			require('telescope').setup {}
			-- require('telescope').load_extension('fzf')
			-- require('telescope').load_extension('fzy_native')
			require('telescope').load_extension('zf-native')
			require('telescope').load_extension('projects')
		end
	}
	use {	-- better syntax highlighting
		'nvim-treesitter/nvim-treesitter',
		config = function ()
			require('nvim-treesitter.configs').setup {
				ensure_installed = 'maintained',
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
	use {	-- show preview of definition
		'rmagatti/goto-preview',
		config = function ()
			require('goto-preview').setup {
				default_mappings = true
			}
		end
	}
	use { -- startup page
		'startup-nvim/startup.nvim',
		requires = {'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim'},
		config = function()
			require('startup').setup {
				theme = 'dashboard'
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
	use { -- dim inactive windows
		'sunjon/shade.nvim',
		config = function ()
			require'shade'.setup {
					overlay_opacity = 60,
					opacity_step = 5,
					keys = {
						brightness_up    = '<C-Up>',
						brightness_down  = '<C-Down>',
						toggle           = '<Leader>ds'
					}
				}
		end
	}
	use {	-- autopairs
		'windwp/nvim-autopairs',
		config = function () require('nvim-autopairs').setup {} end
	}

	-- lsp plugins
	use 'hrsh7th/cmp-buffer'			-- buffer source for nvim-cmp
	use 'hrsh7th/cmp-cmdline'			-- cmdline source for nvim-cmp
	use 'hrsh7th/cmp-nvim-lsp'			-- lsp integration for nvim-cmp
	use 'hrsh7th/cmp-nvim-lua'			-- source for nvim lua api
	use 'hrsh7th/cmp-path'				-- path source for nvim-cmp
	use 'hrsh7th/nvim-cmp'				-- autocompete for nvim
	use 'neovim/nvim-lspconfig'			-- LSP plugin
	use 'quangnguyen30192/cmp-nvim-tags'		-- tags completion for cmp
	use 'ray-x/cmp-treesitter'			-- treesitter completion source
	use 'ray-x/lsp_signature.nvim'			-- shows function signature
	use 'saadparwaiz1/cmp_luasnip'			-- luasnip cmp source

	-- unused plugins
	-- use 'christoomey/vim-tmux-navigator'		-- navigate tmux panes
	-- use 'christoomey/vim-tmux-runner'		-- navigate tmux panes
	-- use 'dense-analysis/ale'			-- async lint engine
	-- use 'fvictorio/vim-textobj-backticks'	-- backtick object (a`, i`)
	-- use 'honza/vim-snippets'			-- snippets
	-- use 'junegunn/vim-easy-align'			-- align on characters
	-- use 'posva/vim-vue'							-- vim vue
	-- use 'prettier/vim-prettier'			-- formatting
	-- use 'rafamadriz/friendly-snippets'		-- snippet collection
	-- use 'sheerun/vim-polyglot'			-- syntax highlighting for many langs
	-- use 'simrat39/symbols-outline.nvim'		-- code outline sidebar (BROKEN in nvim 0.7)
	-- use 'terryma/vim-expand-region'			-- expand selection based on text objects
	-- use 'tpope/vim-dispatch'			-- compile wrapper (:Make)
	-- use 'tpope/vim-obsession'			-- session management
	-- use 'tpope/vim-speeddating'			-- ctrl+(a/x) works properly on dates and times
	-- use 'tpope/vim-tbone'			-- run tmux commands through vim
	-- use 'tpope/vim-vinegar'				-- extra tools for working with netrw
	-- use 'williamboman/nvim-lsp-installer'		-- auto install language servers
	-- use 'yegappan/mru'				-- most recently used files

	-- if just bootstrapped, run sync
	if Packer_bootstrap then
    require('packer').sync()
  end
end)

