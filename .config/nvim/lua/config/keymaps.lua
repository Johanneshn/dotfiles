-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jk", "<esc>", { desc = "Escape" })

vim.keymap.set("n", "<leader>k", '<cmd>lua require("kubectl").toggle()<cr>', { noremap = true, silent = true })
vim.keymap.del("n", "<c-Down>")
vim.keymap.del("n", "<c-Up>")
-- vim.keymap.set('n', 'H', '^')
-- vim.keymap.set('n', 'L', '$')
-- vim.keymap.set('n', 'J', '}')
-- vim.keymap.set('n', 'K', '{')
