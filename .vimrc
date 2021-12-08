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


" Many ways to switch to normal mode
inoremap jk <Esc>
inoremap jj <Esc>
inoremap kj <Esc>

" Make Shift-Y behave like Shift-c or Shift-d
nnoremap Y y$

" When a mark is placed, '<letter> will mean go to the
" marked line but not column and `<letter> will mean 
" go to the exact line and column.
" ` is too far away from home row. 
" Now '<letter> === `<letter> 
nnoremap ' `

" Easy insertion of a trailing ; or , from insert mode
imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>

