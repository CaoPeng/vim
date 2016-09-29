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
"缩进配置
set smartindent
set showmatch
set helplang=cn
colorscheme desert
"colorscheme bclear
"显示tab按键
set list
"显示行末空格
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
"显示TAB
"highlight TabKey ctermbg=green guibg=green
"match TabKey /\t/

set autoindent
"1 tab == 4 space
set tabstop=4
set shiftwidth=4
set expandtab
"set nu
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
"Map <space> to / (search) and Ctrl-<a> to ? (backwards search)
map <space> /
map <c-a> ?
"highlight current line
set cursorline
set cursorcolumn
"在上下移动光标时，光标上下方至少会显示的行数
set scrolloff=4
" => Status line
"Always show the status line
set laststatus=2
"format the status line
"set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
set statusline=%F%m%r%h%w%*%=
\[%l/%L,%v]
\%{GitBranchInfoString()}
\[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]
\%y[%{strftime(\"%Y/%m/%d-%H:%M\")}]

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
 nmap <silent> <leader>fe :Sexplore! Sexplore?<cr>
"map fe :Sexplore!<cr>
"-- Cscope setting --
" 2015/11/13
"if has("cscope")
"    set csprg=~/bin/cscope " 指定用来执行cscope的命令
"    set csto=0 " 设置cstag命令查找次序：0先找cscope数据库再找标签文件；1先找标签文件再找cscope数据库
"    set cst " 同时搜索cscope数据库和标签文件
"    set cscopequickfix=s-,c-,d-,i-,t-,e- " 使用QuickFix窗口来显示cscope查找结果
"    set nocsverb
"    if filereadable("cscope.out") " 若当前目录下存在cscope数据库，添加该数据库到vim
"        cs add cscope.out
"        "elseif $CSCOPE_DB != "" " 否则只要环境变量CSCOPE_DB不为空，则添加其指定的数据库到vim
"        "    cs add $CSCOPE_DB
"    endif
"    set csverb
"endif
nmap cs :cs help<CR>
nmap css :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap csg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap csc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap cst :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap cse :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap csf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap csi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap csd :cs find d <C-R>=expand("<cword>")<CR><CR>

set timeoutlen=3000
"map Key 'F2' to turn on/off line number
:noremap <F2> :set nu! nu?<CR>
"set high light when search Code
:noremap <F3> :set hls! hls?<CR>
"set paste mode

autocmd InsertEnter * :set nohlsearch
autocmd InsertLeave * :set hls
xnoremap p pgvy
"xnoremap y viwy
" for NERDTreeToggle
" use $vim / $vim . -> open NERDTree auto
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map fl :NERDTreeToggle<CR>
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"for buftabline
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
map bl :MBEToggle<cr>
" start after vim started
let g:indent_guides_enable_on_vim_startup=1
" started level
let g:indent_guides_start_level=2
"
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle
" 禁止光标闪烁
set gcr=a:block-blinkon0

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
set t_Co=256

"set statusline=%<%F%<%<%h%m%<%{GitBranchInfoString()}%r%=line=%03l,col=%02c%V,totlin=%L%\%=%-30(,BfNm=%n%Y%)\%P\*       " cool statusline
let g:git_branch_status_text=" "
let g:git_branch_status_head_current=1
let g:git_branch_status_nogit=""
"for translate(base on YouDao online translate
if has('python')
    "vnoremap <silent> <C-T> :<C-u>Ydv<CR>
    "nnoremap <silent> <C-T> :<C-u>Ydc<CR>
    "noremap <leader>yd :<C-u>Yde<CR>
    nnoremap ydt :<C-u>Ydc<CR>
    vnoremap ydt :<C-u>Ydv<CR>
    noremap  yd  :<C-u>Yde<CR>
endif

"map resgrep :! grep caopeng -rn ./frameworks/base/core/java/android/
"""""""""""""""""""""""""""""""
"" BufExplorer
"""""""""""""""""""""""""""""""
"let g:bufExplorerDefaultHelp=0       " Do not show default help.
"let g:bufExplorerShowRelativePath=1  " Show relative paths.
"let g:bufExplorerSortBy='mru'        " Sort by most recently used.
"let g:bufExplorerSplitRight=0        " Split left.
"let g:bufExplorerSplitVertical=1     " Split vertically.
"let g:bufExplorerSplitVertSize = 30  " Split width
"let g:bufExplorerUseCurrentWindow=1  " Open in new window.
"autocmd BufWinEnter \[Buf\ List\] setl nonumber
