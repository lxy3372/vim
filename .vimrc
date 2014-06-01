set nocompatible

"加入行号"
set nu
set fileformats=unix,dos
"tab 4"
set tabstop=4
"自动缩进"
set autoindent
set softtabstop=4
set shiftwidth=4
set noexpandtab
"列高亮"
set cursorcolumn
"行高亮"
set cursorline
set smarttab
"设置不生成缓存"
set nobackup
set nowritebackup
""设置工作目录为当前目录
set bsdir=buffer

set autochdir
""逐行搜索高亮
set incsearch
""搜索忽略大小写
set ignorecase
"设置临时文件目录"
set noswapfile
set diffexpr=MyDiff()
"代码折叠 "
set foldmethod=syntax
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1
set fileencoding=utf-8
set termencoding=utf-8
set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
"set langmenu=zh_CN.UTF-8"
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
colorscheme desert
"colorscheme solarized
syntax enable
syntax on
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

function AddPHPFuncList()
    set dictionary-=~/.vim/extra/php_funclist.txt
    set complete-=k complete+=k
endfunction
au filetype php call AddPHPFuncList()
au filetype html call AddPHPFuncList()

set autoindent
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascrīpt set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete



inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>O
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>
 
function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf
 
function CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
 return "\<CR>}"
 else
 return "\<Esc>j0f}a"
 endif
endf
 
function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 "Inserting a quoted quotation mark into the string
 return a:char
 elseif line[col - 1] == a:char
 "Escaping out of the string
 return "\<Right>"
 else
 "Starting a string
 return a:char.a:char."\<Esc>i"
 endif
endf
let g:DoxygenToolkit_authorName="liuxy"
""let g:DoxygenToolkit_authorEmail ="email@gmail.com"
""let s:licenseTag = "******************Copyright(C)**************\<enter>"
""let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
""let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1
let g:DoxygenToolkit_commentType="PHP"
set tags=tags 
set autochdir


"""""""""""""""NREDtree"
"设置F8为快捷键"
map <silent> <F8> :NERDTreeToggle<cr>
let NERDTreeWinSize=25
let NERDChristmasTree=1
let NERDTreeAutoCenter=1 

""""""""""""""""open new tags
map <silent> <F2> :tabnew<cr>
" Check the syntax of a PHP file
function! CheckPHPSyntax()
    if &filetype != 'php'
        echohl WarningMsg | echo 'This is not a PHP file !' | echohl None
        return
    endif
    setlocal makeprg=php\ -l\ -n\ -d\ html_errors=off\ %
    setlocal errorformat=%m\ in\ %f\ on\ line\ %l
    echohl WarningMsg | echo 'Syntax checking output:' | echohl None
    if &modified == 1
        silent write
    endif.vimrc
    silent make
    clist
endfunction
au filetype php map <F5> :call CheckPHPSyntax()<CR>
au filetype php imap <F5> <ESC>:call CheckPHPSyntax()<CR>

" Check the syntax of a python file
function! CheckPythonSyntax()
    if &filetype != 'python'
        echohl WarningMsg | echo 'This is not a Python file !' | echohl None
        return
    endif
    setlocal makeprg=python\ -u\ %
    set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
    echohl WarningMsg | echo 'Syntax checking output:' | echohl None
    if &modified == 1
        silent write
    endif
    exec "silent make -c \"import py_compile;py_compile.compile(r'".bufname("%")."')\""
    clist
endfunction.vimrc
au filetype python map <F5> :call CheckPythonSyntax()<CR>
au filetype python imap <F5> <ESC>:call CheckPythonSyntax()<CR>

""""""""""""""""""""""""""""""""""Tagbar""""""""""""""""
let g:tagbar_width=20
let g:tagbar_sort=0
noremap <F9> :TagbarToggle<CR>
set nocompatible               " be iMproved  
 filetype off                   " required!  
  
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

  
 " let Vundle manage Vundle  
 " required!  
 Bundle 'gmarik/vundle'  
 " My Bundles here:  
 "  
 " original repos on github  
 Bundle 'tpope/vim-fugitive'  
 Bundle 'Lokaltog/vim-easymotion'  
 Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}  
 Bundle 'tpope/vim-rails.git'  
 " non github repos  
 Bundle 'git://git.wincent.com/command-t.git'  
 Bundle 'netrw.vim'
 Bundle 'DrawIt'
 Bundle 'CCTree'
 Bundle 'ctrlp.vim'
 Bundle 'InsertList'
 "Bundle 'commentary'
 Bundle 'tpope/vim-commentary'
 Bundle 'taglist.vim'

 "config"
 let Tlist_Show_One_File=1
 let Tlist_Exit_OnlyWindow=1
 

 filetype plugin indent on     " required!  

 autocmd FileType apache set commentstring=#\ %s
 
