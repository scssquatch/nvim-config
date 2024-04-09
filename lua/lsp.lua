local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp = require 'lspconfig'

lsp.standardrb.setup{
  capabilities = capabilities,
  single_file_support = true,
}

