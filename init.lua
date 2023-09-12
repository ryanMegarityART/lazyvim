-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
--gitblame = require("utils.gitblame")

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

--vim.api.nvim_create_autocmd("CursorHold", {
--    callback = function()
--        gitblame.blameVirtText()
--    end,
--})
--vim.api.nvim_create_autocmd("CursorMoved", {
--   callback = function()
--        gitblame.clearBlameVirtText()
--    end,
--})
--vim.api.nvim_create_autocmd("CursorMovedI", {
--    callback = function()
--        gitblame.clearBlameVirtText()
--    end,
--})
