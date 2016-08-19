# MOVE ME TO ~/.vimrc
execute pathogen#infect()
call pathogen#helptags()

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

syntax enable

if has('gui_running')
    colorscheme solarized
    set background=dark
else
    colorscheme ghostbuster
endif
