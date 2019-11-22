" install pugin installer
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale' " linter
Plug 'fatih/vim-go'
Plug 'ctrlpvim/ctrlp.vim' " used by vim-go
Plug 'SirVer/ultisnips' " https://github.com/fatih/vim-go/blob/master/gosnippets/UltiSnips/go.snippets
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" look & feel
Plug 'phanviet/vim-monokai-pro'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline' " used by ale and better look & feel

call plug#end()

" themes
set background=dark
colorscheme gruvbox

" nerdtree
map <C-n> :NERDTreeToggle<CR>

" vim-go
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1 " show type at bottom line

" ale
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
" let g:airline#extensions#ale#enabled = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_go_golangci_lint_package=1
let g:ale_go_golangci_lint_options=''
let g:ale_linters = {'go': ['golangci-lint', 'golint']}

" common vim settings
" autocmd BufWritePre *.go :GoBuild!
set hls
set mouse=a
set wildmode=list:longest "autocomplete like bash
set ignorecase
set incsearch
" remember last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

if has("gui_running")
	set go=a
	set guifont=Ubuntu\ Mono\ 18
else
	set mouse=nvi
endif

" key mapping
map <C-S> :w<CR>
map <C-Q> :q<CR>
