lua require('init')
" set clipboard+=unnamedplus
" key mapping
" CTRL-S save
map <C-S> :w<CR>
inoremap <C-S> <C-o>:w<CR>
" CTRL-Q quite
map <C-Q> :q<CR>
inoremap <C-Q> <C-o>:q<CR>
map <C-X> :x<CR>
inoremap <C-X> <C-o>:x<CR>
" new tab
map <leader>t :tabnew 
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

" highlight double click 
"nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>

" Folding:
set foldmethod=indent
set foldlevel=99

" to fix copy in clipboard during remote connection
let g:clipboard = { 'name': 'xsel', 'copy': { '+': 'xsel -ib', '*': 'xsel -ip' }, 'paste': { '+': 'xsel -ob', '*': 'xsel -op' }, 'cache_enabled': 1 }

set relativenumber

" undo history
set undofile                " Save undos after file closes
set undodir=~/.local/share/nvim/undo " where to save undo histories
set undolevels=100000         " How many undos
set undoreload=1000000        " number of lines to save for undo
" keep cursor in the middle of the screen
"set so=999
set title

"THEMES:
set termguicolors     " enable true colors support
" set background=dark
" colorscheme gruvbox
" colorscheme onehalfdark
" let ayucolor="dark"   " for dark version of theme
" let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
colorscheme ayu
" colorscheme palenight
" colorscheme tender

"FILE BROWSER:
"-------------
"allows NERDTree to open/close by typing 'n' then 't'
" map nt :NERDTreeTabsToggle<CR>
map <C-n> :NERDTreeTabsToggle<CR>
"Start NERDtree when dir is selected (e.g. "vim .") and start NERDTreeTabs
let g:nerdtree_tabs_open_on_gui_startup = 2
let g:nerdtree_tabs_open_on_console_startup=2
"Add a close button in the upper right for tabs
" let g:tablineclosebutton=1
"Automatically find and select currently opened file in NERDTree
let g:nerdtree_tabs_autofind=1
"Add folder icon to directories
"Hide expand/collapse arrows
" let g:NERDTreeDirArrowExpandable = "+"
" let g:NERDTreeDirArrowCollapsible = "-"
" let g:NERDTreeDirArrowExpandable = "\u00a0"
" let g:NERDTreeDirArrowCollapsible = "\u00a0"
" let g:NERDTreeFileExtensionHighlightFullName = 1
" let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" let g:DevIconsEnableFoldersOpenClose = 1


let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
" highlight! link NERDTreeFlags NERDTreeDir
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let g:NERDTreeGitStatusUseNerdFonts = 1
" " you can add these colors to your .vimrc to help customizing
" let s:brown = "905532"
" let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
" let s:darkBlue = "44788E"
" let s:purple = "834F79"
" let s:lightPurple = "834F79"
" let s:red = "AE403F"
" let s:beige = "F5C06F"
" let s:yellow = "F09F17"
" let s:orange = "D4843E"
" let s:darkOrange = "F16529"
" let s:pink = "CB6F6F"
" let s:salmon = "EE6E73"
" let s:green = "8FAA54"
" let s:lightGreen = "31B53E"
" let s:white = "FFFFFF"
" let s:rspec_red = 'FE405F'
" let s:git_orange = 'F54D27'
let g:WebDevIconsDefaultFolderSymbolColor = s:blue " sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue " sets the color for files that did not match any rule
let g:WebDevIconsDefaultOpenFolderSymbolColor = s:blue
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1

let g:DevIconsDefaultFolderOpenSymbol='' " symbol for open folder (f07c)
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol='' " symbol for closed folder (f07b)

" let g:DevIconsDefaultFolderOpenSymbol='' " symbol for open folder (f07c)
" let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol='' " symbol for closed folder (f07b)

"FILE SEARCH:
"------------
"allows FZF to open by pressing CTRL-F
" map <C-p> :FZF<CR>
"allow FZF to search hidden 'dot' files
let $FZF_DEFAULT_COMMAND = "find -L -not \\( -path ./vendor -prune \\) -not \\( -path ./console -prune \\) -type f"

"=============== START: rust settings ================
" install sudo apt install build-essential
" https://sharksforarms.dev/posts/neovim-rust/
" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)
"=============== END: rust settings ==================

" Code navigation shortcuts for LSP
nnoremap <silent> <C-LeftMouse> <LeftMouse><cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>

nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>
" nnoremap <silent> <c-w> <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <leader>w <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
" set updatetime=1000
" Show diagnostic popup on cursor hold
" autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

" Goto previous/next diagnostic warning/error
nnoremap <silent> [d <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> ]d <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes

" Find files using Telescope command-line sugar.
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
map <C-p> :Telescope find_files<CR>
nnoremap <C-f> :Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
" nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
" ===================================================
" NOTE: You can use other key to expand snippet.
