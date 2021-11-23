syntax on                                                                       
set noerrorbells                                                                
set shiftwidth=4                                                                
set incsearch                                                                   
set colorcolumn=80                                                              
highlight ColorColumn ctermbg=0 guibg=lightgrey                                 
set scrolloff=8                                                                 
set number                                                                      
set relativenumber                                                              
set tabstop=4 softtabstop=4                                                     
set expandtab                                                                   
set smartindent

"set signcolumn=yes


" New changes 

filetype on

set smarttab
set autoindent
set backspace=indent,eol,start

" When using / for search, will smartly search for case sensitive and insensitive
set smartcase
set splitbelow splitright

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

"set list
"set listchars=tab:▸\ ,trail:·
set mouse=a




" #################################################################################


" Remaps 


inoremap jk <Esc>
inoremap jj <Esc>
inoremap kj <Esc>

nnoremap Y y$

" Easy insertion of a trailing ; or , from insert mode
imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>

