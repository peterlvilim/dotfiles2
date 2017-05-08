" plugins
set nocompatible " break backwards compatibility
set backspace=2
set encoding=utf-8
" install all plugins in bundle folder
filetype plugin on " enable vim files on a filetype basis (see ftplugin folder)
filetype off
if has('nvim')
    let s:editor_root=expand("~/.config/nvim")
else
    let s:editor_root=expand("~/.vim")
endif
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
call vundle#rc(s:editor_root . '/bundle')
Plugin 'VundleVim/Vundle.vim'
Plugin 'edkolev/promptline.vim'
Plugin 'rking/ag.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
call vundle#end()            " required
filetype plugin indent on    " required

" colors
colorscheme Tomorrow" set color scheme to bad solarized
set background=light " use a dark color theme
let g:solarized_termcolors = 16 " use 16 color solarized
let g:solarized_termtrans =   0 " disable compability
let g:solarized_degrade   =   0 " disable compatibility
let g:solarized_bold      =   1 " enable bold fonts
let g:solarized_underline =   1 " enable underline fonts
let g:solarized_italic    =   1 " enable italic fonts
let g:solarized_contrast  =   "normal" " default contrast for text
let g:solarized_visibility=   "normal" " dfault visibility for text
syntax on " enable syntax highlighting


set title " display doc name in terminal title
set showcmd             " show command in bottom bar
set ttyfast " force fast tty (should enable by default on urxvt)
set cmdheight=2

" temp files
set nobackup " don't write backup files since I use git
set nowb " don't write backup files since I use git
set noswapfile " dont write swap files
inoremap jk <Esc>| " remap pressing jk in insert mode to exiting insert mode

" formatting
set tabstop=8       " number of visual spaces per TAB
set softtabstop=0   " number of spaces in tab when editing
set expandtab       " tabs are spaces
filetype indent on      " load filetype-specific indent settings
set shiftwidth=4
set smarttab " smart tab indenting as you edit code

" movement
nnoremap B ^| " move to beginning of line
nnoremap E $| " move to end of line
nnoremap dB d^| " also remap delete
nnoremap dE d$| " also remap delete
vnoremap B ^| " also remap visual mode
vnoremap E $| " also remap visual mode
nnoremap j gj| " move by visual line
nnoremap k gk| " move by visual line
nnoremap K <C-B> " page up
nnoremap J <C-F> " page down
let mapleader="," " map leader from \ to ,
nnoremap <C-h> <C-w>h| " move window left
nnoremap <C-j> <C-w>j| " move window down
nnoremap <C-k> <C-w>k| " move window up
nnoremap <C-l> <C-w>l| " move window right
nmap <Space> i_<Esc>r| " use space to insert one char
set scrolloff=2 " keep two lines on screen when scrolling
nnoremap <tab> %
vnoremap <tab> %
" swap marker keys
nnoremap ' `
nnoremap ` '

" Next quickfix
nnoremap [l :lprev<CR><CR>| " go to previous
nnoremap ]l :lnext<CR><CR>| " go to previous

" Revert Git hunk
nnoremap <leader>g :GitGutterRevertHunk<CR>

" Search
nnoremap <leader>a :Ag 

set viminfo='10,\"100,:20,%,n~/.viminfo " remember where in a file we were when we closed

nnoremap ; :| " map the ; to do the same as pressing SHIFT+;

" clipboard
let g:clipbrdDefaultReg = '+' " use xwindow clipboard for cutting and pasting

" search
set ignorecase " ignore case when searching
set smartcase " only use case if not all lower case in search
set hlsearch " highight search terms
set incsearch " show search results as you type
nmap <silent> ,/ :nohlsearch<CR>| " disable highlighting easily

set pastetoggle=<F2> " easy way to toggle paste mode if needed
set mouse=a " mouse support to avoid having to toggle paste mode
set number " line numbers

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
set laststatus=2
set shortmess=I

" status line
let g:airline_powerline_fonts = 1 " enable powerline symbols for status
let g:promptline_preset = {
        \'a' : [ promptline#slices#host() ],
        \'c' : [ promptline#slices#cwd() ],
        \'x' : [ promptline#slices#git_status() ],
        \'y' : [ promptline#slices#vcs_branch() ],
        \'warn' : [ promptline#slices#last_exit_code() ]}
let g:airline#extensions#whitespace#enabled = 0 " disable whitespace detection on status line

" tagbar
nnoremap <leader>t :TagbarOpenAutoClose<CR>| " command to open tagbar
let g:tagbar_compact = 1 " remove the help item
let g:tagbar_sort = 0 " sort by order in file

noremap <F1> <Esc>| " Avoid accidental hits of <F1> while aiming for <Esc>
nnoremap Q <nop>|  " Turn off Q

" python-mode
let g:pymode_folding = 0 " disable folding
let g:pymode_lint_on_write = 1 " enable lint on write (run manually)
let g:pymode_doc_bind = '' " disable doc key since it is used for page up
let g:pymode_lint_cwindow = 0 " disable open window for errors

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
set autochdir " Switch our directory to current open file

so ~/.config/nvim/autoload/WatchForChanges.vim

:nnoremap <leader>s a<C-X><C-S>| "use <leader>s to get spelling suggestions

" easytags
let g:easytags_suppress_report = 1

nnoremap <C-l> :redraw!<CR>| " force redraw
  let g:ycm_filetype_specific_completion_to_disable = {
          \ 'gitcommit': 1,
          \}

" gvim
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

"python start

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
let g:ycm_server_python_interpreter = '/usr/bin/python2'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
