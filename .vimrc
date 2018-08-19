" gvim gui tweaks
if has('gui_running')
  set guifont=Fira\ Code\ Retina:h10
  " set guifont=Tamsyn8x16:h12 
  " set guifont=Terminus:h12
  set guioptions-=T
  set guioptions-=L
  set guioptions-=R
  set guioptions-=r
  set guioptions-=m
endif

" syntax highlighting and line numbers
syntax on
set number


" spell check
set spell
if has("gui_running")
    call plug#begin('~/.vim/plugged')

    " Make sure you use single quotes

    " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
    Plug 'junegunn/vim-easy-align'
    Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' } 
    " Any valid git URL is allowed
    Plug 'Valloric/YouCompleteMe', {'do': './install.py'}
    " if has('nvim')
    "   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    " else
    "   Plug 'Shougo/deoplete.nvim'
    "   Plug 'roxma/nvim-yarp'
    "   Plug 'roxma/vim-hug-neovim-rpc'
    " endif
    Plug 'https://github.com/jiangmiao/auto-pairs.git'
    Plug 'tpope/vim-sensible'
    Plug 'morhetz/gruvbox'
    Plug 'justinmk/vim-sneak'
    Plug 'itchyny/lightline.vim'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'w0rp/ale'
    " Plug 'airblade/vim-gitgutter'
    Plug 'mhinz/vim-signify'
    Plug 'mhinz/vim-startify'
    Plug 'https://github.com/tpope/vim-vividchalk.git'
    Plug 'https://github.com/ctrlpvim/ctrlp.vim.git', {'on': 'CtrlP'}
    " Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'tpope/vim-fugitive'
    Plug 'NLKNguyen/papercolor-theme'
    " Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'tpope/vim-vinegar'
    Plug 'dracula/vim', {'as': 'dracula'}
    " Plug 'lervag/vimtex', { 'for': 'tex' }
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'davidhalter/jedi-vim'
    " Initialize plugin system
call plug#end()
colorscheme dracula 
endif
" let g:python3_host_prog = "C:\Users\rfink\Anaconda3\python.exe"
" let g:deoplete#enable_at_startup = 1


" More natural split management
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
tnoremap <C-J> <C-W><C-J>
tnoremap <C-K> <C-W><C-K>
tnoremap <C-L> <C-W><C-L>
tnoremap <C-H> <C-W><C-H>


set splitbelow
set splitright


let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }
let g:lightline = {'colorscheme': 'one'}
set background=dark
" tabs -> 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4


" autosave
set autoread
" set autowrite
" set autowriteall

set encoding=utf-8

" better line wrapping and navigation
set breakindent
set showbreak=\\\\\
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" better hotkey for line complete
inoremap <C-l> <C-x><C-l>

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" wildmenu for better command completion
set wildmenu
set wildmode=full

" better tab navigation
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-Down> :tabclose<CR>


" alternate esc from i mode
inoremap jj <ESC>

" probably useless?
set nocompatible

" flash screen on error instead of beeping
set visualbell

" keep 3 lines above and below cursor when scrolling
set scrolloff=3

" keep indent when hitting enter
set autoindent

" hopefully makes things faster?
set ttyfast

" save all buffers when losing focus
" au FocusLost * :wa
au FocusGained * :redraw!

" ctrlP config

nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>fz :FZF<Space>~\
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>/ :Lines<CR>

" ultisnips config
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" remap \w to write in norm and inesrt mode
nnoremap <Leader>w :w<CR>
inoremap <Leader>w :w<CR>

" hide --insert-- 
if has("gui_running")
    set noshowmode
endif

" hide YCM preview window
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

" vimtex config
" let g:vimtex_view_general_viewer = "start"
let g:vimtex_view_enabled = 0

" auto cd to dir of current file
autocmd BufEnter * silent! lcd %:p:h

" highlight virtual column 80 to spot longer lines
set colorcolumn=80

" Stay in visual mode when indenting
vnoremap < <gv
vnoremap > >gv

" Make Y act more like D
noremap Y y$

" Minimalistic buffer navigation
" nnoremap <Leader>b :ls<CR>:b<Space>

" Set triangular lightline separators
let g:lightline.separator = {
	\   'left': '', 'right': ''
  \}
let g:lightline.subseparator = {
	\   'left': '', 'right': '' 
  \}
" let g:lightline.mode_map         = {
"       \ 'n': 'N', 'i': 'I', 'R': 'R', 'v': 'V', 'V': 'V', "\<C-v>": 'V',
"       \ 'c': 'C', 's': 'S', 'S': 'S', "\<C-s>": 'S', 't': 'T',
" \ }
" disable startify cowsay header
let g:startify_custom_header = []

"window resizing
nnoremap <up> :resize +5<cr>
nnoremap <down> :resize -5<cr>
nnoremap <left> :vertical resize -5<cr>
nnoremap <right> :vertical resize +5<cr>

function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
" inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
set dictionary="/usr/dict/words"

nnoremap <Backspace> <C-^>
nnoremap <Space> :
set incsearch
set ignorecase
set hlsearch
set smartcase
nnoremap <silent> <ESC><ESC> :noh<CR>
"sethhrelativenumber

tnoremap <Esc><Esc> <C-\><C-n>
