" how to build vim on ubuntu
" sudo apt install build-essential libx11-dev libxt-dev libncurses5-dev libgtk-3-dev
" git clone https://github.com/vim/vim.git
" cd vim/src
" ./configure --with-x --enable-gui=gtk3 --prefix=/home/alek/soft/vim
" make && make install

" install pugin installer
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale' " linter
Plug 'fatih/vim-go'
Plug 'ctrlpvim/ctrlp.vim' " used by vim-go
" Plug 'SirVer/ultisnips' " https://github.com/fatih/vim-go/blob/master/gosnippets/UltiSnips/go.snippets
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" do not forget install apt-get install silversearcher-ag
Plug 'ggreer/the_silver_searcher'
" enable it when sudo apt-get install ripgrep will be available
" Plug 'BurntSushi/ripgrep'
" look & feel
Plug 'phanviet/vim-monokai-pro'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline' " used by ale and better look & feel
Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

" themes
set background=dark
colorscheme gruvbox

" nerdtree
map <C-n> :NERDTreeToggle<CR>

" vim-go
let g:go_fmt_command = "goimports"
" let g:go_auto_type_info = 1 " show type at bottom line

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
set smartcase
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
" CTRL-S save
map <C-S> :w<CR>
inoremap <C-S> <C-o>:w<CR>
" CTRL-Q quite
map <C-Q> :q<CR>
inoremap <C-Q> <C-o>:q<CR>
" CTRL-BACKSPACE delete a word in insert mode
" not work in terminal
imap <C-BS> <C-W>
set backspace=indent,eol,start
" copy/past
vmap <C-c> "+yi
imap <C-v> <C-r><C-o>+
