" gvim gui tweaks
if has('gui_running')
  " set guifont=Fira\ Code\ Retina:h10
  " set guifont=Tamsyn8x16:h12 
  set guifont=Terminus:h12
  set guioptions-=T
  set guioptions-=L
endif

" syntax highlighting and line numbers
syntax on
set number

" spell check
" set spell

" let g:python_host_prog = 'C:\Python27\pythonw.exe'
let g:python_host_prog = 'C:\Users\rfink\Anaconda3\pythonw.exe'

set termguicolors

 
" More natural split management
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" map ctrl+n to open nerdtree
map <C-n> :NERDTreeToggle<CR>


" hide --insert-- 
set noshowmode

" let g:lightline = {
" \ 'colorscheme': 'wombat',
" \ }
" let g:lightline = { 'colorscheme': 'gruvbox' }
let g:lightline = { 'colorscheme': 'nord' }


set background=dark

" tabs -> 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4



" autosave
set autoread
set autowrite
set autowriteall

set encoding=utf-8

" better line wrapping and navigation
set breakindent
set showbreak=\\\\\
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" better hotkey for line complete
inoremap <C-l> <C-x><C-l>

call plug#begin('~/.nvim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'davidhalter/jedi-vim'
" Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' } 
" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'https://github.com/jiangmiao/auto-pairs.git'
Plug 'tpope/vim-sensible'
Plug 'morhetz/gruvbox'
Plug 'justinmk/vim-sneak'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-fugitive'
" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
" Plug 'w0rp/ale'
Plug 'mhinz/vim-startify'
" Plug 'https://github.com/ctrlpvim/ctrlp.vim.git', {'on': 'CtrlP'}
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'lervag/vimtex', { 'for': 'tex' }
" Initialize plugin system
call plug#end()

let g:deoplete#enable_at_startup = 1
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

" colorscheme gruvbox 
colorscheme nord
" save all buffers when losing focus
au FocusLost * :wa
au FocusGained * :redraw!

set autochdir

nnoremap <Leader>f :Files<CR>
nnoremap <Leader>b :Buffers<CR>

nnoremap <Leader>w :w<CR>
inoremap <Leader>w :w<CR>

set colorcolumn=80

" Stay in visual mode when indenting
vnoremap < <gv
vnoremap > >gv

" Make Y act more like D
noremap Y y$

"window resizing
nnoremap <up> :resize +5<cr>
nnoremap <down> :resize -5<cr>
nnoremap <left> :vertical resize -5<cr>
nnoremap <right> :vertical resize +5<cr>

tnoremap <Esc><Esc> <C-\><C-n>

" inoremap <C-Space> <C-n>

" set relativenumber

"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
set dictionary="/usr/dict/words"

let g:startify_custom_header = []

nnoremap <Leader>g :Gstatus<CR>
