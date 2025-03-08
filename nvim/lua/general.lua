vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        client.server_capabilities.semanticTokensProvider = nil
    end,
})

vim.opt.colorcolumn = '80'
-- set colorcolumn to 100 for rust because its style guide is weird.
-- seriously, who codes in rust and doesn't use a display from the 70s?
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'rust',
    callback = function()
        vim.opt_local.colorcolumn = '100'
    end,
})

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

vim.opt.tabstop = 4 -- the width of a tab
vim.opt.shiftwidth = 0 -- set to the same as tabstop

vim.opt.expandtab = false
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'nim',
    callback = function()
        vim.opt.expandtab = true
    end,
})

vim.opt.number = true -- line numbers
vim.opt.relativenumber = true -- relative numbers for jumping

-- Allow mouse.
vim.opt.mouse = 'a'
vim.opt.showmode = false -- this is already in the status line.

-- Sync clipboard between nvim and everything else
vim.opt.clipboard = 'unnamedplus'

vim.opt.breakindent = true

-- save undo history
vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = 'yes'

vim.opt.timeoutlen = 300

-- How should splits be opened?
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Change how some whitespace chars are displayed
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.inccommand = 'split' -- Substitutions live

vim.opt.cursorline = true -- line for where the cursor is

vim.opt.scrolloff = 10 -- how many lines are kept on the screen

vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>p', vim.cmd.Ex, { desc = '[P]roject View' })

-- Diagnostic Keymaps
vim.keymap.set(
    'n',
    '[d',
    vim.diagnostic.goto_prev,
    { desc = 'Go to previous [D]iagnostic message' }
)
vim.keymap.set(
    'n',
    ']d',
    vim.diagnostic.goto_next,
    { desc = 'Go to next [D]iagnostic message' }
)
vim.keymap.set(
    'n',
    '<leader>e',
    vim.diagnostic.open_float,
    { desc = 'Show diagnostic [E]rror messages' }
)
vim.keymap.set(
    'n',
    '<leader>q',
    vim.diagnostic.setloclist,
    { desc = 'Open diagnostic [Q]uickfix list' }
)

vim.keymap.set(
    't',
    '<Esc><Esc>',
    '<C-\\><C-n>',
    { desc = 'Exit terminal mode.' }
)

-- not quite sure why i would need this but whatever
vim.keymap.set('n', '<leader>a', '0ggvG$', { desc = 'Select All.' })

-- Switch between windows
vim.keymap.set(
    'n',
    '<C-h>',
    '<C-w><C-h>',
    { desc = 'Move focus to the left window' }
)
vim.keymap.set(
    'n',
    '<C-l>',
    '<C-w><C-l>',
    { desc = 'Move focus to the right window' }
)
vim.keymap.set(
    'n',
    '<C-j>',
    '<C-w><C-j>',
    { desc = 'Move focus to the lower window' }
)
vim.keymap.set(
    'n',
    '<C-k>',
    '<C-w><C-k>',
    { desc = 'Move focus to the upper window' }
)

vim.keymap.set(
    'n',
    'mc',
    'i""" """<Esc>bbea<Del>',
    { desc = 'python multiline string' }
)
