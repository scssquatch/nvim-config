return {
  -- wtf are my keybinds
  {
    'mrjones2014/legendary.nvim',
    version = 'v2.13.9',
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
  'nvim-treesitter/nvim-treesitter',

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
      -- "#" to surround with ruby string interpolation
      vim.g.surround_35 = '#{\r}'
      -- "-" to surround with no-output erb tag
      vim.g.surround_45 = '<% \r %>'
      -- "=" to surround with output erb tag
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

  -- searchable dash docs
  {
    'mrjones2014/dash.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    build = 'make install',
  },

  -- copilot
  {
    'github/copilot.vim',
  },

  -- AI Code Companion
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'hrsh7th/nvim-cmp', -- Optional: For using slash commands and variables in the chat buffer
      'nvim-telescope/telescope.nvim', -- Optional: For using slash commands
      { 'MeanderingProgrammer/render-markdown.nvim', ft = { 'markdown', 'codecompanion' } }, -- Optional: For prettier markdown rendering
      { 'stevearc/dressing.nvim', opts = {} }, -- Optional: Improves `vim.ui.select`
    },
    config = true
  },

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  -- polyglot
  {
    'sheerun/vim-polyglot',
  },

  -- typescript tools
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
}
