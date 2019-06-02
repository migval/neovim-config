call plug#begin('~/.local/share/nvim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'scrooloose/nerdtree'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
Plug 'carlitux/deoplete-ternjs'

Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim', { 'for': 'html' }

Plug 'pangloss/vim-javascript'
Plug 'w0rp/ale'

Plug 'Shougo/neosnippet.vim'

call plug#end()


set number
syntax enable

let g:javascript_plugin_flow = 1

set termguicolors  
colorscheme onedark  

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set scroll=10


let mapleader=","

"Exit insert mode
ino jj <Esc>

"Enter command mode
nno <Space> :

"Hide search highligth
nno \ :noh<cr>

"Open this config file
nmap <leader>rc :tabnew <cr> e ~/.config/nvim/init.vim <cr>

"open snippets folder in new tab
nmap <leader>sp :tabnew <cr> e ~/.config/nvim/snippets <cr>

"Move between tabs
nmap <S-H> :tabp <cr>
nmap <S-L> :tabn <cr>
nmap <M-T> :tabnew <cr>

"Move between splits
nnoremap J <C-W><C-H>
nnoremap K <C-W><C-L>

"Scroll
nmap <M-j> <C-D>
nmap <M-k> <C-U>

" -----------------------------------------------------------------
" ------------------------- NERDTREE ------------------------------
" -----------------------------------------------------------------
"
nmap <leader>e :NERDTreeToggle <cr>


" -----------------------------------------------------------------
" ------------------------- DEOPLETE ------------------------------
" -----------------------------------------------------------------
"

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ['tern']
let g:tern#arguments = [' — persistent']

function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()

" -----------------------------------------------------------------
" ------------------------- NEOSNIPPETS ---------------------------
" -----------------------------------------------------------------
"

let g:neosnippet#snippets_directory='~/.config/nvim/snippets'
let g:neosnippet#disable_runtime_snippets={ '_': 1 }


imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)


" -----------------------------------------------------------------
" ------------------------- ALE LINTER ----------------------------
" -----------------------------------------------------------------

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1 
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'


let g:user_emmet_leader_key=','


" Reinicia la configuración del editior al guardar cambios en 
"   este archivo
autocmd! bufwritepost init.vim source %



