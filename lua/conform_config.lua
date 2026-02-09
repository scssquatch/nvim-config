require('conform').setup({
  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = { 'oxfmt' },
    typescript = { 'oxfmt' },
    javascriptreact = { 'oxfmt' },
    typescriptreact = { 'oxfmt' },
    json = { 'oxfmt' },
    html = { 'oxfmt' },
    css = { 'oxfmt' },
    yaml = { 'oxfmt' },
    markdown = { 'oxfmt' },
  },
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function(args)
    require('conform').format({ bufnr = args.buf })
  end,
})
