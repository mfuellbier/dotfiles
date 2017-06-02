" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
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
colorscheme evening
set guifont=Monospace\ 12

set relativenumber
set number
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set autoindent

set cursorline
set hlsearch
set mouse+=a

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
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"


set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

Plugin 'maikel/Vundle.vim'
Plugin 'maikel/vim-airline'
set laststatus=2
let g:airline_powerline_fonts=1

filetype plugin indent on
