command! -nargs=0 Strip :call StripWhitespace()
command! -nargs=1 Saveas :call Saveas('<args>')
command! -nargs=0 Delete :call Delete()

" @see http://csstidy.sourceforge.net/usage.php
command! -nargs=0 -range=% Csstidy :<count>!csstidy - --silent=true
command! -nargs=0 -range=% Cssformat :<count>call FormatCss()

command! -nargs=0 Rake :exec '!rake -f '. g:rakefile . ' exe:update' | :So
" 需要在 ~/.vimrc.local 中定义 g:local_path
command! -nargs=1 Load :call Load("<args>")
nmap L :Load 

" Open Windows Explorer and Fouse current file.
" or open Mac Finder.
" %:p:h " Just Fold Name.
command! Open :call FileExplorer("")

" 重新加载配置文件
command! -nargs=0 So :so $MYVIMRC | so $MYGVIMRC | nohl

" 默认设置
let g:load_path = []
let g:load_filetype = ['.md', '.vim']
