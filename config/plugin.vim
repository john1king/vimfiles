
let g:snippets_dir = '~/.vim/snippets'

" NERDTree
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=0
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let NERDTreeIgnore=['^\.$', '^\.\.$', '\~$', '\.swo$', '\.swp$', '\.git', '\.svn', '\.bzr', '\.DS_Store']
nnoremap <F2> :NERDTreeToggle<CR>
inoremap <F2> <Esc>:NERDTreeToggle<CR>

" ,ci NERDCommneter


" Tabularize
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a<Space> :Tab/<Space><CR> 

" Tagbar
let g:tagbar_sort = 0
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_type_javascript = {
    \ 'ctagstype' : 'JavaScript',
    \ 'kinds'     : [
        \ 'o:objects',
        \ 'f:functions',
        \ 'a:arrays',
        \ 's:strings',
        \ 'c:comments'
    \ ]
\ }

map <F4> :TagbarToggle<CR>
