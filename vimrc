 "All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim74/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

syntax on
colorscheme torte
set guifont=Monospace\ 12
set encoding=utf-8

set relativenumber
set number
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set autoindent
set ignorecase smartcase
set pastetoggle=<F2>
set timeoutlen=350

set cursorline
set hlsearch
set mouse+=a

set autochdir

" Focus only works in gvim
autocmd InsertEnter * :set relativenumber&
autocmd InsertLeave * :set relativenumber
autocmd FocusLost   * :set relativenumber&
autocmd WinLeave    * :set relativenumber&
autocmd FocusGained * :set relativenumber
autocmd WinEnter    * :set relativenumber

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

filetype plugin on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"


set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
set rtp+=~/.vim/my-snippets/
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'henrik/vim-indexed-search'
Plugin 'nvie/vim-flake8'
Plugin 'tpope/vim-vinegar'
" Plugin 'justinmk/vim-sneak'
Plugin 'elzr/vim-json'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-syntastic/syntastic'
Plugin 'speshak/vim-cfn'
Plugin 'tidalcycles/vim-tidal'
Plugin 'simonhicks/foxdot.vim'
Plugin 'rust-lang/rust.vim'

call vundle#end()
filetype plugin indent on

" Airline
set laststatus=2
let g:airline_powerline_fonts=1

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" NERDcommenter
let mapleader=","
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Cloudformation
let g:syntastic_cloudformation_checkers = ['cfn_lint']

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:rustfmt_autosave = 1
let g:syntastic_rust_checkers = ['cargo']

" keybindings
nnoremap <leader>m :! make<CR>
noremap H ^
noremap L $
imap jj <ESC>

" FoxDot
" let g:sclang_executable_path = "/usr/bin/sclang"
" let g:python_executable_path = "/usr/bin/python"
vnoremap <silent> <CR> y:call system('nc localhost 7088 -c', @")<CR>
nnoremap <silent> <CR> :call system('nc localhost 7088 -c', getline('.'))<CR>
inoremap <silent> <c-enter> :call system('nc localhost 7088 -c', getline('.'))<CR>
vnoremap <silent> <c-k> :call system('nc localhost 7088 -c <<< "Clock.clear()"')<CR>
nnoremap <silent> <c-k> :call system('nc localhost 7088 -c <<< "Clock.clear()"')<CR>
