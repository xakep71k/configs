" how to build vim on ubuntu
" sudo apt install build-essential libx11-dev libxt-dev libncurses5-dev libgtk-3-dev
" how to build vim on centos
" yum groupinstall 'Development Tools'
" yum install libX11-devel.x86_64 libXt-devel.x86_64 ncurses-devel.x86_64 gtk3-devel.x86_64
" git clone https://github.com/vim/vim.git
" cd vim/src
" ./configure --with-x --enable-gui=gtk3 --prefix=/home/alek/soft/vim
" make && make install

" install pugin installer
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" NOTES:
" https://sharksforarms.dev/posts/neovim-rust/

"============= START: common settings ================
" set clipboard+=unnamedplus
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
imap <C-Del> <Esc>lce
set backspace=indent,eol,start

set guifont=Ubuntu\ Mono\ 18

" stop using current folder for *.swp files
set directory-=.

"COPY/PASTE:
"-----------
vmap <C-c> "+yi
imap <C-v> <C-r><C-o>+
"Increases the memory limit from 50 lines to 1000 lines
:set viminfo='100,<1000,s10,h

"NUMBERING:
"----------

"INDENTATION:
"------------
"Highlights code for multiple indents without reselecting
vnoremap < <gv
vnoremap > >gv

"SOURCING:
"---------
"Automatically reloads neovim configuration file on write (w)
autocmd! bufwritepost init.vim source %

"MOUSE:
"------
"Allow using mouse helpful for switching/resizing windows
set mouse=a
if &term =~ '^screen'
  " tmux knows the extended mouse mode
  set ttymouse=xterm2
endif

"SWAP:
"-----
set dir=~/.local/share/nvim/swap/

"SYNTAX HIGHLIGHTING:
"--------------------
syntax on

"HIGHLIGHTING:
"-------------
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>
" Highlight the current line the cursor is on
set cursorline

"SHORTCUTS:
"----------
"Open file at same line last closed
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"TABS:
"----------
set expandtab ts=4 sw=4 ai

if has("gui_running")
	set go=a
	if has("win32")
		set guifont=Consolas:h14:cRUSSIAN:qDRAFT
	else
		set guifont=Ubuntu\ Mono\ 18
	endif
else
	set mouse=nvi
endif

set hls
set wildmode=list:longest "autocomplete like bash
set ignorecase
set smartcase
set incsearch
"============= END: common settings ==================

call plug#begin('~/.nvim/plugged')

if has("nvim")
" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'

" Completion framework
Plug 'hrsh7th/nvim-cmp'

" LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'

" To enable more of the features of rust-analyzer, such as inlay hints and more!
Plug 'simrat39/rust-tools.nvim'
" Fuzzy finder
" Optional
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
" Snippet completion source for nvim-cmp
Plug 'hrsh7th/cmp-vsnip'

endif


" Other usefull completion sources
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'

" See hrsh7th's other plugins for more completion sources!

" Snippet engine
Plug 'hrsh7th/vim-vsnip'


" Color scheme used in the GIFs!
" Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'

"File Browser:
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'mkitt/tabline.vim'
" Plug 'ryanoasis/vim-devicons'

"File Search:
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"Golang:
Plug 'dense-analysis/ale' " linter
Plug 'fatih/vim-go'
Plug 'ctrlpvim/ctrlp.vim' " used by vim-go
"Git:
Plug 'tpope/vim-fugitive'

Plug 'dense-analysis/ale' " linter

" do not forget install apt-get install silversearcher-ag
Plug 'ggreer/the_silver_searcher'
Plug 'BurntSushi/ripgrep'
call plug#end()

"=============== START: plugin settings ================

"THEMES:
set background=dark
colorscheme gruvbox


"FILE BROWSER:
"-------------
"allows NERDTree to open/close by typing 'n' then 't'
" map nt :NERDTreeTabsToggle<CR>
map <C-n> :NERDTreeTabsToggle<CR>
"Start NERDtree when dir is selected (e.g. "vim .") and start NERDTreeTabs
let g:nerdtree_tabs_open_on_gui_startup = 2
let g:nerdtree_tabs_open_on_console_startup=2
"Add a close button in the upper right for tabs
let g:tablineclosebutton=1
"Automatically find and select currently opened file in NERDTree
let g:nerdtree_tabs_autofind=1
"Add folder icon to directories
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
"Hide expand/collapse arrows
" let g:NERDTreeDirArrowExpandable = "\u00a0"
" let g:NERDTreeDirArrowCollapsible = "\u00a0"
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
highlight! link NERDTreeFlags NERDTreeDir


"FILE SEARCH:
"------------
"allows FZF to open by pressing CTRL-F
map <C-p> :FZF<CR>
"allow FZF to search hidden 'dot' files
let $FZF_DEFAULT_COMMAND = "find -L"


"let g:ale_sign_error = '⤫'
"let g:ale_sign_warning = '⚠'
let g:airline#extensions#ale#enabled = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_go_golangci_lint_package=1
let g:ale_go_golangci_lint_options=''
let g:ale_linters = {'go': ['golangci-lint', 'golint']}
"=============== END: plugin settings ==================


"=============== START: go settings ==================
"AUTO IMPORT:
"------------
let g:go_fmt_command = "goimports"

"AUTOCOMPLETE:
"-------------
"Cycle through completion entries with tab/shift+tab
inoremap <expr> <TAB> pumvisible() ? "\<c-n>" : "\<TAB>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<TAB>"
"Allow getting out of pop with Down/Up arrow keys
inoremap <expr> <down> pumvisible() ? "\<C-E>" : "\<down>"
inoremap <expr> <up> pumvisible() ? "\<C-E>" : "\<up>"

"SNIPPETS:
"---------
"Change default expand since TAB is used to cycle options
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"


"VIM-GO:
let g:go_auto_type_info = 1 " show type at bottom line
" disable preview window
set completeopt-=preview

"=============== END: go settings ====================

if has("nvim")
"=============== START: rust settings ================
" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c


" Configure LSP through rust-tools.nvim plugin.
" rust-tools will configure and enable certain LSP features for us.
" See https://github.com/simrat39/rust-tools.nvim#configuration
lua <<EOF
local nvim_lsp = require'lspconfig'

local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}

require('rust-tools').setup(opts)
EOF

" Setup Completion
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
lua <<EOF
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})
EOF
"=============== END: rust settings ==================
endif
