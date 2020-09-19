"Plugins
" ---
call plug#begin('~/.local/share/nvim/plugged')

"" Completion/lsp/linting/snippets

" Lsp {{{
" I've heard coc is nice, maybe will try that later (addenda: wait that's npm >:( no can do).
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'

let g:lsp_diagnostics_enabled = 0

function! s:on_lsp_buffer_enabled() abort
    call deoplete#enable()
    setlocal omnifunc=lsp#complete
    "setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> <f2> <plug>(lsp-rename)
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Ccls config {{{
if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': {'cache': {'directory': '/tmp/ccls/cache' }},
      \ 'whitelist': ['c', 'cc', 'h'],
      \ })
endif
"}}}
"}}}

" Completion
Plug 'lighttiger2505/deoplete-vim-lsp'
Plug 'Shougo/deoplete.nvim'

" Ultisnips
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

"" Filetype specific
" PureScript
Plug 'purescript-contrib/purescript-vim'

" C
Plug 'NLKNguyen/c-syntax.vim'

" Haskell
Plug 'neovimhaskell/haskell-vim'
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }

" Sxhkd
Plug 'baskerville/vim-sxhkdrc'


"" Miscellaneous
" Aesthetic
Plug 'chriskempson/base16-vim' " Frienship ended with pywal, now base16 is my bff.
Plug 'mike-hearn/base16-vim-lightline'
Plug 'itchyny/lightline.vim'   " Featherweight modeline.

" Movement
Plug 'junegunn/vim-easy-align'
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
Plug 'tpope/vim-commentary' " Comment operator.
Plug 'tpope/vim-repeat'     " Make the dot command work with plugins.
Plug 'tpope/vim-surround'

" Quality of Life
Plug 'tpope/vim-fugitive'   " Overpowered vim gitting.
Plug 'tpope/vim-unimpaired' " Tpope's quality of life pair-bindings.
Plug 'jesseleite/vim-noh'   " Make hlsearch bearable.

call plug#end()

" UI settings
" ---
set termguicolors
colorscheme base16-embers
let g:lightline = {
            \ 'colorscheme': 'base16_embers',
            \ }
set noshowmode

set laststatus=2
set showtabline=1

set hidden

set foldmethod=marker
set expandtab tabstop=4 shiftwidth=4
set splitright splitbelow " Better split defaults.
set scrolloff=3           " Keep some distance between the cursor and the top/bottom.

set relativenumber

" Show trailing spaces and tabs visibly
set list listchars=tab:▸▸,trail:·

set completeopt+=preview

" Don't show the intro screen
set shortmess+=I

" Keybindings
" ---
let mapleader=' '

" Less strain on the hands == happier hands
tnoremap jk <c-\><c-n>
" I use caps lock as escape now so this is redundant
"inoremap jk <esc>

" :shrug:
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" D == d$ and C == c$ but Y == yy??
nnoremap Y y$

" vimrc related bindings
nnoremap <leader>v :tabe $MYVIMRC<cr>
nnoremap <leader>s :source $MYVIMRC<cr>
nnoremap <leader>p :PlugInstall<cr>

nnoremap <leader>w :up<cr>
"inoremap <silent><esc>    <esc>:up<cr>

nnoremap <leader>f  :Files<cr>
nnoremap <leader>c  :Files ~/.config<cr>
nnoremap <leader>bd :bp<bar>bd #<cr>

nnoremap <silent><leader>g :Goyo<cr>
nnoremap zx        ZZ

" Segregated system clipboard
nmap <leader>y "+y
nmap <leader>d "+d
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Split switching commands
nnoremap <leader>h <c-w>h
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
nnoremap <leader>l <c-w>l

nnoremap <Leader>H <c-w>H
nnoremap <Leader>J <c-w>J
nnoremap <Leader>K <c-w>K
nnoremap <Leader>L <c-w>L

"" Easily switch between .c and .h
" There are probably way better ways/plugins to do this but this works for me
map <F4> :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
