vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = "gitcommit",
  callback = function ()
    vim.opt.setlocal = true
    vim.opt.spell = true
    vim.opt.textwidth = 72
  end,
})
