set nocompatible   ""be iMproved
filetype off " requeired!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"requeried!
Bundle 'gmarik/vundle'

Bundle 'mattn/zencoding-vim'

Bundle 'Tagbar'
let g:tagbar_sort=0
let g:tagbar_width=20
noremap <F8> :TagbarToggle<CR>

"The-NERD-tree
Bundle 'The-NERD-tree'
noremap <F7> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=20

""语法和高亮 支持 js/jquery/html5/php
Bundle 'JavaScript-syntax'
Bundle 'jQuery'
Bundle 'othree/html5.vim'
Bundle 'groenewege/vim-less'
Bundle 'php.vim-html-enhanced'

"python
Bundle 'Python-syntax'

""改善js/html混排
Bundle 'pangloss/vim-javascript'
filetype plugin indent on

"auto complcache
Bundle 'Shougo/neocomplcache'

"自动补全
Bundle 'snipMate'

"修改版
"Bundle "MarcWeber/vim-addon-mw-utils"
"Bundle "tomtom/tlib_vim"
"Bundle "snipmate-snippets"
"Bundle "garbas/vim-snipmate"

"setting
au BufNewFile,BufRead *.less set filetype=css
au BufNewFile,BufRead *.phtml set filetype=php
au BufRead,BufNewFile *.js set ft=javascript.jquery

"---NeoComplCache 启动
let g:neocomplcache_enable_at_startup = 1 

"DoxygenToolkit
Bundle 'DoxygenToolkit.vim'
let g:DoxygenToolkit_authorName="Townsend"
let g:DoxygenToolkit_authorEmail ="lxy3372@qq.com"
let s:licenseTag = "******************Copyright(C)**************\<enter>"

let s:licenseTag = s:licenseTag . "xiaoyi\<enter>"

let s:licenseTag = s:licenseTag . "All right reserved\<enter>"

let g:DoxygenToolkit_licenseTag = s:licenseTag

let g:DoxygenToolkit_briefTag_funcName="yes"

let g:doxygen_enhanced_color=1
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2321,cp936

""language setting
set langmenu=zh_CN.UTF-8
set helplang=cn
source  $VIMRUNTIME/delmenu.vim
source  $VIMRUNTIME/menu.vim

""Nobackup
set nobackup

""noswap
set noswapfile

"忽略大小写
set ignorecase

"search keyword linehight
set incsearch

"行内替换
set gdefault

set nu!
set ruler

set shiftwidth=4
set tabstop=4

"tab  =  4 space
set expandtab

"COlor
set t_Co=256

"indent
set autoindent

"只对php文件生效
auto FileType php set expandtab

"根据编辑模式更改输入法光标颜色，同时禁用IME自动切换
if has('multi_byte_ime')
		hi Cursor guifg=bg guibg=Orange gui=NONE
		hi CursorIM guifg=NONE guibg=Skyblue gui=NONE
		set iminsert=0 imsearch=0	
endif

"auto reload vim after edited
autocmd! bufwritepost .vimrc source ~/.vimrc

colorscheme desert
