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

" Tab size
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

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

" Jenkinsfile syntax
autocmd BufNewFile,BufRead Jenkinsfile set syntax=tf

" Lua config
lua << EOF
require('terminal')
require('plugins')
EOF

" Plugin key bindings
map <silent> <space>f :lua require'hop'.hint_char1()<cr>
nmap <leader>ft :Neotree toggle<cr>
nmap <leader>ff :Neotree reveal<cr>
nmap <leader>fs :Telescope find_files<cr>
nmap <leader>fg :Telescope git_files<cr>
nmap <leader>bl :Telescope buffers<cr>
nmap <leader>rg :Telescope live_grep<cr>
nmap <leader>tr :Telescope treesitter<cr>
