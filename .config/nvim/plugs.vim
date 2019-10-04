call plug#begin('~/.local/share/nvim/plugged')

Plug 'christoomey/vim-sort-motion' " sort motion
Plug 'christoomey/vim-tmux-navigator' " allows for tmux navigations
Plug 'christoomey/vim-tmux-runner' " send commands to tmux panes
Plug 'editorconfig/editorconfig-vim' " editorconfig support
Plug 'ervandew/supertab' " tab completion
Plug 'fvictorio/vim-textobj-backticks' " backticks object
Plug 'glts/vim-textobj-comment' " comment text object
Plug 'itchyny/lightline.vim' " powerline
Plug 'jiangmiao/auto-pairs' " auto match brackets & etc.
Plug 'jistr/vim-nerdtree-tabs' " nerdtree open across tabs
Plug 'joshdick/onedark.vim' " colour scheme
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy-finder
Plug 'junegunn/fzf.vim' " fuzzy-finder
Plug 'kana/vim-textobj-entire' " entire buffer text object
Plug 'kana/vim-textobj-indent' " indent object
Plug 'kana/vim-textobj-line' " line object
Plug 'kana/vim-textobj-user' " allow user defined text objects
Plug 'metakirby5/codi.vim' " scratch-code playground
Plug 'mhinz/vim-signify' " git change indicators
Plug 'neoclide/coc.nvim', {'branch': 'release'} " intellisense completion
Plug 'scrooloose/nerdtree' " tree file browser
Plug 'sheerun/vim-polyglot' " syntax highlighting for a large number of languages
Plug 'skywind3000/asyncrun.vim' " run async commands
Plug 'terryma/vim-expand-region' " smart selected region expanding
Plug 'tmux-plugins/vim-tmux' " tmux configuration
Plug 'tpope/vim-commentary' " comment out lines with a keybind
Plug 'tpope/vim-dotenv' " dotenv file support
Plug 'tpope/vim-eunuch' " unix helpers
Plug 'tpope/vim-fugitive' " git helpers
Plug 'tpope/vim-jdaddy' " json object & motions
Plug 'tpope/vim-markdown', { 'for': 'md' } " markdown highlighting
Plug 'tpope/vim-repeat' " repeat plugins with .
Plug 'tpope/vim-sensible' " defaults everyone can agree on
Plug 'tpope/vim-surround' " tools for surrounding elements
Plug 'tpope/vim-tbone' " tools for using tmux commands in vim
Plug 'dense-analysis/ale' " asynchronous lint engine
Plug 'yegappan/mru' " most recently used

" coc extensions
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-tailwindcss', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-vetur', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yank', {'do': 'yarn install --frozen-lockfile'}

call plug#end()

