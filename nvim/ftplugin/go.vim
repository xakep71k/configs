let g:ale_go_golangci_lint_package=1
let g:ale_go_golangci_lint_options=''
let g:ale_linters = {'go': ['golangci-lint', 'golint']}
autocmd BufWritePre * :GoImports
