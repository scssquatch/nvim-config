return {
  -- wtf are my keybinds
  {
    'mrjones2014/legendary.nvim',
    priority = 10000,
    lazy = false,
  },
  -- Colorscheme
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = 'dark'
      vim.cmd([[colorscheme gruvbox-material]])
    end,
  },

  -- LSP and completion stuff
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',

  -- Conform: formatter
  {
    'stevearc/conform.nvim',
    opts = {},
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter').setup {
        highlight = { enable = true },
        ensure_installed = {
          'javascript',
          'lua',
          'luadoc',
          'markdown',
          'markdown_inline',
          'typescript',
          'vim',
          'vimdoc',
          'yaml',
        }
      }
    end,
  },

  -- JSON formatter
  {
    'rhysd/vim-fixjson',
    config = function()
      vim.g.fixjson_fix_on_save = 0
    end,
  },

  -- File Browser
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      vim.keymap.set('n', '<leader>g', ':NvimTreeToggle<cr>', { silent = true })
      vim.keymap.set('n', '<leader>G', ':NvimTreeFindFile<cr>', { silent = true })
    end,
  },

  -- fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'debugloop/telescope-undo.nvim',
    },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>t', builtin.find_files, {})
      vim.keymap.set('n', '<leader>b', builtin.buffers, {})
      vim.keymap.set('n', '<leader>B', builtin.oldfiles, {})

      -- undo tree feature
      require('telescope').load_extension('undo')
      vim.keymap.set('n', '<leader>u', '<cmd>Telescope undo<cr>')
    end,
  },

  -- Tim Pope, the best
  'tpope/vim-endwise',
  'tpope/vim-fugitive',
  'tpope/vim-repeat',
  'tpope/vim-rails',
  'tpope/vim-abolish',
  {
    'tpope/vim-surround',
    config = function()
      -- '#' to surround with ruby string interpolation
      vim.g.surround_35 = '#{\r}'
      -- '-' to surround with no-output erb tag
      vim.g.surround_45 = '<% \r %>'
      -- '=' to surround with output erb tag
      vim.g.surround_61 = '<%= \r %>'
    end,
  },

  -- Comment Toggling
  'tomtom/tcomment_vim',

  -- tab aligning
  'godlygeek/tabular',

  -- searching
  {
    'doums/rg.nvim',
    config = function()
      vim.keymap.set('n', 'g/', ':Rgf HS<space>')
      vim.keymap.set('n', 'g*', ':Rgf HS <C-R><C-W><space>')

      require('rg').setup({
        qf_format = nil,
        excluded = {
          'node_modules',
          '.git',
          'target',
          'package-lock.json',
          'Cargo.lock',
        },
      })
    end,
  },

  -- copilot
  {
    'github/copilot.vim',
  },

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  -- polyglot
  {
    'sheerun/vim-polyglot',
  },

  -- typescript tools
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {
      root_dir = function(bufnr, on_dir)
        local util = require('lspconfig.util')
        local fname = vim.api.nvim_buf_get_name(bufnr)

        -- Only activate if tsconfig.json exists (TypeScript project)
          local root = util.root_pattern('tsconfig.json')(fname)

          if root then
            on_dir(root)
          else
            -- Return without calling on_dir to prevent activation
            return
          end
        end,
      },
  },
  -- markdown
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown' },
    opts = {
      render_modes = { 'n', 'c', 't', 'v' },
      sign = {
        enabled = false, -- Turn off in the status column
      },
    },
  },
}
