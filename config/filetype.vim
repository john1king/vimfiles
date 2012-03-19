
" Some file types should wrap their text
function! s:setupWrapping()
  setlocal wrap linebreak nolist textwidth=80 
endfunction

" Short name
au Filetype js set ft=javascript
au Filetype rb set ft=ruby
au Filetype md set ft=markdown

au BufRead,BufNewFile *.rakefile set ft=ruby
au BufRead,BufNewFile *.{md,txt} set ft=markdown
au BufRead,BufNewFile *.json set ft=javascript

au Filetype snippet set noexpandtab
au Filetype markdown call s:setupWrapping()
