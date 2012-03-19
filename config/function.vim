" 多行替换
function! ReplaceLines(first, last, list)
  call cursor(a:first, 0)
  exec 'normal ' . (a:last - a:first + 1) . 'dd'
  call append(a:first - 1, a:list)
endfunction

" 格式化css, 每个属性占一行
function! FormatCss() range
  let text = join(getline(a:firstline, a:lastline), "\n")
  let text = substitute(text, '\(;\|{\|}\)\s*', "\\1\n", 'g')
  let list = split(text, "\n")
  call ReplaceLines(a:firstline, a:lastline, list)
  call cursor(a:firstline, 0)
  exec 'normal =' . (len(list) -1) . 'j'
endfunction

" 根据文件类型执行程序
function! Run()
  if &filetype == 'html' || &filetype == 'xhtml'
    exec 'silent !chrome "%:p"'
  elseif &filetype == 'ruby'
    exec '!ruby %'
  endif
endfunction

" 快速输入Makrdown 标题，支持中文
function! HeadLine(symbol)
  let nl = line('.') + 1
  let under = getline(nl)
  let fline = repeat(a:symbol, virtcol('$')-1)
  if match(under, '^' . a:symbol . '\{3,}$') == -1
    call append('.', fline)
  else
    call setline(nl, fline)
  endif
endfunction

" 转换 Win 路径中的斜杠
function! s:unixpath(path)
  return substitute(a:path, '\', '/', 'g' )
endfunction!

" 获取指定缓冲区编号的完整路径
function! s:bufdir(n)
  return s:unixpath(expand('#' . a:n .':p'))
endfunction

" 获取指定标签页中打开的所有文件
function! s:tabfiles(n)
  let filenames = []
  for i in tabpagebuflist(a:n)
    call add(filenames, s:bufdir(i))
  endfor
  return filenames
endfunction

" 切换到包含指定文件名的标签页
function! s:tabfind(filename)
  for n in range(1, tabpagenr('$'))
    for filename in s:tabfiles(n)
      if filename == a:filename
        exec 'tabn '. n
        return 1
      endif
    endfor
  endfor
  return 0
endfunction

" 在新标签中打开文件，已打开的文件切换标签
function! s:tabnew(file)
  if !s:tabfind(a:file)
    exec 'tabnew ' . a:file
  endif
endfunction

" 判断字符串是否以 / 结尾
function! s:isdir(dir)
  return strridx(a:dir, '/') == strlen(a:dir) - 1
endfunction

" 删除列表中的空字符串
function! s:compact(list)
  return filter(a:list, ' v:val != "" ')
endfunction

" 连接路径
function! s:join(...)
  if len(a:000) == 0
    return ''
  endif
  let result = []
  for p in a:000
    call add(result, s:unixpath(p))
  endfor
  return substitute(join(result, '/'), '\/\+', '/', 'g')
endfunction

" @return 文件可读返回文件名，否则返回空字符串
"   默认在当前路径中查找， 文件夹以/ 结尾
function! s:exist(name, ...)
  let file =  a:0 >= 1 ? s:join(a:1, a:name) : a:name
  return s:isdir(a:name) && isdirectory(file) || filereadable(file) ? file : ''
endfunction

function! s:load_file(file)
  for path in g:load_path
    let file = s:exist(a:file, path)
    if file != ''
      call s:tabnew(file)
      return 1
    endif
  endfor
  return 0
endfunction

" g:load_path 指定文件加载路径
" g:load_filetype 指定可以省略的扩展名
function! Load(name)
  if !exists('g:load_filetype')
    let g:load_filetype = ['']
  endif
  if get(g:load_filetype, -1) != ''
    call add(g:load_filetype, '')
  endif
  for ext in g:load_filetype
    if s:load_file(a:name . ext)
      return 1
    endif
  endfor
  return 0
endfunction

" 获取距离最近的引号类型
" 不适用于嵌套和转义情况
" @return 2 为", 1 为', 0 为找不到引号
function! s:quotetype()
  let col = col('.')
  let line = getline('.')
  let double = stridx(line, '"', col)
  let single = stridx(line, "'", col)
  if single == -1  && double == -1
    return 0
  endif
  return double == -1 || single > -1 && double > single ? 1 : 2
endfunction

" 切换单双引号, 依赖 surround 插件
function! QuoteToggle()
  let quote = s:quotetype()
  let col = col('.')
  if quote == 2
    normal cs"'
  elseif quote == 1
    normal cs'"
  endif
  call cursor(0, col)
endfunction

" 保存当前编辑文件的副本到文件所在文件夹
function! Saveas(filename)
  let file = s:join(expand('%:p:h'), a:filename)
  exec 'write ' . file
  exec 'tabnew ' . file
endfunction

" 备份内容到"d 寄存器，并删除当前文件和Buf，文件不可恢复
function! Delete()
  normal gg"dyG
  let bn = bufnr('%')
  let result = delete(expand('%'))
  if result == 0
    exec 'bd ' . bn
  endif
endfunction
