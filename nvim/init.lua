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
vim.wo.number = true                -- show line numbers
vim.o.showmatch = true              -- highlight matching parenthesis
vim.o.mouse = "a"                   -- enable mouse support
vim.o.clipboard = "unnamedplus"     -- use system clipboard

-- Editor settings & theming
vim.o.termguicolors = true          -- enable true color support
vim.cmd.colorscheme "catppuccin"

-- Search settings
vim.o.hlsearch = true               -- set highlight on search
vim.o.ignorecase = true             -- ignore case when searching by default
vim.o.smartcase = true              -- if has uppercase then case sensitive

-- Code editing
vim.o.encoding="utf-8"              -- UTF-8 as the default encoding
vim.o.tabstop = 4                   -- number of columns occupied by a tab 
vim.o.shiftwidth = 4                -- width for autoindents
vim.o.expandtab = true              -- convert tabs to white spaces
vim.o.smartindent = true            -- autoindent new lines 
