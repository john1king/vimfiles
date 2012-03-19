" 修复windows菜单乱码
if has('win32')
  set langmenu=none
  let $LANG='zh_CN.UTF-8'       " 状态栏，欢迎界面等语言，gvim中不设置则会乱码
endif

" @require vundle

" 备份
"set nobackup
"set noswapfile                 " 禁用交换文件
set autoread                    " 当文件在外部被修改，自动更新该文件
set backupdir=~/.vim/_backup//
set directory=~/.vim/_temp//

set hidden

" 字符表
set tabstop=2                   " tab宽度
set softtabstop=2               " 退格删除的空格数目
set shiftwidth=2                " 缩进宽度
set expandtab                   " 展开tab为空格
set autoindent

if has('mac')
  set listchars=tab:▸\ ,eol:¬
endif

" 搜索
set incsearch                  " 实时搜索
set ignorecase smartcase       " 忽略大小写
set hlsearch                   " 高亮查找结果

" 语言与编码
set helplang=cn                " 中文帮助
set encoding=utf-8
set fencs=utf8,chinese,default

if has('mac')
  set shell=/bin/sh
endif

" 显示
syntax on                    " 语法高亮
"set t_Co=256
set number                   " 行号
set cursorline               " 高亮当前行
"set nowrap

" 状态拦
set showcmd                      " 显示正在输入的命令
set laststatus=2                 " 总是显示状态栏
set statusline=%F%m%r%h          " 文件路径与状态
set statusline+=%{(expand('#t')!='')?'\ <=>\ '.expand('#:t'):''}
set statusline+=\ %=\ %c\ %p%%\  " 当前位置
set statusline+=%{(&fenc!='')?'['.&fenc.']':''}     " 文件编码

" @require clone, function, mapping, plugin, command, filetype

" 本地配置
if filereadable(expand('~/.vim/vimrc.local'))
  source ~/.vim/vimrc.local
endif

" 如果插件设置的map太多，可以恢复默认 Leader
" let mapleader = ""
