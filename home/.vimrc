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

set showcmd

"====[ Make the 81st column stand out ]====================
    highlight ColorColumn ctermbg=magenta
    call matchadd('ColorColumn', '\%81v', 100)

"====[ Make trailing whitespace, and non-breaking spaces visible ]======
    exec "set listchars=tab:» ,trail:\uB7,nbsp:~"
    set list

"====[ Always turn on syntax highlighting for diffs ]=========================
    " use the filetype mechanism to select automatically...
    filetype on
    augroup PatchDiffHighlight
        autocmd!
        autocmd FileType  diff   syntax enable
    augroup END

"====[ Make CTRL-K list diagraphs before each digraph entry ]===============
    inoremap <expr> <C-K> ShowDigraphs()

    function! ShowDigraphs ()
        digraphs
        call getchar()
        return "\<C-K>"
    endfunction

    " But also consider the hudigraphs.vim and betterdigraphs.vim plugins,
    " which offer smarter and less intrusive alternatives

