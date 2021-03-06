" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Declare the list of plugins

" Initialize plugin system
call plug#end()

" Change mapleader
let mapleader=","

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Enable relative line numbers
:set rnu

" Search case insensitive, unless casing is specified
:set ignorecase
:set smartcase

" Enable syntax highlighting
syntax on

" Make tabs as wide as two spaces
set tabstop=2

" Improve regex searching by auto-escaping
nnoremap / /\v

" Themeing
" Set iTerm2 to xterm-256color-italic
" highlight Comment cterm=italic gui=italic
