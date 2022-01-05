require('bufferline').setup {
    options = {
        diagnostics = "nvim_diagnostic",
        diagnostics_update_in_insert = true,
        indicator_icon = '▎',
        -- buffer_close_icon = '',
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
    }
}
