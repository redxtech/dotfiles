-- packer bootstrap
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
	use 'wbthomason/packer.nvim'							-- package manager
	use {'dracula/vim', as = 'dracula'}				-- colourscheme
	use 'dylanaraps/wal.vim'									-- pywal colourscheme

	-- use 'christoomey/vim-tmux-navigator'			-- navigate tmux panes
	-- use 'christoomey/vim-tmux-runner'					-- navigate tmux panes
	-- use 'fvictorio/vim-textobj-backticks'			-- backtick object (a`, i`)
	-- use 'honza/vim-snippets'									-- snippets
	-- use 'tpope/vim-tbone'											-- run tmux commands through vim

	use 'L3MON4D3/LuaSnip'										-- snippet engine
	use 'ahmedkhalf/project.nvim'							-- project management
	use 'akinsho/toggleterm.nvim'							-- toggleable terminal
	use 'andymass/vim-matchup'								-- better matching wiht % key
	use 'christoomey/vim-sort-motion'					-- sort lines (gs*)
	use 'dense-analysis/ale'									-- async lint engine
	use 'editorconfig/editorconfig-vim'				-- editorconfig support
	use 'ethanholz/nvim-lastplace'						-- reopen files in last used place
	use 'famiu/bufdelete.nvim'								-- better buffer deletion support
	use 'felipec/vim-sanegx'									-- open link under cursor
	use 'folke/lsp-colors.nvim'								-- give lsp colours to unsuported themes
	use 'folke/todo-comments.nvim'						-- higlight special comments
	use 'glepnir/dashboard-nvim'							-- dashboard startup screen
	use 'glts/vim-textobj-comment'						-- comment object (ac, ic, aC)
	use 'hrsh7th/cmp-buffer'									-- buffer source for nvim-cmp
	use 'hrsh7th/cmp-cmdline'									-- cmdline source for nvim-cmp
	use 'hrsh7th/cmp-nvim-lsp'								-- lsp integration for nvim-cmp
	use 'hrsh7th/cmp-nvim-lua'								-- source for nvim lua api
	use 'hrsh7th/cmp-path'										-- path source for nvim-cmp
	use 'hrsh7th/nvim-cmp'										-- autocompete for nvim
	use 'itspriddle/vim-shellcheck'						-- shell script validation
	use 'junegunn/fzf.vim'										-- configure fzf
	use 'kana/vim-textobj-entire'							-- text object for entire buffer (ae, ie)
	use 'kana/vim-textobj-indent'							-- text object for indent (ai, ii, aI, iI)
	use 'kana/vim-textobj-line'								-- text object for line (al, il)
	use 'kana/vim-textobj-user'								-- allow user defined text objects
	use 'karb94/neoscroll.nvim'								-- smooth scrolling
	use 'kovetskiy/sxhkd-vim'									-- syntax highlighting
	use 'kyazdani42/nvim-tree.lua'						-- file browser
	use 'lewis6991/gitsigns.nvim'							-- git signs
	use 'liuchengxu/vim-which-key'						-- show which keybinds are available
	use 'ludovicchabant/vim-gutentags'				-- auto manage tags
	use 'lukas-reineke/indent-blankline.nvim'	-- show indent guides
	use 'luukvbaal/stabilize.nvim'						-- stabilize buffer content on window open/close
	use 'mattn/vim-gist'											-- post buffer as gist
	use 'matze/vim-move'											-- move selections
	use 'max397574/better-escape.nvim'				-- escape insert mode quickly
	use 'maxbrunsfeld/vim-yankstack'					-- yank stack cycling
	use 'miyakogi/conoline.vim'								-- highlight current line
	use 'nacro90/numb.nvim'										-- preview line before jump
	use 'neovim/nvim-lspconfig'								-- LSP plugin
	use 'norcalli/nvim-colorizer.lua'					-- highlight hex colours with their colour
	use 'numToStr/Comment.nvim'								-- commenting plugin
	use 'nvim-treesitter/nvim-treesitter' 		-- better syntax highlighting
	use 'onsails/lspkind-nvim'								-- show icons for lsp type
	use 'quangnguyen30192/cmp-nvim-tags'			-- tags completion for cmp
	use 'rafamadriz/friendly-snippets'				-- snippet collection
	use 'ray-x/cmp-treesitter'								-- treesitter completion source
	use 'ray-x/lsp_signature.nvim'						-- shows funciton signature
	use 'rmagatti/goto-preview'								-- show preview of definition
	use 'saadparwaiz1/cmp_luasnip'						-- luasnip cmp source
	use 'sheerun/vim-polyglot'								-- syntax highlighting for many langs
	use 'simrat39/symbols-outline.nvim'				-- code outline sidebar
	use 'terryma/vim-expand-region'           -- expand selection based on text objects
	use 'tmux-plugins/vim-tmux'								-- syntax highlighting
	use 'tpope/vim-dispatch'									-- compile wrapper (:Make)
	use 'tpope/vim-dotenv'										-- load dotenv file into vim
	use 'tpope/vim-endwise'										-- pair do->end, if->fi, etc.
	use 'tpope/vim-eunuch'										-- unix helpers
	use 'tpope/vim-jdaddy'										-- json objects (aj), actions (gqaj: clean, gwaj, insert)
	use 'tpope/vim-obsession'									-- session management
	use 'tpope/vim-repeat'										-- <.> repeats plugin stuff too
	use 'tpope/vim-sensible'									-- sensible defaults everyone can agree on
	use 'tpope/vim-sleuth'										-- autodetect indents
	use 'tpope/vim-speeddating'								-- ctrl+(a/x) works properly on dates and times
	use 'tpope/vim-surround'									-- surround objects with stuff (cs<from><to>)
	use 'tpope/vim-unimpaired'								-- navigate between pairs
	use 'tpope/vim-vinegar'										-- extra tools for working with netrw
	use 'tyru/open-browser.vim'								-- allow opening browser
	use 'vim-airline/vim-airline'							-- statusline
	use 'vim-airline/vim-airline-themes'			-- statusline themes
	use 'williamboman/nvim-lsp-installer'			-- auto install language servers
	use 'windwp/nvim-autopairs'								-- autopairs
	use 'yegappan/mru'												-- most recently used files

	use 'JoosepAlviste/nvim-ts-context-commentstring' -- context based commentstring setting
	use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use {'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }

	-- if just bootstrapped, run sync
	if packer_bootstrap then
    require('packer').sync()
  end
end)

