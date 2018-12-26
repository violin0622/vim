"""""""""""""""""""""""""""""""""""""""""""""""""""
"		_vimrc by Violin
"			2015-4-17
""""""""""""""""""""""""""""""""""""""""""""""""""""

"检测是否为Windows
if (has("win32") || has("win64") || has ("win32unix"))		
	let g:isWindows = 1
else
	let g:isWindows = 0
endif

"检测是否为GVIM
if has("gui_running")
	let g:isGUI = 1
else
	let g:isGUI = 0
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
set runtimepath+=$VIM/vimfiles/autoload
set encoding=utf-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8

if(g:isWindows)
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
set guifont=Consolas:h12	"设置字体字号

if(!isGUI)	"更改光标显示方式
	set guicursor=n-v-c-o-sm:block,i-ci:hor15,r-cr:hor40
else
	set guicursor=n-v-ve-o:block-Cursor/lCursor-blinkwait0,
				\i-c-ci:ver25-Cursor/lCursor-blinkwait500-blinkoff500-blinkon900,
				\r-cr:hor30-Cursor/lCursor-blinkwait500-blinkoff500-blinkon900,
				\sm:block-Cursor/lCursor-blinkwait500-blinkoff500-blinkon900
endif


au GUIEnter * simalt ~x		"启动VIM自动最大化

"配色设置"""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""
if(!isGUI)
	set t_Co=256
endif

syntax enable
syntax on

"colorscheme desert
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

"cd D:/workspace		"更改默认工作目录
cd D:/ProjectHome
autocmd! bufwritepost _vimrc source $VIM/_vimrc		"vimrc更改后自动载入

