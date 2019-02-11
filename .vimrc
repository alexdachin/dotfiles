" Common
set number          " show line number
set nocursorline    " do not highlight current line
syntax on           " syntax highlight
set t_Co=256        " 256 terminal colors
set backspace=2     " normal backspace key behaviour
set visualbell      " no beeping
set autoindent      " autoindent
set copyindent      " copy the previous indentation on autoindenting
set incsearch       " show search results as i type
let mapleader = ',' " set leader to comma

" No swap files
set nobackup
set nowritebackup
set noswapfile

" File type settings
autocmd BufNewFile,BufRead *.vue set syntax=html

" Plugins
call plug#begin()
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'itchyny/lightline.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'w0rp/ale', { 'for': ['javascript', 'typescript'] }
call plug#end()

" Colorscheme
set background=dark
colorscheme nord

" Lightline
set laststatus=2
let g:lightline = { 'colorscheme': 'nord' }

" Syntax
nmap <leader>ss :syntax sync fromstart<cr>
nmap <leader>sw :set syntax=whitespace<cr>
nmap <leader>sh :set syntax=html<cr>
nmap <leader>sj :set syntax=javascript<cr>
nmap <leader>sp :set syntax=python<cr>
nmap <leader>sr :set syntax=ruby<cr>

" Tab size
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" NERDTree
let NERDTreeShowHidden = 1
nmap <leader>t :NERDTreeToggle<cr>

" fzf
nmap <leader>f :Files<cr>

" ag
let g:ackprg = 'ag --vimgrep'
nmap <leader>a :Ack! 

" Clipboard
vmap <space>y "+y
nmap <space>yy "+yy
nmap <space>p "+p
nmap <space>P "+P

" Buffers
nmap <leader>bl :Buffers<cr>
nmap <leader>bd :bp<cr>:bd #<cr>
nmap <leader>bn :bn<cr>
nmap <leader>bp :bp<cr>
nmap <leader>b# :b #<cr>

" Easymotion
map <space>j <Plug>(easymotion-sol-j)
map <space>k <Plug>(easymotion-sol-k)
map <space>f <Plug>(easymotion-bd-f)

" GitGutter
map <leader>g :GitGutter<cr>
let g:gitgutter_max_signs = 900
let g:gitgutter_diff_args = '-w'

" No automatic <EOL> at the end of file
set noendofline
set nofixendofline

" Ale
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1

let g:ale_linters = {
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'tslint']
\}

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescript': ['prettier', 'tslint'],
\}
