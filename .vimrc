set nocompatible              " be iMproved, required
syntax on
set number
set cursorline
set tabstop=4
set ignorecase
set hlsearch
set background=dark
set mouse=a
let base16colorspace=256  " Access colors present in 256 colorspace
set encoding=utf-8
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes
map <C-c> "+y"
let g:airline_powerline_fonts = 1
let g:airline_theme = 'tender'
set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
	Plugin 'sheerun/vim-polyglot'
    Plugin 'preservim/nerdtree'
    Plugin 'neoclide/coc.nvim', {'branch':'release'}
            let g:coc_global_extensions = [
                   \'coc-tsserver',
                   \'coc-snippets',
                   \'coc-prettier',
                   \'coc-json',
                   \'coc-jest',
                   \'coc-html',
                   \'coc-eslint',
                   \'coc-toml',
                   \'coc-css',
                   \'coc-flutter',
                   \]
   Plugin 'NLKNguyen/papercolor-theme'
   Plugin 'jacoborus/tender.vim'
   Plugin 'vim-airline/vim-airline'
   Plugin 'bling/vim-bufferline'

call vundle#end()            " required
filetype plugin indent on    " required
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
      let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction
    " Use <c-space> to trigger completion.;
inoremap <silent><expr> <c-space> coc#refresh()
    " Make <CR> to accept selected completion item or notify coc.nvim to
    " format;
    " " <C-g>u breaks current undo, please make your own choice.;
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                  \:"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap {  {}<Left>
inoremap [  []<Left>
inoremap '  ''<Left>
inoremap "  ""<Left>
inoremap (  ()<Left>
inoremap `  ``<Left>
inoremap /* /**/<Left><Left>
" Highlight symbol under cursor on CursorHold;
autocmd CursorHold * silent call CocActionAsync('highlight')
" GoTo code navigation.;
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
colorscheme tender  
set clipboard+=unnamedplus
"coc prettier 
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

autocmd VimEnter * NERDTree
