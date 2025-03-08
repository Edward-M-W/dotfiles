vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        print("hi")
    end
})
