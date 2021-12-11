augroup prewrites
   autocmd!
    autocmd BufWritePre,FileWritePre <buffer>  call goimports#Run() | GoFormat
augroup END

