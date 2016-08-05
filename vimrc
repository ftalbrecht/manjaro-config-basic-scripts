set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'The-NERD-tree'
Bundle 'vimwiki'
Bundle 'vim-flake8'
Bundle 'virtualenv.vim'
Bundle '256-grayvim'
Bundle 'nuvola.vim'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-repeat'
Bundle 'kana/vim-textobj-entire'
Bundle 'kana/vim-textobj-line'
Bundle 'kana/vim-textobj-user'
Bundle 'kana/vim-textobj-underscore'
Bundle 'kana/vim-textobj-lastpat'
Bundle 'kana/vim-textobj-indent'
Bundle 'Lokaltog/powerline'
Bundle 'Lokaltog/powerline-fonts'
Bundle 'nelstrom/vim-qargs'
Bundle 'nelstrom/vim-visual-star-search'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'
Bundle 'baeuml/summerfruit256.vim'
Bundle 'freeo/vim-kalisi'
Bundle 'altercation/vim-colors-solarized'
Bundle 'lervag/vimtex'

filetype plugin indent on

set nopaste
set title
set mouse=a
autocmd VimResized * exe "normal! \<c-w>="

if has("gui_running")
  set timeout timeoutlen=1000 ttimeoutlen=100
  set laststatus=2
  set guioptions=aegimLt
  set guifont=DejaVu\ Sans\ Mono\ 10
  set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
elseif &term == 'xterm'
  set timeout timeoutlen=1000 ttimeoutlen=100
  set laststatus=2
  set t_Co=256
  let g:solarized_termcolors=256
  " colorscheme solarized
  set background=light
  set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
elseif &term == 'screen'
  set timeout timeoutlen=1000 ttimeoutlen=100
  set laststatus=2
  set t_Co=256
  let g:solarized_termcolors=256
  " colorscheme solarized
  set background=light
  set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
endif

let mapleader = ","
set hidden
set backspace=indent,eol,start
set number
set smartcase
set incsearch
set hlsearch
set wildmode=longest,list
set completeopt=menu,preview,longest
set errorfile=~/.python_traceback
set history=42

map Y y$
noremap ö ;
noremap Ö ,
noremap gö g;
noremap gÖ g,

nnoremap <expr> gV '`[' . strpart(getregtype(), 0, 1) . '`]'

vnoremap < <gv
vnoremap > >gv

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

nmap <silent> <Leader>cd :cd %:p:h<CR>
nmap <silent> <Leader>CD :lcd %:p:h<CR>

au! BufWritePost ~/.vimrcso ~/.vimrc
au! BufWritePost ~/.vim/vimrc so ~/.vimrc

augroup myfiletypes
  autocmd!
  autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END

autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType python setlocal textwidth=120
let g:pyflakes_use_quickfix = 0
let g:flake8_max_line_length=120
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

nmap ä <Leader><Leader>j
nmap Ä <Leader><Leader>k
vmap ä <Leader><Leader>j
vmap Ä <Leader><Leader>k

let g:ctrlp_extension = ['dir', 'line', 'bookmarkdir', 'tag']
let g:ctrlp_reuse_window = 'netrw\|help'
let g:ctrlp_user_command = 'find %s -mount -type f -not -regex ".*/\.[^./].*"'
noremap <Leader>pp :CtrlP<Space>
noremap <Leader>pD :CtrlPDir<CR>
noremap <Leader>pd :CtrlPBookmarkDir<CR>
noremap <Leader>pl :CtrlPLine<CR>
noremap <Leader>pt :CtrlPTag<CR>
noremap <Space> :CtrlPBuffer<CR>
noremap <C-Space> :CtrlPMRUFiles<CR>
noremap <C-@> :CtrlPMRUFiles<CR>

noremap <Leader>N :NERDTreeToggle<CR>
noremap <Leader>n :NERDTreeFind<CR>

let g:vimtex_latexmk_continuous = 0
let g:vimtex_latexmk_background = 0
let g:vimtex_latexmk_options = "-pdf -shell-escape -verbose -file-line-error -synctex=1 -interaction=nonstopmode"
let g:vimtex_quickfix_autojump = 1
let g:vimtex_quickfix_fix_paths = 1
let g:vimtex_quickfix_ignore_all_warnings = 1
let g:vimtex_imaps_disabled = ['e']
autocmd FileType tex setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType tex setlocal smartindent

map <buffer> <F10> ma:w<CR>:VimtexCompile<CR>:call vimtex#latexmk#errors_open(1)<CR>
imap <buffer> <F10> <ESC>ma:w<CR>:VimtexCompile<CR>:call vimtex#latexmk#errors_open(1)<CR>

" let g:UltiSnipsExpandTrigger = "<C-H>"

let g:LatexBox_show_warnings = 0
let g:LatexBox_viewer = 'runokular.sh'

" let g:UltiSnipsExpandTrigger = "<C-H>"
" let g:UltiSnipsListSnippets = "<c-space>"

autocmd BufReadPost fugitive://* set bufhidden=delete

nmap <F5> :TagbarToggle<CR>

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

set mouse=
set expandtab

let g:vimwiki_list = [{'path': '~/.vimwiki/'}]

inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> [B :blast<CR>

syntax on

" vertical line at 120 chars
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
" set colorcolumn=120

" set spell
" hi clear SpellBad
" hi SpellBad cterm=underline ctermfg=red
