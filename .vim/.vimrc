set nocompatible
so ~/.vim/plugins.vim

syntax enable
syntax on
let mapleader=','                                             "The defualt leader is \, but a comma is much better.
set bs=2                    "在insert模式下用退格键删除
set backspace=indent,eol,start                                  "Make backspace behave like every other editor.
set autoread                "文件在Vim之外修改过，自动重新读入
set fileencodings=uft-8,gbk "使用utf-8或gbk打开文件
set helplang=cn             "帮助系统设置为中文

set formatoptions-=t        "取消自动换行以下三行
set textwidth=0
set wrapmargin=0

set noerrorbells visualbell t_vb=  "取消错误铃声
set incsearch               "检索时增量高亮
set hls                     "检索时高亮显示匹配项
set ignorecase              "检索时忽略大小写
set autowriteall            "自动保存
set complete=.,w,b,u        "设置自动补全



"--------------Visuals---------"
colorscheme atom-dark       "主题
set t_Co=256
set guifont=Fira_Code:h15   "字体
set linespace=5             "设置行间距
set laststatus=2            "总是显示状态行
set number                  "显示行号

set guioptions-=L           "隐藏scrollbar
set guioptions-=l
set guioptions-=r
set guioptions-=R
set guioptions-=e

"隐藏分屏bar
hi vertsplit guifg=bg guibg=bg
set nomacligatures          "取消ligatures，显示!= 而不是不等号

"--------------Code Setting---------"
set showmatch               "代码匹配
set ai                      "自动缩进
set tabstop=4 softtabstop=4 shiftwidth=4                            " 一个tab四个空格
set list listchars=tab:··,trail:·,extends:»,precedes:«,nbsp:×       " 用点来显示tab
autocmd! bufreadpost * set noexpandtab | retab! 4                   " 读入是转换tab至空格，存入时用空格转换tab
autocmd! bufwritepre * set expandtab | retab! 4
autocmd! bufwritepost * set noexpandtab | retab! 4

"set foldmethod=syntax       "代码折叠
"---------------Split Management---------"
set splitbelow              "分屏出现在下边和右边
set splitright

"用Ctrl HJKL来控制切换分屏
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

"--------------Mappings---------"
"Shortcut for Vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>
 
"Shortcut for zshrc file.
nmap <Leader>ez :e ~/.zshrc<cr>

"Shortcut for snippets file.
nmap <Leader>es :UltiSnipsEdit<cr>
 
"Shortcut for clear search hightlight
nmap <Leader><space> :nohlsearch<cr>

"Shortcut for search tag
nmap <Leader>f :tag<space>

"Shortcut for CtrlP Tag 
nmap <D-r> :CtrlPBufTag<cr>

"Shortcut for most Recent File
nmap <D-e> :CtrlPMRU<cr>

"Shortcut for CtrlP
nmap <D-p> :CtrlP<cr>

"Shortcut for PeepOpen
nmap <D-n> :PeepOpen<cr>

"Reindent the code
nmap <F7> mzgg=G`z

"Shortcut for NerdTree
nmap <D-1> :NERDTreeToggle<cr>

"Shortcut for NerdTree
nmap <D-4> :TlistToggle<cr>

"Shortcut for NerdTreeFind
nmap <D-2> :NERDTreeFind<cr>


"Shortcut for create a project
nmap <Leader>cp :ProjectCreate . -n 

"--------------Auto-Commands---------"
"Automatically source the Vimrc file on save."
augroup autosourcing
    autocmd!
    autocmd BufWritePost $MYVIMRC source % 
augroup END


"----------------Plugin Setting--------"
"CtrlP
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|target\|vendor\|bower_components'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

"NerdTree
let NERDTreeHijackNetrw=0                                   "disable NERDTree hijack Vinage
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif                           "Auto close vim if the only window left open is a NERDTree
autocmd BufEnter * lcd %:p:h

"Greplace.vim
set grepprg=ag              "We want to use Ag for the Search

let g:grep_cmd_opts = '--line-numbers --noheading'

"CTags
"By default vim will only look for the tags file in the directory of the file open in the current buffer.
"Set vim to move up the directory hierarchy until it has found the file
set tags=tags;/

"SuperTab
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabClosePreviewOnPopupClose = 1


"UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"CSyntaxAfter
autocmd! FileType c,cpp,java call CSyntaxAfter()

"----------------Scala Setting--------"
let g:scala_sort_across_groups=1
let g:scala_first_party_namespaces='\(com.yieldmo.\|yi\)'
let s:tlist_def_scala_settings = 'scala;t:trait;c:class;T:type;' .
                  \ 'm:method;C:constant;l:local;p:package;o:object'


autocmd FileType scala inoremap <Leader>s <Esc>:call SortScalaImports()<CR>
autocmd FileType scala noremap <Leader>s <Esc>:call SortScalaImports()<CR>

"----------------PHP Setting--------"
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
autocmd FileType php inoremap <Leader>s <Esc>:call PhpSortUse()<CR>
autocmd FileType php noremap <Leader>s :call PhpSortUse()<CR>
autocmd FileType php nnoremap <F7> :call PhpCsFixerFixFile()<CR>

vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\ -f2-" }'

let g:php_cs_fixer_level="psr2"                 "vim-php-cs-fixer.vim




"---------------Eclim Setting---
autocmd FileType java noremap <A-CR> :JavaImport<CR>
autocmd FileType java noremap <F7> :JavaFormat<CR>
autocmd FileType java nmap <D-b> :JavaCallHierarchy<CR>
"----------------Notes--------"

"open Tags --- <C-]>
"jump back --- ''
"tab next --- gt,gT


"Replace steps
"1. Gsearch "h2"
"2. /src
"3. press V and select the place to replace
"4. Press : +  s/h2/h3
"5. Greplace
"6. a
"gg - head
"G - end of file

"ds' delete surrounding '
"cs'" change surrounding ' to "
"dst delete surrounding tag
"selet text + S + Tag     Insert Tag


"---Something about jump
"Ctrl I, O jump back and forth sequentailly
"Ctl 6 -- toggling the file
"
"
"-----------Makers
"m + any letter --- set a mark, lower key only for current Buffer, but upper case key will work for all files
":marks ------ show marks
"' + mark   ---- jump to that mark 
"` + mark  ------jump back to the line and the column
"'+0 ----jump to previous edit file


"----where select visual
"you can use mark too, or you can use Ctrl D, Ctrl U to select
"d'm delete to mark
"c'm change to mark
"> indent
"< undent



"record q + any letter + action +q
"call : @letter
"show   :reg
