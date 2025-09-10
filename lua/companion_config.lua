require('codecompanion').setup({
  strategies = {
    chat = {
      adapter = 'anthropic',
    },
    inline = {
      adapter = 'anthropic',
    },
  },
  adapters = {
    http = {
      anthropic = function()
        return require('codecompanion.adapters').extend('anthropic', {
          env = {
            api_key = 'cmd:op read op://Personal/anthropic_api_key/password --no-newline',
          },
          schema = {
            model = {
              default = 'claude-opus-4-1-20250805',
            },
          },
        })
      end,
      openai = function()
        return require('codecompanion.adapters').extend('openai', {
          env = {
            api_key = 'cmd:op read op://Personal/openai_api_token/password --no-newline',
          },
          schema = {
            model = {
              default = 'gpt-5-2025-08-07',
            },
          },
        })
      end,
    },
  },
})

vim.api.nvim_set_keymap('n', '<Leader>ca', '<cmd>CodeCompanionActions<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Leader>ca', '<cmd>CodeCompanionActions<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>cc', '<cmd>CodeCompanionChat Toggle<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Leader>cc', '<cmd>CodeCompanionChat Toggle<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'ga', '<cmd>CodeCompanionChat Add<cr>', { noremap = true, silent = true })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
