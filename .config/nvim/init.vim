" Common
set number                     " show line number
set nocursorline               " do not highlight current line
syntax on                      " syntax highlight
set autoindent                 " autoindent
set copyindent                 " copy the previous indentation on autoindenting
set incsearch                  " show search results as i type
let mapleader = ','            " set leader to comma

" No swap files
set nobackup
set nowritebackup
set noswapfile

" No automatic <EOL> at the end of file
set noendofline
set nofixendofline

" File type settings
autocmd BufNewFile,BufRead *.vue set syntax=html

" Clipboard
vmap <space>y "+y
nmap <space>yy "+yy
nmap <space>p "+p
nmap <space>P "+P

" Buffers
nmap <leader>bd :bp<cr>:bd #<cr>
nmap <leader>bn :bn<cr>
nmap <leader>bp :bp<cr>
nmap <leader>b# :b #<cr>

" Tab size
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Terminal
nmap <leader>tjf :vsplit<cr>:execute 'terminal jest '.expand('%')<cr>
nmap <leader>tjw :vsplit<cr>:execute 'terminal jest '.expand('%').' --watch'<cr>
nmap <leader>trf :vsplit<cr>:execute 'terminal rspec '.expand('%')<cr>
nmap <leader>trl :vsplit<cr>:execute 'terminal rspec '.expand('%').':'.line('.')<cr>

" Plugins
call plug#begin()
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
Plug 'easymotion/vim-easymotion'
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
call plug#end()

" Colorscheme
set background=dark
colorscheme nord

" Deoplete
let g:deoplete#enable_at_startup = 1

" Fzf
nmap <leader>fs :Files<cr>
nmap <leader>bl :Buffers<cr>

" GitGutter
map <leader>g :GitGutter<cr>
let g:gitgutter_max_signs = 900
let g:gitgutter_diff_args = '-w'

" Easymotion
map <space>j <Plug>(easymotion-sol-j)
map <space>k <Plug>(easymotion-sol-k)
map <space>f <Plug>(easymotion-bd-f)

" Lightline
set laststatus=2
let g:lightline = {
\ 'colorscheme' : 'nord',
\ 'active': {
\   'left': [['mode', 'paste'], ['readonly', 'filename', 'modified']],
\ },
\ 'component_function': {
\   'filename': 'LightlineFilename',
\ }
\}

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

" NERDTree
let NERDTreeShowHidden = 1
nmap <leader>ft :NERDTreeToggle<cr>

" Ale
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\}
let g:ale_linters = {
\   'javascript': ['eslint', 'tsserver'],
\   'typescript': ['eslint', 'tsserver', 'typecheck'],
\}

nmap <leader>ag :ALEGoToDefinition<cr>
nmap <leader>ah :ALEHover<cr>
nmap <leader>ad :ALEDocumentation<cr>
