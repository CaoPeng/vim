"设置字符集
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936
"不使用vi的键盘模式，而是vim自己的
set nocompatible
"history number
set history=1000
"在处理为保存 或  只读文件的时候  弹出确认
set confirm
"侦测文件类型
filetype on
"载入文件类型插件
filetype plugin on
"为特定文件类型载入相关缩进
filetype indent on
"语法高亮
syntax enable
syntax on
"设置搜索高亮
set hls
"设置显示行号
"set nu
"高亮显示匹配的括号
set showmatch
set helplang=cn
"配色方案
colorscheme desert
set list
"about Tlist
let Tlist_Show_One_File=1
let Tlist_exit_onlyWindow=1
"map tl for :Tlist
map tl :Tlist<cr>
"about WindowManager
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>
"for minibufexpl.vim
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplMapWindowsNavVim=1
let g:miniBufExplMapWindowNavArrows=1
"for python
"let python_highlight_all = 1
"for grep.vim
nnoremap <silent> <F3> :Grep<CR>
"for  OmniCppComplete
let OmniCpp_NamespaceSearch=1
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_ShowAccess=1
let OmniCpp_ShowPrototypeInAbbr=1 "show function parameters
let OmniCpp_MayCompleteDot=1 "autocomplete after .
let OmniCpp_MayCompleteArrow=1 " autocomplete after->
let OmniCpp_MayCompleteScope=1 "autocomplete after ::
let OmniCpp_DefaultNamespace=["std","_GLIBCXX_STD"]
"automatically open and close the popup menu /preview Window
au CursorMovedI,InsertLeave * if pumvisible()==0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
set nocp
filetype plugin on
"end for OmniCppComplete
"for SuperTab
let g:SuperTabDefaultCompletionType="context"
set autoindent
set tabstop=4  
set shiftwidth=4  
set expandtab  
set number
"setlocal omnifunc=javacomplete#Complete
"autocmd FileType java set omnifunc=javacomplete#Complete
"autocmd FileType java set completefunc=javacomplete#CompleteParamsInf
"setlocal completefunc=javacomplete#CompleteParamsInfo
"autocmd FileType java inoremap <buffer> . .<C-X><C-O><C-P><Down>
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
"缩进配置
set smartindent "smart indent
set autoindent  "打开自动个缩进
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
set cursorcolumn
" => Status line
"Always show the status line
"在上下移动光标的时候，光标的上下方至少会保留显示的行数
set scrolloff=7
"format the status line
set laststatus=2
"set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif
if filereadable("cscope.out")
    execute "cs add cscope.out"
endif

