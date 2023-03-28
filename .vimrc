set nocompatible              " be iMproved, required
filetype off                  " required
"VUNDLE
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'preservim/nerdtree'
  Plugin 'sheerun/vim-polyglot'
  Plugin 'Valloric/YouCompleteMe'
call vundle#end()

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

"STUFF
syntax on
set number
set cursorline
set tabstop=4
set ignorecase
set hlsearch
set background=dark

" Start autocompletion after 4 chars
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_min_num_identifier_candidate_chars = 3
let g:ycm_enable_diagnostic_highlighting = 0
" Don't show YCM's preview window [ I find it really annoying ]
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+p
vnoremap <C-p> "+p

autocmd VimEnter *  NERDTree
