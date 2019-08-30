""""""""""""""""""""""""""""
"   cuihang的VIM配置
"   
"   插件管理工具采用vim-plug
"   具体安装方法详见 https://github.com/junegunn/vim-plug 
""""""""""""""""""""""""""""

" 基础设置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif		" 记住上次打开的位置，注意~/.viminfo 的权限
set nu                  " 显示行号
set shortmess=atI       " 启动VIM的时候不显示援助乌干达儿童的提示
set autoindent
"{ 缩进设置
    set tabstop=4       " tab键长度4个空格
    set softtabstop=4
    set shiftwidth=4
    set expandtab
"}
set smarttab
set paste

set cursorline          " 当前行高亮
set nobackup            " 不生成备份文件,如index.html~
set ruler
set mouse=a             " 支持鼠标控制

" 快捷键设置
map <F2> <ESC>:NERDTreeToggle<CR>

" 插件设置
call plug#begin('~/.vim/plugged')
Plug 'beanworks/vim-phpfmt' "添加要安装的插件
Plug 'scrooloose/nerdtree'
call plug#end()


"{vim-easy-align
    "Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)
    "Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)
"}




map <F3> :tabnew .<CR>				"列出当前目录文件  
"{	php 语法检查 , 保存:w 时，进行语法检查，注意配置 php 的位置
autocmd BufWritePost *.php call PHPSyntaxCheck()
if !exists('g:PHP_SYNTAX_CHECK_BIN')
    let g:PHP_SYNTAX_CHECK_BIN = '/home/homework/php/bin/php'
endif
function! PHPSyntaxCheck()
    let result = system(g:PHP_SYNTAX_CHECK_BIN.' -l -n '.expand('%'))
    if (stridx(result, 'No syntax errors detected') == -1)
        echohl WarningMsg | echo result | echohl None
    endif
endfunction
"}


" 插件列表 基于 vim-plug
call plug#begin('~/.vim/plugged')

"Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

" Make sure you use single quotes
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'


Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }


Plug '~/my-prototype-plugin'

call plug#end()

