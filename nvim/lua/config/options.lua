-- Enable autoformat
vim.g.autoformat = true                        

-- LazyVim root dir detection
-- Each entry can be:
-- * the name of a detector function like `lsp` or `cwd`
-- * a pattern or array of patterns like `.git` or `lua`.
-- * a function with signature `function(buf) -> string|string[]`
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

local opt = vim.opt

if vim.fn.has("nvim-0.10") == 1 then
  opt.smoothscroll = true
end

-- Folding
vim.opt.foldlevel = 99
vim.opt.foldtext = "v:lua.require'util'.ui.foldtext()"

if vim.fn.has("nvim-0.9.0") == 1 then
  vim.opt.statuscolumn = [[%!v:lua.require'util'.ui.statuscolumn()]]
end

-- HACK: causes freezes on <= 0.9, so only enable on >= 0.10 for now
if vim.fn.has("nvim-0.10") == 1 then
  vim.opt.foldmethod = "expr"
  vim.opt.foldexpr = "v:lua.require'util'.ui.foldexpr()"
else
  vim.opt.foldmethod = "indent"
end

vim.o.formatexpr = "v:lua.require'util'.format.formatexpr()"
