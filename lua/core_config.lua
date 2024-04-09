vim.g.mapleader = ","

vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.number = true
vim.opt.wrap = false
vim.opt.showmatch = true
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 10
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.numberwidth = 2
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true
vim.opt.directory = "/tmp/"
vim.opt.guicursor = "a:blinkon0"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.visualbell = true
vim.opt.listchars= "tab:> ,trail:-,extends:>,precedes:<,nbsp:+"
vim.opt.list = true
vim.opt.mouse = "a"
vim.opt.wildmode = "list:longest,list:full"
vim.opt.wildignore:append { "*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,*/target/**" }
vim.opt.modeline = true
vim.opt.modelines = 10

-- Key Mappings

function map(mode, shortcut, command, silent)
  vim.keymap.set(mode, shortcut, command, { noremap = true, silent = silent })
end

-- Toggle wrapping
map("n", "<leader>w", ":set wrap!<cr>")
map("n", "<leader>W", ":set nowrap<cr>")

-- Close all other windows in current tab
map("n", "gW", ":only<cr>")

-- Alternate file
map("n", "g<cr>", ":b#<cr>", true)

-- Common ruby file shortcuts
map("n", "gs", ":e db/schema.rb<cr>")
map("n", "gq", ":e db/structure.sql<cr>")
map("n", "gr", ":e config/routes.rb<cr>")
map("n", "gm", ":e Gemfile<cr>")

-- Insert empty lines
map("n", "go", "o<esc>")
map("n", "gO", "O<esc>")

-- Split navigation
map("n", "<c-j>", "<c-w>j")
map("n", "<c-k>", "<c-w>k")
map("n", "<c-h>", "<c-w>h")
map("n", "<c-l>", "<c-w>l")

-- Select pasted lines
map("n", "vv", "`[V`]")

-- No highlight
map("n", "<leader><space>", ":noh<cr>")

-- Resize buffers
map("n", "<s-up>", "<c-w>+")
map("n", "<s-down>", "<c-w>-")
map("n", "<s-left>", "<c-w><")
map("n", "<s-right>", "<c-w>>")

-- Copy current file into global clipboard
map("n", "<leader>cf", ":let @* = expand('%:~')<cr>", true)

-- Escape with jj or jk
map("i", "jj", "<esc>")
map("i", "jk", "<esc>")

-- next and previous in quickfix buffer
map('n', 'gn', ':cnext<cr>')
map('n', 'gp', ':cprev<cr>')
