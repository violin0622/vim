" config vim enviroments"""""
let g:vim_env = 
            \{ 
            \'os':'',
            \'client':'',
            \}

if has("win32") || has("win64") || has ("win32unix")
    let g:vim_env.os = 'windows'
elseif has('mac') || has('macunix')
    let g:vim_env.os = 'mac'
elseif has('unix')
    let g:vim_env.os = 'unix'
endif

if has('gui_running')
    let g:vim_env.client = 'gui'
else
    let g:vim_env.client = 'terminal'
endif

"常规设置""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible	"不兼容VI
set errorbells		"报警响铃
set autoread		"文件被修改时自动载入
set confirm			"处理未保存或只读文件时弹出确认
set nobackup		"不备份
set hidden			"可不保存即切换buffer
set helplang=cn		"帮助语言为汉语
set history=1024	"历史记录
"set scrolloff=10	"滚屏时上下保留10行
set mouse=a			"鼠标在任何模式下可用
set autochdir		"自动修改工作目录为文件所在目录
set encoding=utf-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8

if vim_env.os=='windows'
    set runtimepath+=$VIM/vimfiles/autoload
endif

if vim_env.os == 'windows' || vim_env.os == 'mac'
	set clipboard+=unnamed		"Windows环境下与剪贴板兼容
endif

"编辑设置"""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype on					"文件类型侦测
filetype plugin on			"为特定文件类型载入插件
filetype plugin indent on	"缩进
set smartindent				"智能缩进
set linebreak				"整词换行
set expandtab				"适用空格代替制表符
set tabstop=4				"制表符宽度
set shiftwidth=4			"换行缩进
set whichwrap+=>,h,l,<	    "Backspace
set backspace=indent,eol,start	

"显示设置"""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number			"显示行号
set ruler			"显示标尺
set title			"标题栏显示文件名
set showcmd			"显示命令
set showmatch		"显示匹配的括号
set mps+=<:>		"允许匹配尖括号
set laststatus=2	"总是显示状态栏
if vim_env.os == 'windows'
    set guifont=Consolas:h12	"设置字体字号
elseif vim_env.os == 'mac'
    "set guifont=Menlo-Regular:h16
    set guifont=Monaco:h14
endif

if vim_env.client == 'terminal'	"更改光标显示方式
	set guicursor=n-v-c-o-sm:block,i-ci:hor15,r-cr:hor40
else
	set guicursor=n-v-ve-o:block-Cursor/lCursor-blinkwait0,
				\i-c-ci:ver25-Cursor/lCursor-blinkwait500-blinkoff500-blinkon900,
				\r-cr:hor30-Cursor/lCursor-blinkwait500-blinkoff500-blinkon900,
				\sm:block-Cursor/lCursor-blinkwait500-blinkoff500-blinkon900
endif


if vim_env.os == 'windows' && vim_env.client == 'gui'
    auto GUIEnter * simalt ~x		"启动VIM自动最大化
elseif vim_env.os == 'mac' && vim_env.client == 'gui'
    set fullscreen
endif

"配色设置"""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""
if vim_env.client == 'terminal'
	set t_Co=256
endif

syntax enable
syntax on

"搜索设置"""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase		"大小写模糊
set smartcase		"智能大小写模糊
set incsearch		"增量搜索
set hlsearch		"高亮搜索结果
"其他设置"""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guioptions-=T	"关闭工具栏
set guioptions-=m	"关闭菜单栏
set guioptions-=r	"关闭右侧滚动条
set guioptions-=l	"左侧滚动条
set guioptions-=L
"映射<F2>为菜单栏呼出/隐藏键
map <silent> <F2> :if &guioptions =~# 'm' <Bar>
        				\set guioptions-=m <bar>
    			  \else <Bar>
        				\set guioptions+=m <Bar>
    			  \endif<CR>

if vim_env.os == 'windows'
    cd D:/workspace		"更改默认工作目录
elseif vim_env.os == 'unix'
    cd ~/
elseif vim_env.os == 'mac'
    cd ~/
endif

if vim_env.os == 'windows'
    autocmd! bufwritepost _vimrc source $VIM/_vimrc		"vimrc更改后自动载入
elseif vim_env.os == 'mac'
    autocmd! bufwritepost vimrc source ~/.vim/vimrc		"vimrc更改后自动载入
endif


"Plug.vim configration""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""
if vim_env.os == 'windows'
    let plug_position = '$VIM/vimfiles/plugs'
    let plug_copy_command = 'copy "'.$VIM.'\vimfiles\plugs\vim-plug\plug.vim" "'.$VIM.'\vimfiles\autoload\"'
elseif vim_env.os == 'unix'
    let plug_position = '~/.vim/plugs'
    let plug_copy_command = 'cp ~/.vim/plugs/vim-plug/plug.vim ~/.vim/autoload/'
elseif vim_env.os == 'mac'
    let plug_position = '~/.vim/plugs'
    let plug_copy_command = 'cp ~/.vim/plugs/vim-plug/plug.vim ~/.vim/autoload'
endif

call plug#begin(plug_position)
Plug 'junegunn/vim-plug',{'do': plug_copy_command}

"file browser
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'

"colorschemes
Plug 'crusoexia/vim-monokai'
Plug 'altercation/vim-colors-solarized'

" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'plasticboy/vim-markdown'
Plug 'vim-airline/vim-airline'

"compeletion
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}

" need ctags in env
Plug 'majutsushi/tagbar'

" only work on mac OSX
if vim_env.os == 'mac'
    Plug 'ybian/smartim'
    Plug 'rizzatti/dash.vim'
endif

Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""
"NERDTree configration"""""""""""""""""""""""""""""

let NERDTreeIgnore = ['\~$', '\.pyc$', '\.class$', '\.sw.$', '\.db$']

" vim-nerdtree-tabs
let g:nerdtree_tabs_open_on_gui_startup = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-easymotion configration"""""""""""""""""""""""

map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ:;'
let g:EasyMotion_startofline = 0

" move mappings
map <Leader>J <Plug>(easymotion-sol-j)
map <Leader>K <Plug>(easymotion-sol-k)
" find mappings
map <Leader>f <Plug>(easymotion-fl)
map <Leader>F <Plug>(easymotion-Fl)
map <Leader>t <Plug>(easymotion-tl)
map <Leader>T <Plug>(easymotion-Tl)
map <Leader><Leader>f <Plug>(easymotion-f)
map <Leader><Leader>F <Plug>(easymotion-F)
map <Leader><Leader>t <Plug>(easymotion-t)
map <Leader><Leader>T <Plug>(easymotion-T)
nmap <Leader><Leader>j  <Plug>(easymotion-overwin-line)

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"smartim configration"""""""""""""""""""""""""""""""""
if vim_env.os == 'mac'
    let g:smartim_default = 'com.apple.keylayout.ABC'
endif


set background=dark
if vim_env.os == 'mac' && vim_env.client == 'terminal'
    colorscheme solarized
else
    colorscheme monokai
endif

imap <c-j> <Down>
imap <c-k> <Up>
imap <c-h> <Left>
imap <c-l> <Right>
imap <c-a> <esc>A
imap <c-d> <esc>ddi
nnoremap 0 ^
nnoremap ^ 0

