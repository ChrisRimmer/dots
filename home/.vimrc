execute pathogen#infect()
syntax on
filetype plugin indent on

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
