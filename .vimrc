"-------------------------------- GENERAL -----------------------------------;

set nocompatible              " be iMproved, required;
syntax on
set number
set cursorline
set tabstop=4
set ignorecase
set hlsearch
set background=dark
let base16colorspace=256  " Access colors present in 256 colorspace

map <C-c> "+y

filetype off                  " required;
"VUNDLE;
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
        \'coc-css'
        \]
	Plugin 'itchyny/lightline.vim'
    Plugin 'pangloss/vim-javascript'    " JavaScript support;
    Plugin 'leafgarland/typescript-vim' " TypeScript syntax;
    Plugin 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax;
    Plugin 'chriskempson/base16-vim'
call vundle#end()

filetype plugin indent on    " required;
" To ignore plugin indent changes, instead use:;
"filetype plugin on;
";
" Brief help;
" :PluginList       - lists configured plugins;
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate;
" :PluginSearch foo - searches for foo; append `!` to refresh local cache;
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal;


"-------------------- COC ----------------------------------------;
";
" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count;
" utf-8 byte sequence;
set encoding=utf-8
" Some servers have issues with backup files, see #649;
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable;
" delays and poor user experience;
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time;
" diagnostics appear/become resolved;
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate;
" NOTE: There's always complete item selected by default, you may want to enable;
" no select by `"suggest.noselect": true` in your configuration file;
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by;
" other plugin before putting this into your config;
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

" Make <CR> to accept selected completion item or notify coc.nvim to format;
" <C-g>u breaks current undo, please make your own choice.;
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
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

colorscheme base16-tomorrow-night
set termguicolors

set clipboard+=unnamedplus
"coc prettier 
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

autocmd VimEnter * NERDTree
