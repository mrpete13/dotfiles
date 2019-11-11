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
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
" let skip_defaults_vim=1

" Turn on syntax highlighting
syntax on

" Display 5 lines above/below the cursor when scrolling
set scrolloff=5

" Status bar
set laststatus=2

" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%L,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Automatically wrap text that goes off screen
set wrap

" Show line numbers
set number

" Highlight matching search patterns
set hlsearch

" Enable incremental search
set incsearch

" Include matching uppercase words with lower case search term
set ignorecase

" Include only uppercase words with upper case search term
" set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb
" of data. Useful for copying large amounts of data between files
" set viminfo='100,<9999,s100'

" Set tab to a predefined number of spaces
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set textwidth=80
