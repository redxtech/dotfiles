call plug#begin('~/.local/share/nvim/plugged')

Plug 'editorconfig/editorconfig-vim' " editorconfig support
Plug 'ervandew/supertab' " tab completion
Plug 'itchyny/lightline.vim' " powerline
Plug 'jiangmiao/auto-pairs' " auto match brackets & etc.
Plug 'jistr/vim-nerdtree-tabs' " nerdtree open across tabs
Plug 'joshdick/onedark.vim' " colour scheme
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy-finder
Plug 'junegunn/fzf.vim' " fuzzy-finder
Plug 'metakirby5/codi.vim' " scratch-code playground
Plug 'mhinz/vim-signify' " git change indicators
Plug 'scrooloose/nerdtree' " tree file browser
Plug 'sheerun/vim-polyglot' " syntax highlighting for a large number of languages
Plug 'terryma/vim-expand-region' " smart selected region expanding
Plug 'tpope/vim-commentary' " comment out lines with a keybind
Plug 'tpope/vim-eunuch' " unix helpers
Plug 'tpope/vim-fugitive' " git helpers
Plug 'tpope/vim-markdown', { 'for': 'md' } " markdown highlighting
Plug 'tpope/vim-sensible' " defaults everyone can agree on
Plug 'tpope/vim-surround' " tools for surrounding elements
Plug 'dense-analysis/ale' " asynchronous lint engine
Plug 'yegappan/mru' " most recently used

call plug#end()

