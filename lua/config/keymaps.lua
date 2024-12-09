-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map(
  "n",
  "lw",
  'viwyA:<Esc>vbgsa(vwgsa"A<Left>,<Space><Esc>p^iconsole.log<Esc>',
  { desc = "Add console log for word under cursor", remap = true }
)
