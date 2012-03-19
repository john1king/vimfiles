" 设置','为Leader快捷键
let mapleader = ","

noremap <C-C> <Esc>
noremap <C-[> <C-C>

nmap Q :q<CR>

" 文本自动换行时, gj 为在视觉上的一行
nnoremap j gj
nnoremap k gk

nnoremap   <Space>     f<Space>
vnoremap   <Space>     f<Space>
onoremap   <Space>     f<Space>
nnoremap   <S-Space>   F<Space>
vnoremap   <S-Space>   F<Space>
onoremap   <S-Space>   F<Space>

" Jump to matching pairs easily, with Tab
nmap <Tab> %
vmap <Tab> %

" 快速保存和退出
nmap <Leader>q  :q!<CR>
nmap <Leader>w  :w!<CR>
nmap <Leader>Wu :set fenc=utf-8<CR>:w!<CR>
nmap <Leader>Wc :set fenc=cp936<CR>:w!<CR>

nnoremap   <C-S>	:w!<CR>
vmap       <C-S>	<Esc><C-S>
imap       <C-S>	<C-O><C-S>

nnoremap   <C-Q>	:qa!<CR>
vmap       <C-Q>	<Esc><C-Q>
imap       <C-Q>	<Esc><C-Q>

" Win 风格按键
nnoremap   <C-A>	ggVG
vmap       <C-A>	<Esc><C-A>
"imap      <C-A>	<Esc><C-A>

nnoremap   <C-Z>	u
vmap       <C-Z>	<Esc><C-Z>
imap       <C-Z>	<C-O><C-Z>

" 读取乱码文件
nmap <Leader>ej :set fencs=japan<CR>:e!<CR>
nmap <Leader>ec :set fencs=utf-8,chinese<CR>:e!<CR>

" 选项卡
nnoremap   <C-T>   :tabnew<CR>
nnoremap   <C-H>   :tabprevious<CR>
nnoremap   <C-L>   :tabnext<CR>
imap       <C-T>   <Esc><C-T>
imap       <C-H>   <Esc><C-H>
imap       <C-L>   <Esc><C-L>

" 多窗口
nnoremap   <C-Up>       <C-W>k<C-W>_
nnoremap   <C-Down>     <C-W>j<C-W>_
nnoremap   <C-Left>     <C-W>h
nnoremap   <C-Right>    <C-W>l
nnoremap   <C-Insert>   <C-W><C-X>

imap       <C-Up>       <Esc><C-Up>
imap       <C-Down>     <ESC><C-Down>
imap       <C-Left>     <ESC><C-Left>
imap       <C-Right>    <Esc><C-Right>
imap       <C-Insert>   <Esc><C-Insert>

" 复制粘贴
nnoremap Y y$

nnoremap <Leader>p "+gp
vnoremap <Leader>p "+gp
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y
nnoremap <Leader>d "+d
vnoremap <Leader>d "+d

" 复制无名寄存器到系统剪贴版
nnoremap + :call setreg('+',getreg('"'))<CR>

nmap <Leader><Space> :nohl<CR>   " 关闭当前搜索高亮
vmap <Leader><Space> <C-O>:nohl<CR>
map <F3> :cnext<CR>              " 多文件查找下一个结果搜索
map <S-F3> :cprevious<CR>

" 代码缩进
nnoremap g= gg=G``
vnoremap g= =

" 执行文件
nmap <silent> <Leader>r : if &filetype == 'vim'<CR>
                        \   source %<CR>
                        \ else<CR>
                        \   call Run()<CR>
                        \ endif<CR>

nnoremap <Leader>1 :call HeadLine('=')<CR>
nnoremap <Leader>2 :call HeadLine('-')<CR>
vnoremap <Leader>3 <Esc>`>o```<Esc>`<O```<Esc>
vnoremap <Leader>4 <Esc>`>i<Space>`<Esc>`<i`<Space><Esc>
vnoremap <Leader>8 <Esc>`>i**<Esc>`<i**<Esc>

" 特殊关键字跳转
" nt: next markdown title
" nf: next function
" ns: next style/script tag
noremap <Leader>nt :call search('^[=-]\{3,}$')<CR> 
noremap <Leader>nf :call search('\<function\>')<CR>
noremap <Leader>ns :call search('<style\\|<script')<CR>
noremap <Leader>Nt :call search('^[=-]\{3,}$', 'b')<CR> 
noremap <Leader>Nf :call search('\<function\>', 'b')<CR>
noremap <Leader>Ns :call search('<style\|<script', 'b')<CR>


"===============
" 文本编辑快捷键
"===============

" <C-U> <C-W>  保持默认值，不使用<C-H>
inoremap <C-A> <C-O>^
inoremap <C-E> <C-O>$
inoremap <C-J> <C-O>o
inoremap <C-K> <C-O>D
inoremap <C-B> <C-O>b
inoremap <C-F> <C-O>w

"===========
" 系统快捷键
"===========

if has('win32')
  behave mswin
  set backspace=indent,eol,start whichwrap+=<,>,[,]
  nnoremap v vl
  vnoremap <BS> d
  cnoremap <C-V> <C-R>+
endif

"=====
" 函数
"=====

" 浏览当前目录
noremap <Leader>. :exec 'e '.expand('%:p:h')<CR>
" 切换单双引号，不完善
nmap <Leader>c' :call QuoteToggle()<CR>
