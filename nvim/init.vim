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
set viminfo='100,<1000,s10,h
set clipboard+=unnamed

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

if &term =~ '^screen'
  " tmux knows the extended mouse mode
  set ttymouse=xterm2
endif


set hls
set wildmode=list:longest "autocomplete like bash
set ignorecase
set smartcase
set incsearch
"============= END: common settings ==================

call plug#begin('~/.nvim/plugged')

" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'

" Completion framework
Plug 'hrsh7th/nvim-cmp'

" LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'

" To enable more of the features of rust-analyzer, such as inlay hints and more!
Plug 'simrat39/rust-tools.nvim'
" Snippet completion source for nvim-cmp

" Other usefull completion sources
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'

" See hrsh7th's other plugins for more completion sources!

" Snippet engine
Plug 'hrsh7th/vim-vsnip'


" THEMES
Plug 'morhetz/gruvbox'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'chriskempson/base16-vim'
Plug 'jacoborus/tender.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'drewtempelmeyer/palenight.vim'

"File Browser:
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'mkitt/tabline.vim'

"File Search:
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"Golang:
Plug 'crispgm/nvim-go'

"For golang and rust
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

"Git:
Plug 'APZelos/blamer.nvim'

" do not forget install apt-get install silversearcher-ag
Plug 'ggreer/the_silver_searcher'
Plug 'BurntSushi/ripgrep'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

"=============== START: plugin settings ================
"let g:blamer_enabled = 1

"THEMES:
" set background=dark
" colorscheme gruvbox
" colorscheme onehalfdark
" set termguicolors     " enable true colors support
" let ayucolor="dark"   " for dark version of theme
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" colorscheme ayu
" colorscheme palenight
colorscheme tender


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
let $FZF_DEFAULT_COMMAND = "find -L -not \\( -path ./vendor -prune \\) -type f"
"=============== END: plugin settings ==================


"=============== START: go settings ==================
" https://github.com/crispgm/nvim-go
lua <<EOF
require('go').config.update_tool('quicktype', function(tool)
    tool.pkg_mgr = 'npm'
end)

local golang_opts = {
    auto_format = true,
    auto_lint = true,
    -- linters: revive, errcheck, staticcheck, golangci-lint
    linter = 'golangci_lint',
    -- qf or vt
    lint_prompt_style = 'qf',
    formatter = 'goimports',
    test_flags = {'-v'},
    test_timeout = '30s',
    test_env = {},
    test_popup = true,
    test_popup_width = 80,
    test_popup_height = 10,
    test_open_cmd = 'edit',
    tags_name = 'json',
    tags_options = {'json=omitempty'},
    tags_transform = 'snakecase',
    tags_flags = {'-skip-unexported'},
    quick_type_flags = {'--just-types'},
}
-- setup nvim-go
require('go').setup(golang_opts)
-- setup lsp client
require('lspconfig').gopls.setup({})
EOF

"=============== END: go settings ====================

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

local rust_opts = {
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

require('rust-tools').setup(rust_opts)
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
"
" Code navigation shortcuts for LSP
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>

nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <c-w> <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
" set updatetime=1000
" Show diagnostic popup on cursor hold
" autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
" nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
