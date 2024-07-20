-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = LazyVim.safe_keymap_set
local lazyterm = function()
  LazyVim.terminal(nil, { cwd = LazyVim.root() })
end

map("t", "<leader>k", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("n", "<leader>k", lazyterm, { desc = "Terminal (Root Dir)" })
