if has("termguicolors")
  set termguicolors
  if &t_8f == ''
    " The first characters after the equals sign are literal escape characters.
    set t_8f=[38;2;%lu;%lu;%lum
    set t_8b=[48;2;%lu;%lu;%lum
  endif
endif

syntax on
colorscheme Cherry

let g:startify_custom_header = [
\ '',
\ '                    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
\ '                    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
\ '                    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
\ '                    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
\ '                    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
\ '                    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
\ '',
\ '',
\ ]                     
                                
call plug#begin()
Plug 'mhinz/vim-startify'
call plug#end()
