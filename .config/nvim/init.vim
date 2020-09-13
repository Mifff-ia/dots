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
let g:UltiSnipsSnippetDirectories=["UltiSnips", "ultisnippets"]


"" Filetype specific
" PureScript
Plug 'purescript-contrib/purescript-vim'

" C
Plug 'NLKNguyen/c-syntax.vim'

" Latex
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

Plug 'KeitaNakamura/tex-conceal.vim'
set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none

" Common lisp
Plug 'vlime/vlime', {'rtp': 'vim/'}

let g:vlime_cl_impl = "my_sbcl"
function! VlimeBuildServerCommandFor_my_sbcl(vlime_loader, vlime_eval)
    return ["/bin/sbcl",
                \ "--userinit", expand("$HOME") . "/.config/sbcl/sbclrc"]
endfunction

" Haskell
Plug 'neovimhaskell/haskell-vim'
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" Sxhkd
Plug 'baskerville/vim-sxhkdrc'


"" Miscellaneous
" Aesthetic
Plug 'chriskempson/base16-vim' " Frienship ended with pywal, now base16 is my bff.
Plug 'mike-hearn/base16-vim-lightline'
Plug 'junegunn/goyo.vim'       " Distraction free mode.
Plug 'junegunn/limelight.vim'  " Dim out surrounding paragraphs.
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
"Plug 'rbong/vim-crystalline'
Plug 'itchyny/lightline.vim'   " Featherweight modeline.
"Plug 'dylanaraps/wal.vim'

" Movement
Plug 'junegunn/vim-easy-align'
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
Plug 'tpope/vim-commentary' " Comment operator.
Plug 'tpope/vim-repeat'     " Make the dot command work with plugins.
Plug 'tpope/vim-surround'

" Quality of Life
Plug 'junegunn/fzf', { 'dir': '~/.local/share/fzf', 'do': './install --no-bash' }
Plug 'junegunn/fzf.vim'     " Fuzzy fast searching for fun and profit.
Plug 'tpope/vim-eunuch'     " Vim sugar for unix commands.
Plug 'tpope/vim-fugitive'   " Overpowered vim gitting.
Plug 'tpope/vim-unimpaired' " Tpope's quality of life pair-bindings.
"Plug 'tpope/vim-vinegar'   " Netrw things
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
Plug 'jesseleite/vim-noh'   " Make hlsearch bearable.

"{{{ Wiki
Plug 'fcpg/vim-waikiki'
let g:waikiki_roots = ['~/doc/self/wiki/']
let g:waikiki_create_type = ''

let maplocalleader="-"
let g:waikiki_default_maps=1
" Journaling maps
nnoremap <leader>di :e ~/doc/wiki/index.md<cr>
nnoremap <leader>df :Files ~/doc/wiki/<cr>
nnoremap <leader>dd :e `=strftime($HOME."/doc/wiki/Journal/%Y/%B.md")`<cr>
"}}}

call plug#end()

" UI settings
" ---
set termguicolors
colorscheme base16-embers
let g:lightline = {
            \ 'colorscheme': 'base16_embers',
            \ }
" set noshowmode

set laststatus=2
set showtabline=1

set hidden

set foldmethod=marker
set expandtab tabstop=4 shiftwidth=4
set splitright splitbelow " Better split defaults.
set scrolloff=3           " Keep some distance between the cursor and the top/bottom.
set nohlsearch

set relativenumber

set list listchars=tab:▸▸,trail:·

set completeopt+=preview

set shortmess+=I

" Keybindings
" ---
let mapleader=' '

" Less strain on the hands == happier hands
tnoremap jk <c-\><c-n>
inoremap jk <esc>

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
