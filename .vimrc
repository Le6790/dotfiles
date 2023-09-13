"remap leader to space
nnoremap <SPACE> <Nop>
let mapleader = " "

syntax enable
"set autoread
set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized

" Spacing
set expandtab
set smarttab
set autoindent
"set smartindent
set tabstop=4
set softtabstop=0
filetype indent on

"UI Config
set number
set relativenumber
set numberwidth=4
set showcmd
set cursorline
set laststatus=2

"Search bar menu
set wildmenu

"Enables mouse support
set mouse=a 

"Set terminal color range
set term=screen-256color

"search case insensitive, if no upper case letters in search.
set ignorecase
set smartcase

"Set encoding to UTF-8
set encoding=UTF-8
                     
"Keep cursor near center of screen
set scrolloff=10
set sidescrolloff=10

"Move highlighted contents
"*Only works on V9.0+...
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"NerdTree mappings
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:NERDTreeChDirMode = 2

"Netrw 
nnoremap <leader>pv :Ex<CR>

"FZF
nnoremap <leader>pf :Files<CR>
nnoremap <leader>notes :Files ~/notes/<CR>

"navigate through buffers
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>ls :Buffers<CR>

"allow for backspacing
let backspace="indent,eol,start"

" go to the position I was when last editing the file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

"Add python comments for commentary plugin
autocmd FileType yml,sh,python,text setlocal commentstring=#\%s 

"Supposlively allows copy to system clipboard
set clipboard=unnamedplus
