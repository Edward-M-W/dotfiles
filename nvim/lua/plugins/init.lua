-- Highlight when yanking text
-- `yap` in normal mode
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking text',
    group = vim.api.nvim_create_augroup(
        'kickstart-highlight-yank',
        { clear = true }
    ),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- require('lspconfig').gleam.setup {}

-- Everything else from now is setting up lazy.nvim

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        '--branch=stable',
        lazyrepo,
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
    'tpope/vim-sleuth', -- tabstop and shiftwidth

    { 'numToStr/Comment.nvim', opts = {} },

    -- Integrate git - see what has happened to lines
    {
        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add = { text = '+ ' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '*' },
            },
        },
    },

    { -- Add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help ibl`
        main = 'ibl',
        opts = {},
    },

    { -- Pending keybinds.
        'folke/which-key.nvim',
        event = 'VeryLazy',
        config = function()
            local wk = require 'which-key'

            wk.add {
                { '<leader>c', desc = '[C]ode' },
                { '<leader>d', desc = '[D]ocument' },
                { '<leader>r', desc = '[R]ename' },
                { '<leader>s', desc = '[S]earch' },
                { '<leader>w', desc = '[W]orkspace' },
            }
        end,
    },
    -- Highlight 'TODO', 'NOTE', etc. in comments
    {
        'folke/todo-comments.nvim',
        event = 'VeryLazy',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = { signs = false },
        lazy = true,
    },

    {
        'iamcco/markdown-preview.nvim',
        cmd = {
            'MarkdownPreviewToggle',
            'MarkdownPreview',
            'MarkdownPreviewStop',
        },
        ft = { 'markdown' },
        build = function()
            vim.fn['mkdp#util#install']()
        end,
        lazy = true,
    },

    --  require 'plugins.java',

    require 'plugins.telescope',

    require 'plugins.lsp',

    require 'plugins.autofmt',

    require 'plugins.autocompletion',

    require 'plugins.mini',

    require 'plugins.colourscheme',

    require 'plugins.treesitter',

    require 'plugins.scala',

    -- require 'kickstart.plugins.debug',
    -- require 'kickstart.plugins.indent_line',
    -- require 'kickstart.plugins.lint',

    ui = {
        -- If you are using a Nerd Font: set icons to an empty table which will use the
        -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
        icons = vim.g.have_nerd_font and {} or {
            cmd = '⌘',
            config = '🛠',
            event = '📅',
            ft = '📂',
            init = '⚙',
            keys = '🗝',
            plugin = '🔌',
            runtime = '💻',
            require = '🌙',
            source = '📄',
            start = '🚀',
            task = '📌',
            lazy = '💤 ',
        },
    },
}

vim.api.nvim_create_autocmd({ 'BufEnter' }, {
    pattern = { '*.hz' },
    callback = function(_)
        vim.bo.commentstring = '//%s'
    end,
})
