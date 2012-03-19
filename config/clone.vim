
" 环绕 html 标签
function! VisualTagsWrap()
    if !exists('g:tags_to_wrap')
        let g:tags_to_wrap=[]
    endif
    let g:tags_to_wrap=split(input('space separated tags to wrap block: ', join(g:tags_to_wrap, ' ')), '\s\+')
    if len(g:tags_to_wrap)>0
        execute 'normal! `>a</'.join(reverse(g:tags_to_wrap), '></').'>'
        execute 'normal! `<i<'.join(reverse(g:tags_to_wrap), '><').'>'
    endif
endfunction

if has('mac')
  " 在浏览器中打开链接
  function! Browser ()
    let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
    echo s:uri
    if s:uri != ""
      exec "!open \"" . s:uri . "\""
    else
      echo "No URI found in line."
    endif
  endfunction

  "nmap <leader>a :call Browser ()<CR>

endif


" 删除隐藏的Buffer
function! Wipeout()
  " list of *all* buffer numbers
  let l:buffers = range(1, bufnr('$'))

  " what tab page are we in?
  let l:currentTab = tabpagenr()
  try
    " go through all tab pages
    let l:tab = 0
    while l:tab < tabpagenr('$')
      let l:tab += 1

      " go through all windows
      let l:win = 0
      while l:win < winnr('$')
        let l:win += 1
        " whatever buffer is in this window in this tab, remove it from
        " l:buffers list
        let l:thisbuf = winbufnr(l:win)
        call remove(l:buffers, index(l:buffers, l:thisbuf))
      endwhile
    endwhile

    " if there are any buffers left, delete them
    if len(l:buffers)
      execute 'bwipeout' join(l:buffers)
    endif
  finally
    " go back to our original tab page
    execute 'tabnext' l:currentTab
  endtry
endfunction



" Strip trailing whitespace (,ss)
function! StripWhitespace ()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction


" Windows: Explorer.exe
" Linux: nautilus $PWD
" nautilus .
" Mac: open .
" @see http://www.zhuoqun.net/html/y2010/1516.html
function! FileExplorer(path)
    if a:path == ""
        if has("win32")
            let p = expand("%:p")
        elseif has("mac")
            let p = expand("%:p:h")
        else
            echomsg "Not support."
            return
        endif
    else
        let p = a:path
    endif
    if has("win32") && exists("+shellslash") && &shellslash
        let p = substitute(p, "/", "\\", "g")
    endif

    if executable("chcp")
        let code_page = 'cp' . matchstr(system("chcp"), "\\d\\+")
    else
" If chcp doesn't work, set its value manually here.
        let code_page = 'cp936'
    endif
    if has("win32") && !has('win32unix') && (&enc!=code_page)
        let p = iconv(p, &enc, code_page)
    endif

    if has("win32")
        exec ":!start explorer /select, " . p
" Open Explorer Tree.
"exec ":!start explorer /e,/select, " . p
    elseif has("mac")
        exec ':!open "' . p . '"'
    endif
endfunction
