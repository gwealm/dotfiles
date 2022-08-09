-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
    pattern = 'plugins.lua',
    command = 'source <afile> | PackerCompile',
})

return require('packer').startup({
    function(use)
        ---------------------
        -- Package Manager --
        ---------------------

        use('wbthomason/packer.nvim')

        ----------------------
        -- Required plugins --
        ----------------------

        use('nvim-lua/plenary.nvim')

        ----------------------------------------
        -- Theme, Icons, Statusbar, Bufferbar --
        ----------------------------------------

        use({
            'kyazdani42/nvim-web-devicons',
            config = function()
                require('nvim-web-devicons').setup()
            end,
        })

        -- Theme
        use 'EdenEast/nightfox.nvim'
        vim.api.nvim_command [[colorscheme nightfox]]


        use({
            {
                'nvim-lualine/lualine.nvim',
        --        after = 'nightfox',
                event = 'BufEnter',
                config = function()
                    require('gui1612.plugins.lualine')
                end,
            },
            {
                'j-hui/fidget.nvim',
                after = 'lualine.nvim',
                config = function()
                    require('fidget').setup()
                end,
            },
        })

        -----------------------------------
        -- Treesitter: Better Highlights --
        -----------------------------------

        use({
            {
                'nvim-treesitter/nvim-treesitter',
                event = 'CursorHold',
                run = ':TSUpdate',
                config = function()
                    require('gui1612.plugins.treesitter')
                end,
            },
            { 'nvim-treesitter/playground', after = 'nvim-treesitter' },
            { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' },
            { 'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter' },
            { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' },
            { 'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter' },
        })

        --------------------------
        -- Editor UI Niceties --
        --------------------------

        use({
            'lukas-reineke/indent-blankline.nvim',
            event = 'BufRead',
            config = function()
                require('gui1612.plugins.indentline')
            end,
        })

        use({
            'norcalli/nvim-colorizer.lua',
            event = 'CursorHold',
            config = function()
            require('colorizer').setup()
            end,
        })

        ---------------------------------
        -- Navigation and Fuzzy Search --
        ---------------------------------

        use({
            'kyazdani42/nvim-tree.lua',
            event = 'CursorHold',
            config = function()
                require('gui1612.plugins.nvim-tree')
            end,
        })

        use({
            {
                'nvim-telescope/telescope.nvim',
                event = 'CursorHold',
                config = function()
                    require('gui1612.plugins.telescope')
                end,
            },
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                after = 'telescope.nvim',
                run = 'make',
                config = function()
                    require('telescope').load_extension('fzf')
                end,
            },
            {
                'nvim-telescope/telescope-symbols.nvim',
                after = 'telescope.nvim',
            },
        })

        use({
            'karb94/neoscroll.nvim',
            event = 'WinScrolled',
            config = function()
                require('neoscroll').setup({ hide_cursor = false })
            end,
        })

        -------------------------
        -- Editing to the MOON --
        -------------------------

        -- Plugin for automatic comments (gcc)
        use 'tpope/vim-commentary'

        use({
            'tpope/vim-surround',
            event = 'BufRead',
            requires = {
                {
                    'tpope/vim-repeat',
                    event = 'BufRead',
                },
            },
        })

        use({
            'wellle/targets.vim',
            event = 'BufRead',
        })

        use({
            'AndrewRadev/splitjoin.vim',
            -- NOTE: splitjoin won't work with `BufRead` event
            event = 'CursorHold',
        })

        use({
            'numToStr/Buffers.nvim',
            event = 'BufRead',
            config = function()
                require('gui1612.plugins.buffers')
            end,
        })

        -----------------------------------
        -- LSP, Completions and Snippets --
        -----------------------------------
        use({
            {
                'hrsh7th/nvim-cmp',
                event = 'InsertEnter',
                config = function()
                    require('gui1612.plugins.lsp.nvim-cmp')
                end,
                requires = {
                    {
                        'L3MON4D3/LuaSnip',
                        event = 'InsertEnter',
                        config = function()
                            require('gui1612.plugins.lsp.luasnip')
                        end,
                        requires = {
                            {
                                'rafamadriz/friendly-snippets',
                                event = 'CursorHold',
                            },
                        },
                    },
                },
            },
            { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
        })


        use({
            'neovim/nvim-lspconfig',
            event = 'BufRead',
            config = function()
                require('gui1612.plugins.lsp.servers')
            end,
            requires = {
                {
                    -- WARN: Unfortunately we won't be able to lazy load this
                    'hrsh7th/cmp-nvim-lsp',
                },
            },
        })

        use({
            'jose-elias-alvarez/null-ls.nvim',
            event = 'BufRead',
            config = function()
                require('gui1612.plugins.lsp.null-ls')
            end,
        })

        


        -- -- NOTE: nvim-autopairs needs to be loaded after nvim-cmp, so that <CR> would work properly
        use({
            'windwp/nvim-autopairs',
            event = 'InsertCharPre',
            after = 'nvim-cmp',
            config = function()
                require('gui1612.plugins.pairs')
            end,
        })
    end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end,
        },
    },
})

