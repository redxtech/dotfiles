call plug#begin('~/.local/share/nvim/plugged')

Plug 'christoomey/vim-sort-motion' " sort motion
Plug 'christoomey/vim-tmux-navigator' " allows for tmux navigations
" Plug 'christoomey/vim-tmux-runner' " send commands to tmux panes
Plug 'redxtech/vim-tmux-runner'
Plug 'editorconfig/editorconfig-vim' " editorconfig support
Plug 'fvictorio/vim-textobj-backticks' " backticks object
Plug 'glacambre/firenvim' " nvim client for browser
Plug 'glts/vim-textobj-comment' " comment text object
Plug 'honza/vim-snippets' " snippets
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
Plug 'liuchengxu/vim-clap' " interactive finder & dispatcher
Plug 'metakirby5/codi.vim' " scratch-code playground
Plug 'mhinz/vim-signify' " git change indicators
Plug 'neoclide/coc.nvim', {'branch': 'release'} " intellisense completion
Plug 'scrooloose/nerdtree' " tree file browser
Plug 'sheerun/vim-polyglot' " syntax highlighting for a large number of languages
Plug 'terryma/vim-expand-region' " smart selected region expanding
Plug 'tmux-plugins/vim-tmux-focus-events' " fix focus events in tmux
Plug 'tmux-plugins/vim-tmux' " tmux configuration
Plug 'tpope/vim-commentary' " comment out lines with a keybind
Plug 'tpope/vim-dotenv' " dotenv file support
Plug 'tpope/vim-eunuch' " unix helpers
Plug 'tpope/vim-fugitive' " git helpers
Plug 'tpope/vim-jdaddy', { 'for': 'json' } " json object & motions
Plug 'tpope/vim-markdown', { 'for': 'md' } " markdown highlighting
Plug 'tpope/vim-obsession' " session saving
Plug 'tpope/vim-repeat' " repeat plugins with .
Plug 'tpope/vim-sensible' " defaults everyone can agree on
Plug 'tpope/vim-surround' " tools for surrounding elements
Plug 'tpope/vim-tbone' " tools for using tmux commands in vim
Plug 'dense-analysis/ale' " asynchronous lint engine
Plug 'yegappan/mru' " most recently used

" coc extensions
Plug 'fannheyward/coc-rust-analyzer', {'do': 'yarn install --frozen-lockfile', 'for': 'rust'}
Plug 'iamcco/coc-tailwindcss', {'do': 'yarn install --frozen-lockfile', 'for': ['javascript', 'css', 'vue', 'html']}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile', 'for': ['css', 'vue', 'html']}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile', 'for': ['html', 'vue']}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile', 'for': 'json'}
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile', 'for': 'python'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile', 'for': ['js', 'vue']}
Plug 'neoclide/coc-vetur', {'do': 'yarn install --frozen-lockfile', 'for': ['js', 'vue']}
Plug 'neoclide/coc-yank', {'do': 'yarn install --frozen-lockfile'}
Plug 'Shougo/neco-vim'
Plug 'voldikss/coc-browser', {'do': 'yarn install --frozen-lockfile'}

call plug#end()

