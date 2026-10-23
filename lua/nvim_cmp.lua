-- Set up nvim-cmp.
local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Set up lspconfig.
-- Merge nvim-cmp's completion capabilities into every LSP client so
-- servers (rust-analyzer included) know cmp can handle snippets,
-- resolve, etc. Without this, nvim-cmp's `nvim_lsp` source only gets
-- Neovim's bare-bones default capabilities.
vim.lsp.config('*', {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

vim.lsp.enable('eslint')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('lua_ls')

-- cmp-nvim-lsp only registers its cmp source on InsertEnter, checking
-- whichever clients are already attached at that moment. If a server
-- (rust-analyzer especially) is still attaching when you first enter
-- insert mode, its completions never show up until you leave and
-- re-enter insert mode. Register immediately on attach instead so LSP
-- completions are available right away.
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('cmp_lsp_attach', { clear = true }),
  callback = function()
    require('cmp_nvim_lsp')._on_insert_enter()
  end,
})

vim.o.updatetime = 250
vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
  group = vim.api.nvim_create_augroup('float_diagnostic', { clear = true }),
  callback = function ()
    vim.diagnostic.open_float(nil, {focus=false})
  end
})

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})
