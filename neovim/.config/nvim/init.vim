let mapleader="\<SPACE>"

" Plugins
call plug#begin('~/.local/share/nvim/plugged')
  " Plug 'metalelf0/supertab'
  Plug 'mhartington/oceanic-next'
  Plug 'dracula/vim'
  Plug 'altercation/vim-colors-solarized'
  Plug 'joshdick/onedark.vim'
  Plug 'mhartington/oceanic-next'
  Plug 'sheerun/vim-polyglot'

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  " {{{
    set rtp+=~/.fzf/bin/fzf
    nnoremap <silent> <Leader>o :FZF<CR>

    command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --hidden --fixed-strings --follow --ignore-case -g "!guides/*" -g "!.git/*" -g "!log/*" -g "!*.bundle.*.js" -g "!vendor" -g "!static/*" --color=always '.shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%'))

    nnoremap <silent> <Leader>f :Rg<space>
  " }}}

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " {{{
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#buffer_idx_mode = 1
    nmap <leader>1 <Plug>AirlineSelectTab1
    nmap <leader>2 <Plug>AirlineSelectTab2
    nmap <leader>3 <Plug>AirlineSelectTab3
    nmap <leader>4 <Plug>AirlineSelectTab4
    nmap <leader>5 <Plug>AirlineSelectTab5
    nmap <leader>6 <Plug>AirlineSelectTab6
    nmap <leader>7 <Plug>AirlineSelectTab7
    nmap <leader>8 <Plug>AirlineSelectTab8
    nmap <leader>9 <Plug>AirlineSelectTab9
    nmap <A-]> <Plug>AirlineSelectPrevTab
    nmap <A-[> <Plug>AirlineSelectNextTab
  " }}}

  Plug 'christoomey/vim-tmux-navigator'
  " {{{
    let g:tmux_navigator_no_mappings = 1

    nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
    nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
    nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
    nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
    " nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
  " }}}
  Plug 'edkolev/tmuxline.vim'

  Plug 'sjl/gundo.vim'
  " {{{
    set undodir=~/.vim/undodir
    set undofile
    nnoremap <silent> <Leader>gu :GundoToggle<CR>
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
  " {{{
    vmap <leader>c :Commentary<CR>
    nmap <leader>c :Commentary<CR>
  " }}}

  Plug 'tpope/vim-endwise'

  Plug 'scrooloose/nerdtree'
  " {{{
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    nnoremap - :NERDTreeToggle<CR>
  " }}}

  Plug 'othree/javascript-libraries-syntax.vim'
  " {{{
    let g:user_javascript_libs = 'underscore,jquery,react'
  " }}}
  
  Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'leafgarland/typescript-vim'

  " RUST
  Plug 'cespare/vim-toml'
  Plug 'rust-lang/rust.vim'
  " {{{
    let g:rustfmt_autosave = 1
    let g:rustfmt_command = "cargo fmt -- "
    au FileType rust nmap <C-]> <Plug>(rust-def)
    au FileType rust nmap gs <Plug>(rust-def-split)
    au FileType rust nmap gx <Plug>(rust-def-vertical)
    au FileType rust nmap <leader>gd <Plug>(rust-doc)
  " }}}
  Plug 'racer-rust/vim-racer'

  Plug 'vim-syntastic/syntastic'
  " {{{
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    " let g:syntastic_rust_checkers = ['cargo']
  " }}}

  " TERRAFORM
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
    " let g:user_emmet_mode='a'
    let g:user_emmet_expandabbr_key='<Tab>'
    imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
  " }}}

  Plug 'airblade/vim-gitgutter'
  " {{{
    let g:gitgutter_map_keys = 0
    let g:gitgutter_max_signs = 200
    let g:gitgutter_realtime = 1
    let g:gitgutter_eager = 1
    let g:gitgutter_sign_removed = '–'
    let g:gitgutter_diff_args = '--ignore-space-at-eol'
  " }}}

  Plug 'mattn/webapi-vim'
  Plug 'mattn/gist-vim'
  " {{{
    let g:gist_clip_command = 'pbcopy'
    let g:gist_detect_filetype = 1
    let g:gist_open_browser_after_post = 1
    let g:gist_post_private = 1
  " }}}
  
  Plug 'roxma/nvim-completion-manager', { 'do' : 'pip3 install neovim psutil setproctitle' }
  " {{{
    Plug 'roxma/nvim-cm-tern'
    Plug 'roxma/ncm-flow', {'do': 'npm i -g flow-bin'}
    Plug 'roxma/ncm-rct-complete'
    Plug 'calebeby/ncm-css'
  " }}}

  " Toggle cursor style in different modes
  Plug 'jszakmeister/vim-togglecursor'

call plug#end()

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

" Python
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

" Soft line wrapping
set wrap
set linebreak
set nolist

" Setup mouse
set mouse=a mousemodel=popup " Click to bring cursor to mouse position

set noerrorbells        " No beeps.
set modeline            " Enable modeline.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

set notimeout
set ttimeout
set timeoutlen=10
set ttimeoutlen=0

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

" Theme

syntax enable
set t_ut=

if exists('$TMUX')
  let &t_8f = "<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "<Esc>[48;2;%lu;%lu;%lum"
endif

set termguicolors
" set background=dark
colorscheme OceanicNext
let g:airline_theme='oceanicnext'

" Copy Pasting.....
nnoremap Y "+

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

