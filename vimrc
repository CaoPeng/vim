set fenc=utf-8
"for use vim's keypad
set nocompatible
"history number
set history=1000
"alert confirm dialog when we open a file which readonly or change
set confirm
"sinfer file type
filetype on
filetype indent on
syntax enable
syntax on
"set high light when search code
set hls
set showmatch
set helplang=cn
colorscheme desert
set list
set autoindent
"1 tab == 4 space
set tabstop=4
set shiftwidth=4
set expandtab
set nu
set showcmd
"Code complete
set completeopt=preview,menu

"Height of the command bar
set cmdheight=2
"Always show current position
set ruler
" IN may terminal emulator the mouse was working fine
if has('mouse')
    set mouse=a
endif
"set 7 lines to cursor when moving vertically using j/k
set so=7
"Ignore case when searching
set ignorecase
"when searching try to be smart about cases
set smartcase
"use speces instead of tabs
set expandtab
"Be smart when using tabs :)
set smarttab
"Linebreak on 500 characters
set lbr
set tw=500
"Map <space> to / (search) and Ctrl-<space> to ? (backwards search)
map <space> /
map <c-space> ?
"Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
"Returns ture if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE'
    endif
    return ''
endfunction
"highlight current line
set cursorline 
" => Status line
"Always show the status line
set laststatus=2
"format the status line
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif
"map tl for :Tlist
map tl :Tlist<cr>
"set Tlist auto open
"let Tlist_Auto_Open=1
"自动关闭
let Tlist_File_Fode_Auto_Close=1
"一次只显示一个文件中的信息
let Tlist_Show_One_File=1
"设置输入焦点到taglit窗口
let Tlist_GainFocus_On_ToggleOpen=1
"Folder Explore
"netrw setting
let g:netrw_winsize=30
"nmap <silent> <leader>fe :Sexplore!<cr>
nmap <silent> <leader>fe :Sexplore!<cr>
"map fe :Sexplore!<cr>

