" To set the encode format
set fileencoding=utf-8
set termencoding=utf-8
set encoding=utf-8

" To set the tab to space
set expandtab

" To set the highlight
syntax on

" To apply the vim's operation
set nocompatible

" To display the line number
set number

" To display the current line boldly 
set cursorline

" To show nomral mode's commands
set showcmd

" To set the quick search
set incsearch

" To set the filetype check
filetype indent on

" To set the paired
set showmatch

" To set the indent same
set autoindent

" To set the tab number
set tabstop=4

" To display the airline
set laststatus=2

" To display the tabline
set showtabline=2

" To hide the default mode text
set noshowmode

" To set the default color scheme to be the desert
colorscheme desert

" To set no backup
set nobackup

" To set the tab and space display
set listchars=tab:>-,trail:-
set list

" To set the airline theme
let g:airline_theme="bubblegum"

" To map F3 to open the directory tree
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
"" o: open in current window 
"" t: open in next tab 
"" i: horizontal split
"" s: vertical split

"" o: open in current window 
"" o: open in current window 
" To set the code check
"" To custmoize the error and wanring icon
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"" To set the normal mode key bindings
"" sn to the next errors or warnings
"" sp to the previous errors or warnings
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)

" The information to use ctrlp
"" normal mode: <Ctrl-p> open
"" Esc or <Ctrl-c> close
"" <Ctrl-k> and <Ctrl-j> like j and k in vim
"" <Ctrl-f> switch the mode
"" <Ctrl-t> open the selected entry in a new tab
"" <Ctrl-v> vertical horzitonal
"" <Ctrl-x> horzizontal split

" To set the automatic comment
"" To leave a space automatically
let g:NERDSpaceDelims=1
"" /cc: add comment
"" /cu: undo comment
"" /c<space>: intelligent add/undo comment 
"" It's in the normal mode, so you can use the count

" To use vim-surround to operate ()、""、XML and HTML tags
"" normal mode
"" ds: delelte a surrounding
"" cs: change a surrounding
"" ys: yank a surrounding

" To use vim-tagbar
nmap <F2> :TagbarToggle<CR>
"" To focus automatically
let g:tagbar_autofocus = 1


" To configure vim-wiki
filetype plugin on