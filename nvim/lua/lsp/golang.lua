-- https://github.com/crispgm/nvim-go
require('go').config.update_tool('quicktype', function(tool)
    tool.pkg_mgr = 'npm'
end)

local golang_opts = {
    auto_format = true,
    -- linters: revive, errcheck, staticcheck, golangci-lint
    linter = 'golangci_lint',
    -- qf or vt
    auto_lint = false,
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
-- -- setup lsp client
local lspconfig = require'lspconfig'
lspconfig.gopls.setup({
    settings = {
        gopls =  {
            buildFlags =  {"-tags=licensing,pdk"}
        }
    }
})

