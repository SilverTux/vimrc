set number

syntax enable

" Pathogen settings
execute pathogen#infect()
syntax on
filetype plugin indent on

" Solarized settings
set background=dark
colorscheme solarized

" Lightline settings
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
