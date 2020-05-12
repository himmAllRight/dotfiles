
if has('vim_starting')
    " Be iMproved
    set nocompatible
endif

if has('nvim')
    let s:plug_path = '~/.local/share/nvim/site/autoload/plug.vim'
    let s:plugged_path = '~/.local/share/nvim/plugged'
    let g:python_host_prog = '/usr/bin/python2'
    let g:python3_host_prog = '/usr/bin/python3'
else
    let s:plug_path = '~/.vim/autoload/plug.vim'
    let s:plugged_path = '~/.vim/plugged'
endif

" Load vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if !filereadable(expand(s:plug_path))
    echo 'Installing vim-plug...'
    echo ''
    execute "silent !curl -fLo " . s:plug_path . " --create-dirs "
        \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

    " Install plugins after loading vim
    autocmd VimEnter * PlugInstall
endif


""""""""""""""""""""""""""""""""""""""""
""""""""""""" Plug-Ins """""""""""""""""
""""""""""""""""""""""""""""""""""""""""
" Plugged System
call plug#begin(s:plugged_path)

" Bundles to install
Plug 'plasticboy/vim-markdown'
Plug 'w0rp/ale'
Plug 'nvie/vim-flake8'              " PEP 8 checking
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'           " Git integration
Plug 'itchyny/lightline.vim'        " Powerline clone
Plug 'terryma/vim-multiple-cursors' " Multuple cursorts
Plug 'kien/ctrlp.vim'
"Plug 'wakatime/vim-wakatime'
Plug 'sheerun/vim-polyglot'     " Collection of language packs
"Plug 'jceb/vim-orgmode'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Python
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'hynek/vim-python-pep8-indent'
Plug 'davidhalter/jedi-vim'
Plug 'jmcantrell/vim-virtualenv'
Plug 'janko-m/vim-test'

"Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Other
"Plug 'malithsen/trello-vim'

" Neovim only plugins
if has('nvim')
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'

    " IMPORTANT: :help Ncm2PopupOpen for more information
    set completeopt=noinsert,menuone,noselect

    " NOTE: you need to install completion sources to get completions. Check
    " our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-tmux'
    Plug 'ncm2/ncm2-path'

"    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"    Plug 'zchee/deoplete-jedi'
else
    " deoplete else
"    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
"let g:deoplete#enable_at_startup = 1

if has('autocmd')
    " Spelling
    autocm FileType gitcommit setlocal spell
    autocmd BufRead,BufNewFile *.md setlocal spell
    set complete+=kspell
endif

" Themes
Plug 'YorickPeterse/happy_hacking.vim'
Plug 'morhetz/gruvbox'
Plug 'abnt713/vim-hashpunk'
Plug 'fortes/vim-escuro'
Plug 'srcery-colors/srcery-vim'
Plug 'vim-scripts/Ambient-Color-Scheme'
Plug 'ayu-theme/ayu-vim'
Plug 'danilo-augusto/vim-afterglow'

call plug#end()

" Colorscheme
set termguicolors
let ayucolor="dark"
" Gruvbox
let g:gruvbox_contrast_dark = 'hard'
syntax enable
colo gruvbox

" Set Splits
set splitbelow
set splitright

" Clipboard
set clipboard=unnamedplus

" Increase preview window (ex: Gstatus) size
set previewheight=30

" Simple vimrc
set formatoptions+=t
let python_highlight_all=1
:set linebreak
:set showbreak=+++
:set hlsearch

" Automatically load a file changed outside
set autoread

" Enable autoindent
set autoindent

" Highlight current line
set cursorline

" Show line numbers
set number

" Show relative line numbers
"set relativenumber

" Markdown
let g:vim_markdown_folding_disabled = 1

" Enable mouse support in terminal
set mouse=a

" Always show cursor postion
set ruler

" Maximum width of text that is being inserted
set textwidth=79

" Show the filename in the window titlebar
set title

" Tab stuff
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set shiftround
set smarttab

" NERDTreeToggle shorthand
cnoreabbrev NTO NERDTreeToggle
cnoreabbrev NTR NERDTreeRefreshRoot

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Open splits at bottom
set splitbelow

" Open vertical splits at right
set splitright

" Smart way to move between buffers
map <M-D-Right> :tabnext<cr>
imap <M-D-Right> <esc>:tabnext<cr>a
map <M-D-Left> :tabprevious<cr>
imap <M-D-Left> <esc>:tabprevious<cr>a

" Set UTF-8
set encoding=utf-8

" Prefer pytest whenever it is available
if executable('py.test')
    let test#python#runner = 'pytest'
    let test#python#pytest#options = '-v'
endif

" Strip trailing whitespace
function! Preserve(command)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Map to strip trailing whitespace
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>

if has('autocmd')
    "Auto source .vimrc file when save it
    autocmd! BufWritePost .vimrc source $MYVIMRC

    " Strip trailing whitespace on save
    autocmd! BufWritePre * :call Preserve("%s/\\s\\+$//e")

    autocmd FileType css,html,htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2

    " Set spell on git commit messages
    autocmd FileType gitcommit setlocal spell

    " Better editing options for reStructuredText files
    autocmd FileType rst setlocal spell
endif
