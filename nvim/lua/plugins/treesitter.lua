return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
        ensure_installed = {
            'bash',
            'c',
            'html',
            'lua',
            'luadoc',
            'markdown',
            'vim',
            'vimdoc',
            'rust',
        },

        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = { 'ruby' },
        },
        indent = { enable = true, disable = { 'ruby' } },
        autotag = {
            enable = true,
        },
    },
    config = function(_, opts)
        -- @diagnostic disable-next-line: missing-fields
        require('nvim-treesitter.configs').setup(opts)
    end,
}
