" Sample .vimrc file by Martin Brochhaus
" Additions by Richard Morley
" Further modifications by Adam Arsenault


" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

"Tell vim to remember certian things when we exit
"this is especially used here to recall the last position in a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" '10   : marks will be remembered for up to 10 previously edited files
" "100  : will save up to 100 lines for each register
" :20   : up to 20 lines of command-line history will be remembered
" %     : saves and restores the buffer list
" n...  : where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" Set the status line to indicate information...
" path to file in the buffer
" modified flag
" readonly flag
" help flag
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamed

set backspace=2


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
""autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
""au InsertLeave * match ExtraWhitespace /\s\+$/


" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
set t_Co=256
set background=dark
colorscheme mushroom


" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype on
filetype plugin indent on
syntax on

au BufNewFile,BufRead *.ejs set filetype=html

" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set wrap  " automatically wrap on load
set linebreak "linebreak upon wrap
set breakindent "indent the brokenline
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233


"" Useful settings
set history=700
set undolevels=700


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" run powerline
"set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
" Always show statusline
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display a tabline, even if there is only one tab
"set noshowmode "show/hide the default mode text (e.g -- INSERT -- below the statusline)

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_javascript_checkers = ['jshint']

" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
"" let g:ctrlp_max_height = 30
"" set wildignore+=*.pyc
"" set wildignore+=*_build/*
"" set wildignore+=*/coverage/*

" RM- USING YouCompleteMe INSEAD OF OTHER AUTO COMPLETION


" Using delimitMate
let delimitMate_expand_cr=1
let delimitMate_expand_space=1

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


