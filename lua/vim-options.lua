vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.have_nerd_font = true
vim.opt.mouse = 'a'
vim.opt.showmode = true
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.wo.number = true

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
