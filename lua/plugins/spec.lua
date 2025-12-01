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
      require('nvim-treesitter.configs').setup {
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
    tag = '0.1.5',
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
    'duane9/nvim-rg',
    config = function()
      vim.g.rg_command = 'rg --vimgrep --type-not sql --smart-case'
      vim.keymap.set('n', 'g/', ':Rg<space>')
      vim.keymap.set('n', 'g*', ':Rg -w <C-R><C-W><space>')
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
    opts = {},
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
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    ---@module 'avante'
    ---@type avante.Config
    opts = {
      provider = "claude",
      providers = {
        claude = {
          endpoint = "https://api.anthropic.com",
          model = "claude-sonnet-4-5",
          timeout = 30000, -- Timeout in milliseconds
            extra_request_body = {
              temperature = 0.75,
              max_tokens = 20480,
            },
        },
      },
      selector = {
        ---@alias avante.SelectorProvider "telescope"
        ---@type avante.SelectorProvider
        provider = "telescope",
        provider_opts = {},
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
