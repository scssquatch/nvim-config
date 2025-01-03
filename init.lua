vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.lsp.set_log_level("debug")

require('core_config')
require('functions')
require('config.lazy')

require('nvim_cmp')

if vim.g.neovide then
  require('neovide')
end

require('nvim-tree').setup()

require('companion_config')

require('legendary').setup({
  extensions = {
    lazy_nvim = true,
    codecompanion = true,
  }
})

require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'gruvbox-material',
  }
})

require("typescript-tools").setup({})
