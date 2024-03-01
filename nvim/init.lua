-- Set <space> as the leader key
-- Set this key before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- lazy.nvim config
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins setup
require("lazy").setup("plugins")

-- Base NVim settings
vim.opt.number = true                           -- show line numbers
vim.opt.relativenumber = false                  -- don't show relative line numbers
vim.opt.mouse = "a"                             -- enable mouse support
vim.opt.clipboard = "unnamedplus"               -- use system clipboard
vim.opt.autowrite = true                        -- enable auto write 
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.conceallevel = 3                        -- hide * markup for bold and italic
vim.opt.confirm = true                          -- ask for a confirmation before exiting the modified buffer
vim.opt.cursorline = true                       -- highlighting for the current line
vim.opt.formatoptions = "jcroqlnt"              -- tcqj
vim.opt.inccommand = "nosplit"                  -- preview incremental substitute
vim.opt.laststatus = 0
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.updatetime = 200                        -- save swap file and trigger CursorHold
vim.opt.wildmode = "longest:full,full"          -- command-line completion mode
vim.opt.winminwidth = 5                         -- minimum window width
vim.opt.wrap = false                            -- disable line wrap
vim.opt.virtualedit = "block"                   -- allow cursor to move where there is no text in visual block mode

-- Editor settings & theming
vim.cmd.colorscheme "catppuccin"
vim.opt.termguicolors = true                    -- enable true color support
vim.opt.pumblend = 10                           -- popup blend
vim.opt.pumheight = 10                          -- maximum number of entries in a popup
vim.opt.scrolloff = 4                           -- lines of context
vim.opt.sidescrolloff = 8                       -- columns of context
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
vim.opt.shiftround = true                       -- round indent
vim.opt.shortmess:append { W = true, I = true, c = true, C = true }
vim.opt.showmode = false                        -- dont show mode since we have a statusline
vim.opt.signcolumn = "yes"                      -- always show the signcolumn, otherwise it would shift the text each time
vim.opt.spelllang = { "en" }                    -- spellchecking in english by default
vim.opt.splitbelow = true                       -- put new windows below current
vim.opt.splitright = true                       -- put new windows right of current
vim.opt.splitkeep = "screen"                    -- keep the text on the same screen line
vim.opt.list = true                                 -- show invisible characters (e.g. tabs)
vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

-- Search settings
vim.opt.hlsearch = true                         -- set highlight on search
vim.opt.ignorecase = true                       -- ignore case when searching by default
vim.opt.smartcase = true                        -- if has uppercase then case sensitive
vim.opt.grepformat = "%f:%l:%c:%m"              
vim.opt.grepprg = "rg --vimgrep"

-- Code editing
vim.opt.encoding="utf-8"                        -- UTF-8 as the default encoding
vim.opt.tabstop = 4                             -- number of columns occupied by a tab 
vim.opt.shiftwidth = 4                          -- width for autoindents
vim.opt.expandtab = true                        -- convert tabs to white spaces
vim.opt.smartindent = true                      -- autoindent new lines 

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-- Setup the custom configuration for NeoVim
require("config").setup()
