"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d

nnoremap <leader>d ""d
nnoremap <leader>D ""D
vnoremap <leader>d ""d

nnoremap O o<Esc>

set mouse=a                 " Enable mouse
set tabstop=2               " 
set shiftwidth=2            " 
set expandtab
set listchars=tab:\¦\       " Tab charactor 
set list
set foldmethod=syntax       " 
set foldnestmax=1
set foldlevelstart=0        "  
set number                  " Show line number
set relativenumber
set ignorecase              " Enable case-sensitive 
highlight CursorLineNr cterm=NONE ctermbg=15 ctermfg=8 gui=NONE guibg=#03dc08 guifg=#03dc08
set cursorline
set cursorlineopt=number
   
"new cus
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set expandtab
" Disable backup
set nobackup
set nowb
set noswapfile
set guifont=*

" Optimize 
set synmaxcol=200
set lazyredraw
au! BufNewFile,BufRead *.json set foldmethod=indent " Change foldmethod for specific filetype

" neovide config
set guifont=Cascadia\ Code\ PL,Delugia\ Nerd\ Font:h16
let g:neovide = v:true
let g:neovide_transparency = 0.9
let g:transparency = 0.9
let g:neovide_background_color = '#1B2020'.printf('%x', float2nr(255 * g:transparency))

syntax on

" Enable copying from vim to clipboard
if has('win32')
  set clipboard=unnamed  
else
  set clipboard=unnamedplus
endif

" Auto reload content changed outside
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
    \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == ''
      \ | checktime 
    \ | endif
autocmd FileChangedShellPost *
    \ echohl WarningMsg 
    \ | echo "File changed on disk. Buffer reloaded."
    \ | echohl None

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Resize pane
nmap <M-Right> :vertical resize +1<CR>    
nmap <M-Left> :vertical resize -1<CR>
nmap <M-Down> :resize +1<CR>
nmap <M-Up> :resize -1<CR>

" Search a hightlighted text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
nmap /\ :noh<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin list
" (used with Vim-plug - https://github.com/junegunn/vim-plug)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged/')
" Theme
  Plug 'joshdick/onedark.vim'                  " Dark theme
  Plug 'folke/tokyonight.nvim'
  Plug 'morhetz/gruvbox'
  Plug 'sainnhe/everforest'

" File browser
  Plug 'preservim/nerdTree'                     " File browser  
  Plug 'Xuyuanp/nerdtree-git-plugin'            " Git status
  Plug 'ryanoasis/vim-devicons'                 " Icon
  Plug 'tiagofumo'
          \ .'/vim-nerdtree-syntax-highlight'
  Plug 'unkiwii/vim-nerdtree-sync'              " Sync current file 
  "Plug 'PhilRunninger/nerdtree-buffer-ops'

" File search
  Plug 'junegunn/fzf', 
    \ { 'do': { -> fzf#install() } }            " Fuzzy finder 
  Plug 'junegunn/fzf.vim'

" Status bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

" Terminal
  Plug 'voldikss/vim-floaterm'                  " Float terminal

" Code intellisense
  Plug 'neoclide/coc.nvim', 
  \ {'branch': 'release'}                     " Language server protocol (LSP) 
  Plug 'pappasam/coc-jedi',                     " Jedi language server 
  Plug 'jiangmiao/auto-pairs'                   " Parenthesis auto 
  Plug 'alvan/vim-closetag'
  Plug 'mattn/emmet-vim' 
  Plug 'preservim/nerdcommenter'                " Comment code 
  Plug 'liuchengxu/vista.vim'                   " Function tag bar 
  Plug 'alvan/vim-closetag'                     " Auto close HTML/XML tag 
    \ { 
      \ 'do': 'yarn install '
              \ .'--frozen-lockfile '
              \ .'&& yarn build',
      \ 'branch': 'main' 
    \ }

" Code syntax highlight
  Plug 'yuezk/vim-js'                           " Javascript
"   Plug 'MaxMEllon/vim-jsx-pretty'               " JSX/React
  " Plug 'jackguo380/vim-lsp-cxx-highlight'       " C/C++
  " Plug 'uiiaoo/java-syntax.vim'                 " Java
  
" Debugging
  Plug 'puremourning/vimspector'                " Vimspector

" Source code version control 
"  Plug 'tpope/vim-ugitive'                     " Git infomation 
  Plug 'tpope/vim-rhubarb' 
  Plug 'airblade/vim-gitgutter'                 " Git show changes 
  Plug 'samoshkin/vim-mergetool'                " Git merge

  Plug 'xiyaowong/nvim-transparent'             "Transparent

  let g:transparent_enabled = v:true

  Plug 'mattn/emmet-vim'                        "Snippet Html

  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-rails'                        "Highlight
  Plug 'tpope/vim-endwise'                      "End
  Plug 'dense-analysis/ale'                     "linting
  Plug 'ngmy/vim-rubocop'                     "linting
  Plug 'slim-template/vim-slim'                 "Highlight slim

  
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set theme 
" colorscheme onedark
colorscheme gruvbox

" let g:gruvbox_contrast = 'soft'

" Overwrite some color highlight 
if (has("autocmd"))
  augroup colorextend
    autocmd ColorScheme 
      \ * call onedark#extend_highlight("Comment",{"fg": {"gui": "#728083"}})
    autocmd ColorScheme 
      \ * call onedark#extend_highlight("LineNr", {"fg": {"gui": "#728083"}})
  augroup END
endif

" Disable automatic comment in newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
let g:closetag_filenames = "*.html.erb,*.html,*.xhtml,*.phtml"
autocmd BufNewFile,BufRead *.html.erb set filetype-=html filetype-=rb

" Other setting
"for setting_file in split(glob(stdpath('config').'/settings/*.vim'))
"  execute 'source' setting_file
"endfor
let nvim_settings_dir = '~/.config//nvim/settings/'
execute 'source'.nvim_settings_dir.'airline.vim'
execute 'source'.nvim_settings_dir.'coc.vim'
execute 'source'.nvim_settings_dir.'floaterm.vim'
execute 'source'.nvim_settings_dir.'fzf.vim'
execute 'source'.nvim_settings_dir.'git.vim'
execute 'source'.nvim_settings_dir.'nerdcommenter.vim'
execute 'source'.nvim_settings_dir.'nerdtree.vim'
execute 'source'.nvim_settings_dir.'vimspector.vim'
execute 'source'.nvim_settings_dir.'ruby-vim.vim'
execute 'source'.nvim_settings_dir.'linting.vim'
execute 'source'.nvim_settings_dir.'mergetool.vim'
inoremap <C-r> <% %> <Esc>3h<Insert>
"execute 'source'.nvim_settings_dir.'vista.vim'
