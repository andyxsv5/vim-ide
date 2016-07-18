" An example for a vimrc file.
" 
" Last change:	2014 Oct 29
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

""""""""""""""""""""""""""""""""
" common settings
""""""""""""""""""""""""""""""""
set nocompatible	" Use Vim settings, rather then Vi settings
syntax enable 	    " syntax highlighting on
syntax on 			" syntax highlighting on
set hlsearch		" high light search
set backspace=indent,eol,start 	" allow backspacing over everything in insert mode
set autoindent		" always set autoindenting on
set cindent
set nobackup        " I hate backup files.
set number			" set line number
set history=50		" keep 50 lines of command line history
set ruler			" show the cursor position all the time
set showcmd			" display incomplete commands
set incsearch		" do incremental searching
set expandtab
set tabstop=4 softtabstop=4 shiftwidth=4
" vim 自身命令行模式智能补全
set wildmenu

set showmatch        " Show matching brackets.
set foldmethod=syntax	" 以符合编程语言语法的代码折叠方式
set nofen 				" 启动vim时打开所有折叠代码
set foldlevel=100
set cursorline

"za，打开或关闭当前折叠；zM，关闭所有折叠；zR，打开所有折叠

" 禁止折行
set nowrap

set laststatus=2

""""""""""""""""""""""""""""""""
" vundle settings
""""""""""""""""""""""""""""""""
" 必须的配置，先关闭类型文件检测
filetype off
" 将vundle路径添加到插件vim路径
set rtp+=~/.vim/bundle/vundle/
" 执行Vundle初始化
call vundle#rc()

" let vundle manage vundle 
" 将Vundle加入到bundle
Bundle 'gmarik/vundle'

" vim-scripts repos 
" vimscripts的repo使用下面的格式，直接是插件名称
Bundle 'taglist.vim'
Bundle 'winmanager'
" Bundle 'minibufexpl.vim'
Bundle 'a.vim'
" Bundle 'code_complete'
Bundle 'OmniCppComplete'
Bundle 'The-NERD-Commenter'
Bundle 'DoxygenToolkit.vim'

" original repos on github
" 非vimscripts的repo，比如github上的用户写的插件，使用这种用户名+repo名称的方式
" Bundle 'tpope/vim-fugitive'
Bundle 'andyxsv5/code_complete.vim'
Bundle 'andyxsv5/minibufexpl.vim'

Bundle 'fatih/vim-go'

Bundle 'octol/vim-cpp-enhanced-highlight'
Bundle 'Lokaltog/vim-powerline'
Bundle 'nathanaelkane/vim-indent-guides'

" non github repos
" 非github的插件，可以直接使用其git地址
" Bundle 'git://git.wincent.com/command-t.git'

" 安装完vundle后打开文件类型自检测
filetype plugin indent on

""""""""""""""""""""""""""""""""
" special settings
""""""""""""""""""""""""""""""""
set gcr=a:block-blinkon0	" 禁止光标闪烁
let mapleader=";"			" 定义快捷键的前缀，即<Leader>

" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j
" 定义快捷键在结对符之间跳转
nmap <Leader>M %

" 设置快捷键 进行工程编译及链接，并同时在quickfix输出make结果
" 前提是工程目录中有Makefile文件
nmap <Leader>m :wa<CR>:make<CR>:bot cw<CR><CR>

" 设置快捷键 ;cw 打开或关闭quickfix,并设置quickfix始终在屏幕底层
nmap <Leader>cw :bot cw<CR>
" 设置快捷键 ;cn 切换到下一个结果
nmap <Leader>cn :cn<cr>
" 设置快捷键 ;cp 切换到上一个结果
nmap <Leader>cp :cp<cr>

""""""""""""""""""""""""""""""""
" ctags settings
""""""""""""""""""""""""""""""""
" 设置tags文件
" if filereadable("/Users/xushuai/.vim/systags")
"     set tags+=/Users/xushuai/.vim/systags
" endif
" 定义快捷键 ;gt 跳转到光标所在关键词的定义处
nmap <Leader>gt <C-]>
" 定义快捷键 ;gr 跳回原关键词 与 ;gt 配合使用
nmap <Leader>gr <C-T>

" nmap <F10> :call Do_CsTag()<CR>

""""""""""""""""""""""""""""""""
" cscope settings
""""""""""""""""""""""""""""""""
" 设置cscope索引文件
if has("cscope")
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
       cs add cscope.out
    endif
    set csverb
endif

set cscopequickfix=s-,c-,d-,i-,t-,e-

nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

""""""""""""""""""""""""""""""""
" taglist.vim plugin settings
""""""""""""""""""""""""""""""""
" let Tlist_Ctags_Cmd='/usr/bin/ctags'	" 设置ctags程序执行路径
let Tlist_Show_One_File=1 	" 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow=1 " 如果taglist窗口是最后一个窗口，则退出vim
" let Tlist_Use_Left_Window=1 " taglist窗口显示在文本编辑区左侧
let Tlist_Use_Right_Window=1 " taglist窗口显示在文本编辑区右侧
let Tlist_WinWidth=20 		" taglist窗口宽度为20
nmap tl :TlistToggle<CR> 	" 定义快捷键 tl 打开/关闭taglist窗口

""""""""""""""""""""""""""""""""
" OmniCppComplete.vim plugin settings
""""""""""""""""""""""""""""""""
set completeopt=longest,menu 	" 取消补全内容以分割子窗口形式出现，只显示补全列表

""""""""""""""""""""""""""""""""
" The-NERD-Commenter plugin settings
""""""""""""""""""""""""""""""""
" <leader>cc快捷键进行注释选中的行, <leader>cu进行反注释, <leader>cm是多行注释
"对NERD_commenter的设置
let NERDShutUp=1

""""""""""""""""""""""""""""""""
" DoxygenToolkit.vim
""""""""""""""""""""""""""""""""
" Doxygen toolkit 
" :Dox 光标所在函数的注释; :DoxAuthor 文件头显示文件描述
let g:DoxygenToolkit_briefTag_pre="@brief\t"
let g:DoxygenToolkit_paramTag_pre="@param\t"
let g:DoxygenToolkit_returnTag="@returns\t"
let g:DoxygenToolkit_authorName="andy.xs, andy.xs@alibaba-inc.com"
let s:licenseTag = "Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag . "For free\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1

""""""""""""""""""""""""""""""""
" winManager.vim plugin settings
""""""""""""""""""""""""""""""""
let g:AutoOpenWinManager=0 	" 禁止自动打开winManager窗口管理器
" let g:winManagerWindowLayout='FileExplorer|TagList' 	" 设置winManager窗口布局
let g:winManagerWindowLayout='FileExplorer' 	" 设置winManager窗口布局
let g:winManagerWidth=20
nmap wm :WMToggle<cr>		" 定义快捷键 wm 打开/关闭winManager

""""""""""""""""""""""""""""""""
" miniBufExpl.vim plugin settings
""""""""""""""""""""""""""""""""
"允许光标在任何位置时用CTRL-TAB遍历buffer
let g:miniBufExplMapCTabSwitchBufs = 1

""""""""""""""""""""""""""""""
" BufExplorer.vim plugin settings
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.

""""""""""""""""""""""""""""""""
" a.vim plugin settings
""""""""""""""""""""""""""""""""
" 快速切换C H源文件
nmap <Leader>cd :A<CR>

if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \     exe "normal! g`\"" |
    \ endif
endif 

" 配色方案
set background=dark
colorscheme solarized
" colorscheme molokai
" colorscheme phd

" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
