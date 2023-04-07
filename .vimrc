syntax enable
set autoread
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
set scrolloff=8
set sidescrolloff=8

"NerdTree mappings
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:NERDTreeChDirMode = 2
"set t_Co=256

" go to the position I was when last editing the file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

"Add python comments for commentary plugin
autocmd FileType sh,python,text setlocal commentstring=#\%s 

"Supposlively allows copy to system clipboard
set clipboard=unnamedplus
