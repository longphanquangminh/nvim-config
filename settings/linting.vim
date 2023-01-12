" In ~/.vim/vimrc, or somewhere similar.
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'ruby': [ 'standardrb','rubocop'],
\}
" Chỉ chạy linters có tên trong cài đặt ale_linters.
let g:ale_linters_explicit = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
" Set this variable to 1 to fix files when you save them.
" let g:ale_fix_on_save = 1
" let g:ale_completion_enabled = 1
