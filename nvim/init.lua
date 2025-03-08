require 'general'
require 'plugins'

vim.filetype.add { extension = { hz = 'haze' } }

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

---@diagnostic disable-next-line: inject-field
parser_config.haze = {
    install_info = {
        url = '~/Documents/dev/haze-lang/tree-sitter-haze',
        files = { 'src/parser.c' },
    },
    filetype = 'hz',
}
