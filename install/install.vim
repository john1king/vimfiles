" 使 macvim 可以调用手动安装的 ruby
if has('mac')
  set shell=/bin/sh
endif

command! -nargs=0 InstallPath :call writefile([substitute(expand('$VIM'), '\', '/', 'g')], '.install') | qa!
