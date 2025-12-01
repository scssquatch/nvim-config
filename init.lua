vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.lsp.set_log_level('error')

require('core_config')
require('functions')
require('config.lazy')

require('nvim_cmp')

if vim.g.neovide then
  require('neovide')
end

require('nvim-tree').setup()

-- require('companion_config')

require('legendary').setup({
  extensions = {
    lazy_nvim = true,
  }
})

require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'gruvbox-material',
    component_separators = '',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_b = {'branch', 'diagnostics'},
    lualine_x = {'filetype'},
    lualine_y = {},
  },
})

require('typescript-tools').setup({})

require('conform_config')
