nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>

set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set expandtab
set shiftround
set smarttab
filetype plugin indent on

set hlsearch
set ignorecase
set incsearch
set smartcase

set history=1000

set number relativenumber

let swap_dir=expand("~/.vim/swap//")
let backup_dir=expand("~/.vim/backup//")
let undo_dir=expand("~/.vim/undo//")

silent !mkdir -p ~/.vim/swap/ >/dev/null 2>&1
silent !mkdir -p ~/.vim/backup/ >/dev/null 2>&1
silent !mkdir -p ~/.vim/undo/ >/dev/null 2>&1

set directory=~/.vim/swap//,/tmp
set backupdir=~/.vim/backup//,/tmp
set undodir=~/.vim/undo//,/tmp

set undofile

syntax on

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()
map <C-p> :ProjectFiles<CR>

inoremap <C-@> <C-x><C-o>
map <C-B> :NERDTreeToggle<CR>
