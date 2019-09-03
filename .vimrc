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
"{ 缩进设置
    set tabstop=4       " tab键长度4个空格
    set softtabstop=4
    set shiftwidth=4
    set expandtab
"}
set smarttab
set autoindent

set cursorline          " 当前行高亮
set nobackup            " 不生成备份文件,如index.html~
set ruler
set mouse=a             " 支持鼠标控制
set nofoldenable        " 取消代码折叠
set noswapfile          " 取消swap文件

set guifont=Courier

inoremap ' ''<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap < <><ESC>i

" 快捷键设置
map <F2> <ESC>:NERDTreeToggle<CR>
imap { {}<ESC>i<CR><ESC>O

" 插件设置
call plug#begin('~/.vim/plugged')
Plug 'beanworks/vim-phpfmt' "添加要安装的插件
Plug 'scrooloose/nerdtree'
Plug 'ConradIrwin/vim-bracketed-paste' " paste的替代者
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

"Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

" Make sure you use single quotes
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'


Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }


Plug '~/my-prototype-plugin'

call plug#end()


"{vim-easy-align
    "Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)
    "Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)
"}

" 插件设置
let NERDTreeWinSize=20


" 自动补全
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap < <><ESC>i

"set paste   " 取消paste
