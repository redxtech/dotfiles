return require('packer').startup(function()
	use 'wbthomason/packer.nvim'							-- package manager
	use {'dracula/vim', as = 'dracula'}				-- colourscheme
	use 'dylanaraps/wal.vim'									-- pywal colourscheme

	-- use 'christoomey/vim-tmux-navigator'			-- navigate tmux panes
	-- use 'christoomey/vim-tmux-runner'					-- navigate tmux panes
	-- use 'fvictorio/vim-textobj-backticks'			-- backtick object (a`, i`)
	-- use 'honza/vim-snippets'									-- snippets
	-- use 'tpope/vim-tbone'											-- run tmux commands through vim

	use 'ap/vim-css-color'										-- highlight hex colours with their colour
	use 'christoomey/vim-sort-motion'					-- sort lines (gs*)
	use 'dense-analysis/ale'									-- async lint engine
	use 'editorconfig/editorconfig-vim'				-- editorconfig support
	use 'glts/vim-textobj-comment'						-- comment object (ac, ic, aC)
	use 'hrsh7th/cmp-buffer'									-- buffer source for nvim-cmp
	use 'hrsh7th/cmp-cmdline'									-- cmdline source for nvim-cmp
	use 'hrsh7th/cmp-nvim-lsp'								-- lsp integration for nvim-cmp
	use 'hrsh7th/cmp-path'										-- path source for nvim-cmp
	use 'hrsh7th/cmp-vsnip'										-- snippet source for nvim-cmp
	use 'hrsh7th/nvim-cmp'										-- autocompete for nvim
	use 'hrsh7th/vim-vsnip'										-- snippet provider
	use 'itspriddle/vim-shellcheck'						-- shell script validation
	use 'jiangmiao/auto-pairs'								-- auto close pairs
	use 'junegunn/fzf.vim'										-- configure fzf
	use 'kana/vim-textobj-entire'							-- text object for entire buffer (ae, ie)
	use 'kana/vim-textobj-indent'							-- text object for indent (ai, ii, aI, iI)
	use 'kana/vim-textobj-line'								-- text object for line (al, il)
	use 'kana/vim-textobj-user'								-- allow user defined text objects
	use 'kovetskiy/sxhkd-vim'									-- syntax highlighting
	use 'ludovicchabant/vim-gutentags'				-- auto manage tags
	use 'lukas-reineke/indent-blankline.nvim'	-- show indent guides
	use 'mhinz/vim-signify'										-- show git changes in gutter
	use 'mhinz/vim-startify'									-- vim startup page
	use 'miyakogi/conoline.vim'								-- highlight current line
	use 'neovim/nvim-lspconfig'								-- LSP plugin
	use 'nvim-treesitter/nvim-treesitter' 		-- better syntax highlighting
	use 'onsails/lspkind-nvim'								-- show icons for lsp type
	use 'rafamadriz/friendly-snippets'				-- snippet collection
	use 'sheerun/vim-polyglot'								-- syntax highlighting for many langs
	use 'tmux-plugins/vim-tmux'								-- syntax highlighting
	use 'tpope/vim-commentary'								-- comments (gcc, gc<object>)
	use 'tpope/vim-dispatch'									-- compile wrapper (:Make)
	use 'tpope/vim-dotenv'										-- load dotenv file into vim
	use 'tpope/vim-endwise'										-- pair do->end, if->fi, etc.
	use 'tpope/vim-eunuch'										-- unix helpers
	use 'tpope/vim-fugitive'									-- git wrapper commands
	use 'tpope/vim-jdaddy'										-- json objects (aj), actions (gqaj: clean, gwaj, insert)
	use 'tpope/vim-repeat'										-- <.> repeats plugin stuff too
	use 'tpope/vim-rhubarb'										-- github integration for fugitive
	use 'tpope/vim-sensible'									-- sensible defaults everyone can agree on
	use 'tpope/vim-sleuth'										-- autodetect indents
	use 'tpope/vim-speeddating'								-- ctrl+(a/x) works properly on dates and times
	use 'tpope/vim-surround'									-- surround objects with stuff (cs<from><to>)
	use 'tpope/vim-unimpaired'								-- navigate between pairs
	use 'tpope/vim-vinegar'										-- extra tools for working with netrw
	use 'vim-airline/vim-airline'							-- statusline
	use 'vim-airline/vim-airline-themes'			-- statusline themes
	use 'yegappan/mru'												-- most recently used files
	use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
end)

