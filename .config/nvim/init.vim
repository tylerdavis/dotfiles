let mapleader="\<SPACE>"

" Plugins
call plug#begin('~/.local/share/nvim/plugged')
  Plug 'mhartington/oceanic-next'

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  " {{{
    set rtp+=~/.fzf/bin/fzf
    nnoremap <silent> <Leader>o :FZF<CR>

    command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --hidden --fixed-strings --follow --ignore-case -g "!guides/*" -g "!.git/*" -g "!log/*" -g "!*.bundle.*.js" -g "!vendor" --color=always '.shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%'))

    nnoremap <silent> <Leader>f :Rg<space>
  " }}}

  Plug 'vim-airline/vim-airline'
  Plug 'ap/vim-buftabline'
  " {{{
    set hidden
    nnoremap <A-]> :bnext<CR>
    nnoremap <A-[> :bprev<CR>
  " }}}

  Plug 'terryma/vim-multiple-cursors'

  Plug 'sbdchd/neoformat'

  Plug 'ngmy/vim-rubocop'

  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-rake'
  Plug 'tpope/vim-bundler'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-endwise'

  Plug 'tpope/vim-vinegar'

  Plug 'othree/javascript-libraries-syntax.vim'
  " {{{
  let g:user_javascript_libs = 'uderscore,jquery,react'
  " }}}
  
  Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'leafgarland/typescript-vim'

  Plug 'hashivim/vim-terraform'
  " {{{
    let g:terraform_align=1
    autocmd FileType terraform setlocal commentstring=#%s
  " }}}

  Plug 'jiangmiao/auto-pairs'
  Plug 'easymotion/vim-easymotion'
  Plug 'Valloric/MatchTagAlways' 
  Plug 'mattn/emmet-vim'
  " {{{
    let g:user_emmet_install_global = 0
    autocmd FileType html,css,jsx EmmetInstall
    " let g:user_emmet_expandabbr_key='<tab>'
  " }}}

  Plug 'airblade/vim-gitgutter'
  " {{{
    let g:gitgutter_map_keys = 0
    let g:gitgutter_max_signs = 200
    let g:gitgutter_realtime = 1
    let g:gitgutter_eager = 1
    let g:gitgutter_sign_removed = '–'
    let g:gitgutter_diff_args = '--ignore-space-at-eol'
    nmap <silent> ]h :GitGutterNextHunk<CR>
    nmap <silent> [h :GitGutterPrevHunk<CR>
    nnoremap <silent> <Leader>gu :GitGutterRevertHunk<CR>
    nnoremap <silent> <Leader>gp :GitGutterPreviewHunk<CR><c-w>j
    nnoremap cog :GitGutterToggle<CR>
    nnoremap <Leader>gt :GitGutterAll<CR>
  " }}}
  
  Plug 'roxma/nvim-completion-manager', { 'do' : 'pip3 install neovim psutil setproctitle' }
  " {{{
    Plug 'roxma/nvim-cm-tern'
    Plug 'roxma/ncm-flow', {'do': 'npm i -g flow-bin'}
    Plug 'roxma/ncm-rct-complete'
    Plug 'calebeby/ncm-css'
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  " }}}

call plug#end()

let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

" Save all files on loss of focus
:au FocusLost * silent! wa

" Setup
syntax enable                     " Enable syntax highlighting
set autoread                      " Automatically read file if it has been changed outside of vim
set autowrite                     " Automatically :write before running commands
set backspace=2                   " allow backspace over line breaks
set clipboard+=unnamedplus        " use system clipboard
set gdefault                      " Replace all of the matches on a line, instead of just the first one
let g:html_indent_tags = 'li\|p' " Treat <li> and <p> tags like the block tags they are

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.

" Soft line wrapping
set wrap
set linebreak
set nolist

" Setup mouse
set mouse=a mousemodel=popup " Click to bring cursor to mouse position

set noerrorbells        " No beeps.
set modeline            " Enable modeline.
" set esckeys             " Cursor keys in insert mode.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

set notimeout
set ttimeout
set ttimeoutlen=10

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set nostartofline       " Do not jump to first character with page commands.


set hlsearch            " highlight search results
set incsearch           " incremental search
set showmatch
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).

" Change cursor shape on mode change
:let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

set wildignore+=tmp/** " Ignore stuff that can't be opened
set wildmenu " Enables a menu at the bottom of the vim window.
set wildmode=longest:full,full

" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler.
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
augroup END

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Colors
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme OceanicNext
let g:airline_theme='oceanicnext'


"""""""""""""""
" Leader Maps "
"""""""""""""""
" Exit insert mode with jj
:imap jj <Esc>
" Save all buffers and quit
nnoremap <Leader>wq :xa<CR>                 
nnoremap <Leader>w :w<CR>

" Split the window horizontally
nnoremap <Leader>- <C-w>s
" Split the window vertically
nnoremap <Leader>\ <C-w>v

" Switch to window to the left
nnoremap <silent> <C-A-h> <C-w>h
" Swith to window to the right
nnoremap <silent> <C-A-l> <C-w>l
" Switch to window below
nnoremap <silent> <C-A-j> <C-w>j
" Switch to window above
nnoremap <silent> <C-A-k> <C-w>k
" Close current window
nnoremap <silent> <C-A-c> :q<CR>


" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<CR>
