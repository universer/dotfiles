so ~/.vim/plugins.vim

syntax enable
syntax on
let mapleader=','           "设置lead键为,
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
"set autowriteall           "自动保存
set complete=.,w,b,u        "设置自动补全
set ruler                   "显示行号
set showcmd                 "显示输入命令

"--------------Visuals---------"
colorscheme atom-dark       "主题
set t_Co=256
set guifont=Fira_Code:h15   "字体
set lines=50 columns=200
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
"autocmd! bufwritepost * set noexpandtab | retab! 4					"读入是转换tab至空格，存入时用空格转换tab
autocmd BufWritePre * :%s/\s\+$//e                                  "保存文件前trim行尾的空字符

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
nmap <Leader>ez :tabedit ~/.zshrc<cr>

"Shortcut for git notes
nmap <Leader>eg :tabedit ~/gitnotes<cr>

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
"nmap <C-n> :CtrlP<cr>

"Shortcut for PeepOpen
nmap <C-p> :PeepOpen<cr>

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

"Automatically source the Vimrc file on save."
augroup autosourcing2
    autocmd!
    autocmd BufWritePost ~/.vim/plugins.vim source %
augroup END

"Automatically source the zshrc file on save."
augroup autosourcing1
    autocmd!
    autocmd BufWritePost ~/.zshrc !source ~/.zshrc
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

"----------------JSX Setting--------"
let g:jsx_ext_required = 0


"----------------Scala Setting--------"
let g:scala_sort_across_groups=1
let g:scala_first_party_namespaces='\(com.yieldmo.\|yi\)'
let s:tlist_def_scala_settings = 'scala;t:trait;c:class;T:type;' .
                  \ 'm:method;C:constant;l:local;p:package;o:object'


autocmd FileType scala inoremap <Leader>s <Esc>:call SortScalaImports()<CR>
autocmd FileType scala noremap <Leader>s <Esc>:call SortScalaImports()<CR>
autocmd FileType scala noremap <A-CR> :ScalaImport<CR>
autocmd FileType scala inoremap <A-CR> :ScalaImport<CR>
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

"----------------JS Setting--------"

"autocmd FileType javascript noremap <buffer>  <F7> :call JsBeautify()<cr>
"" for json
"autocmd FileType json noremap <buffer> <F7> :call JsonBeautify()<cr>
"" for jsx
"autocmd FileType jsx noremap <buffer> <F7> :call JsxBeautify()<cr>
"" for html
"autocmd FileType html noremap <buffer> <F7> :call HtmlBeautify()<cr>
"" for css or scss
"autocmd FileType css noremap <buffer> <F7> :call CSSBeautify()<cr>


"----------------Syntastic Setting--------"
let g:syntastic_javascript_checkers = ['eslint']

"---------------javacomplete2 Setting---
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java nmap <A-CR>  <Plug>(JavaComplete-Imports-AddSmart)
autocmd FileType java nmap <A-CR> <Plug>(JavaComplete-Imports-AddSmart)


"---------------Dash Setting---
nmap <F12> :Dash<CR>

"---------------TagHighlight---
nmap <F8> :UpdateTypesFile<CR>

"--------------Syntastic---
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"---------------Operator Highlight---
let g:ophigh_color_gui = "#FFD700"



"---------------SuperLine Setting---
set rtp+=/Library/Python/2.7/site-packages/powerline/bindings/vim

" These lines setup the environment to show graphics and colors correctly.
set nocompatible
set t_Co=256

let g:minBufExplForceSyntaxEnable = 1
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

if ! has('gui_running')
   set ttimeoutlen=10
   augroup FastEscape
      autocmd!
      au InsertEnter * set timeoutlen=0
      au InsertLeave * set timeoutlen=1000
   augroup END
endif

set laststatus=2 " Always display the statusline in all windows
set guifont=Inconsolata\ for\ Powerline:h14
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

"----------------Notes--------"



"--------------------------Global Search and Replace steps----------------
"1. Gsearch "h2"
"2. /src
"3. press V and select the place to replace
"4. Press : +  s/h2/h3
"5. Greplace
"6. a

"-----------------------Surround Operation---------------
" ds' delete surrounding '
" cs'" change surrounding ' to "
" dst delete surrounding tag
" selet text + S + Tag    Insert Tag
" yss)      整行加（）
" ysiw)     单词加）

"-----------------------Jump Operation---------------
"Ctrl I, O jump back and forth sequentailly
"Ctl 6 -- toggling the file
"open Tags --- <C-]>
"jump back and forth --- ''


"-----------------------Mark Operation---------------
"  m + any letter --- set a mark, lower key only for current Buffer, but upper case key will work for all files
"  :marks ------ show marks
"  ' + mark ---- jump to that mark
"  ` + mark  ------jump back to the line and the column
"  '+0 ----jump to previous edit file


"-----------------------Visual Operation---------------
"you can use mark too, or you can use Ctrl D, Ctrl U to select
"d'm delete to mark
"c'm change to mark

"-----------------------Indent Operation---------------
"> indent
"< undent

"-----------------------Register Operation---------------
"record q + any letter + action +q
"call : @letter
"show   :reg

"   "kyy    copy current line to register k
"   "kp     paste from register k
"
"
"-----------------------Multi Cursor Operation---------------
"<C-n> N time to multiSelect
"
