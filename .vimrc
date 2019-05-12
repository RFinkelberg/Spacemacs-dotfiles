" gvim gui tweaks
if has('gui_running')
  " set guifont=Fira\ Code\ Regular:h10
  set guifont=Hack:h10:cANSI:qDRAFT
  " set guifont=InputMonoCondensed:h10
  " set guifont=Iosevka:h10
  " set guifont=Terminus:h12
  set guioptions-=T
  set guioptions-=L
  set guioptions-=R
  set guioptions-=r
  set guioptions-=m
endif

call plug#begin('~/.viminimal/plugged')
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
call plug#end()

set splitbelow
set splitright

" aesthetic changes
set background=dark
syntax on 
colorscheme evening
filetype plugin indent on

" indentation settings
set expandtab
set autoindent
set tabstop=4
set shiftwidth=4

" Stay in visual mode when indenting
vnoremap < <gv
vnoremap > >gv

" autosave
set autoread

" better line wrapping and nagivation
set breakindent
set linebreak 
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" wildmenu 
set wildmenu
set wildmode=full

" hide --insert-- in gvim 
if has("gui_running")
    set noshowmode
endif


" auto cd to dir of current 
" file and enable better file :find 
autocmd BufEnter * silent! lcd %:p:h
set path+=**

" Make Y act more like D
noremap Y y$

" Minimalistic buffer navigation
nnoremap <Leader>b :ls<CR>:b<Space>

" Minimalistic fuzzy finding 
nnoremap <Leader>f :find<Space>


" window resizing
nnoremap <up> :resize +5<cr>
nnoremap <down> :resize -5<cr>
nnoremap <left> :vertical resize -5<cr>
nnoremap <right> :vertical resize +5<cr>


" convenient keybindings
nnoremap <Backspace> <C-^>
nnoremap <Space> :

" better word search
set incsearch
set ignorecase
set hlsearch
set smartcase
nnoremap <silent> <ESC><ESC> :noh<CR>

" More natural split management
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
tnoremap <C-J> <C-W><C-J>
tnoremap <C-K> <C-W><C-K>
tnoremap <C-L> <C-W><C-L>
tnoremap <C-H> <C-W><C-H>

