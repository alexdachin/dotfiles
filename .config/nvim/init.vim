" Common
set number          " show line number
set nocursorline    " do not highlight current line
syntax on           " syntax highlight
set autoindent      " autoindent
set copyindent      " copy the previous indentation on autoindenting
set incsearch       " show search results as i type
set list            " display invisible characters
let mapleader = ',' " set leader to comma

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

" Yank to clipboard the current file and line
nmap <leader>yfl :execute 'let @+ = "'.expand('%').':'.line('.').'"'<cr>
nmap <leader>yff :execute 'let @+ = "'.expand('%').'"'<cr>

" Buffers
nmap <leader>bd :bp<cr>:bd #<cr>
nmap <leader>bn :bn<cr>
nmap <leader>bp :bp<cr>
nmap <leader>b# :b #<cr>

" Terminal
lua << EOF
vim.api.nvim_set_keymap('n', '<leader>tjf', [[<cmd>lua kitty_window_with('jest ' .. vim.fn.expand('%'))<cr>]], { silent = true })
vim.api.nvim_set_keymap('n', '<leader>tjw', [[<cmd>lua kitty_window_with('jest ' .. vim.fn.expand('%') .. ' --watch')<cr>]], { silent = true })
vim.api.nvim_set_keymap('n', '<leader>tmf', [[<cmd>lua kitty_window_with('mocha ' .. vim.fn.expand('%'))<cr>]], { silent = true })
vim.api.nvim_set_keymap('n', '<leader>tmw', [[<cmd>lua kitty_window_with('mocha ' .. vim.fn.expand('%') .. ' --watch')<cr>]], { silent = true })
vim.api.nvim_set_keymap('n', '<leader>trf', [[<cmd>lua kitty_window_with('rspec ' .. vim.fn.expand('%'))<cr>]], { silent = true })
vim.api.nvim_set_keymap('n', '<leader>trl', [[<cmd>lua kitty_window_with('rspec ' .. vim.fn.expand('%') .. ':' .. vim.fn.line('.'))<cr>]], { silent = true })

function kitty_window_with(command)
  os.execute('kitty @ --to $KITTY_LISTEN_ON launch --cwd current --no-response')
  os.execute('kitty @ --to $KITTY_LISTEN_ON send-text ' .. command .. '\\\x0d')
end
EOF

" Tab size
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Plugins
call plug#begin()
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-startify'
Plug 'phaazon/hop.nvim'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
call plug#end()

" Colorscheme
set background=dark
colorscheme nord

" Hop
lua << EOF
require'hop'.setup()
vim.api.nvim_set_keymap('', '<space>f', [[<cmd>lua require'hop'.hint_char1()<cr>]], { silent = true })
EOF

" Deoplete
let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Fzf
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--info=inline']}), <bang>0)
command! -bang -nargs=? -complete=dir GFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview({'options': ['--info=inline']}), <bang>0)
command! -bang -nargs=? -complete=dir Buffers
  \ call fzf#vim#buffers(fzf#vim#with_preview({'options': ['--info=inline']}), <bang>0)

nmap <leader>fs :Files<cr>
nmap <leader>fg :GFiles --exclude-standard --others --cached<cr>
nmap <leader>bl :Buffers<cr>

" GitGutter
nmap <leader>gg :GitGutter<cr>
let g:gitgutter_max_signs = 900
let g:gitgutter_diff_args = '-w'

" Fugitive
nmap <leader>gb :Gblame<cr>

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
nmap <leader>ff :NERDTreeFind<cr>

" Ale
let g:ale_completion_autoimport = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'javascript': ['eslint'],
\ 'typescript': ['eslint'],
\ 'typescriptreact': ['eslint'],
\ 'terraform': ['terraform'],
\ 'rust': ['rustfmt'],
\}
let g:ale_linters = {
\ 'javascript': ['eslint', 'tsserver'],
\ 'typescript': ['eslint', 'tsserver', 'typecheck'],
\ 'ruby': ['ruby'],
\ 'rust': ['cargo', 'rls', 'rustc'],
\}

nmap <leader>ad :ALEDocumentation<cr>
nmap <leader>ag :ALEGoToDefinition<cr>
nmap <leader>ah :ALEHover<cr>
nmap <leader>aj :ALENext<cr>
nmap <leader>ak :ALEPrevious<cr>