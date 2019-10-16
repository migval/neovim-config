call plug#begin('~/.local/share/nvim/plugged')

"Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
Plug 'carlitux/deoplete-ternjs'

Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'easymotion/vim-easymotion'

Plug 'pangloss/vim-javascript'
Plug 'w0rp/ale'
Plug 'gabesoft/vim-ags'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'Shougo/neosnippet.vim'

call plug#end()

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  " For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  " Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
colorscheme gruvbox


set number

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set foldmethod=syntax   
set foldcolumn=1
let javascript_fold=1
set foldlevelstart=99

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
nmap <C-H> :tabp <cr>
nmap <C-L> :tabn <cr>
nmap <C-T> :tabnew <cr>

"Move between splits
nno <C-J> <C-W><C-H>
nno <C-K> <C-W><C-L>
nno <C-M> <C-W><C-J>
nno <C-I> <C-W><C-K>

"Scroll
nmap <S-J> <C-D>
nmap <S-K> <C-U>

nno <leader>f viwy/<C-r>"<cr>
vn <leader>f y/<C-r>"<cr>

"Search word in cursor global
nno <leader>fg :Ags<cr>

"Search text selected in visual mode global
vn <leader>fg y:Ags "<C-r>""<cr>

"Search files in sym links
let g:ctrlp_follow_symlinks = 1 

" -----------------------------------------------------------------
" ------------------------- NERDTREE ------------------------------
" -----------------------------------------------------------------
"

let g:NERDTreeWinSize=50
nmap <leader>e :NERDTreeToggle <cr>
nmap <leader>r :NERDTreeFind<cr>


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


imap <C-k>  <Plug>(neosnippet_expand_or_jump)
smap <C-k>  <Plug>(neosnippet_expand_or_jump)
xmap <C-k>  <Plug>(neosnippet_expand_target)


" -----------------------------------------------------------------
" ------------------------- ALE LINTER ----------------------------
" -----------------------------------------------------------------

let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1 
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:user_emmet_leader_key=','


" Reinicia la configuración del editior al guardar cambios en 
"   este archivo
autocmd! bufwritepost init.vim source %



