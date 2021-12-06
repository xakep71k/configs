return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'tpope/vim-fugitive'
    use 'tpope/vim-commentary'

    use 'neovim/nvim-lspconfig'

    -- Completion framework
    use 'hrsh7th/nvim-cmp'

    -- LSP completion source for nvim-cmp
    use 'hrsh7th/cmp-nvim-lsp'

    -- Other usefull completion sources
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'

    -- To enable more of the features of rust-analyzer, such as inlay hints and more!
    use 'simrat39/rust-tools.nvim'

    -- Snippet engine
    use 'rust-lang/vscode-rust'
    use 'golang/vscode-go'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'

    -- themes
    use 'morhetz/gruvbox'
    use { "sonph/onehalf", rtp = "vim" }
    use 'chriskempson/base16-vim'
    use 'jacoborus/tender.vim'
    use 'ayu-theme/ayu-vim'
    use 'drewtempelmeyer/palenight.vim'

    -- File Browser:
    use 'preservim/nerdtree'
    use 'jistr/vim-nerdtree-tabs'
    use 'Xuyuanp/nerdtree-git-plugin'
    use 'mkitt/tabline.vim'
    use 'ryanoasis/vim-devicons'
    use 'tiagofumo/vim-nerdtree-syntax-highlight'

    -- File Search:
    use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
    use {'junegunn/fzf.vim'}

    -- Golang:
    use {'crispgm/nvim-go', require = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }

    -- For golang and rust
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'

    -- Git:
    use 'APZelos/blamer.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- use 'rmagatti/auto-session'

    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
    use 'onsails/lspkind-nvim'

    use {'windwp/nvim-autopairs'}

    use 'akinsho/toggleterm.nvim'
    -- use 'glepnir/dashboard-nvim'
end)

