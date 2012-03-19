
" 字体与配色
set linespace=5
set background=light
colorscheme solarized

" gui窗口
set guioptions-=T            "工具栏
set guioptions-=m            "菜单
set lines=30 columns=120     "窗口大小

" 关闭遇到错误时的声音提示
set noerrorbells
set vb t_vb= 

if has('mac')
  set guifont=Monaco:h16 
  set guifontwide=STHeitiSC-Light:h18

  " 输入法切换
  set noimdisable
  set iminsert=0
  set imsearch=0

elseif has('win32')
  set lines=25
  "set guifont=Monaco:h14
  set guifont=Monaco:h14 guifontwide=Microsoft_YaHei_Mono:h14
  "set guifont=Monaco:h13 guifontwide=YouYuan:h14
  "set guifont=YaHei_Consolas_Hybrid:h16
  "set guifont=Monaco:h14 guifontwide=Microsoft_YaHei_Mono:h14
  "set guifont=Courier_New:h16
endif


" 本地配置
if filereadable(expand('~/.vim/gvimrc.local'))
  source ~/.vim/gvimrc.local
endif
