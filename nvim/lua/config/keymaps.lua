-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local keymap = require("./utils").keymap

keymap("i", "jk", "<Esc>:w<CR>", { silent = true })

keymap("n", "dd", function()
  if vim.api.nvim_get_current_line():match("^%s*$") then
    return '"_dd'
  else
    return "dd"
  end
end, { expr = true })

keymap(
  "n",
  "<Leader>ni",
  "<cmd>lua require('utils').npmInfo()<CR>",
  { desc = "Get `npm info` of closest quoted string" }
)

keymap("n", "<Leader>d", ":bdelete<CR>", { silent = true, desc = "Delete Buffer" })
keymap("n", "<Leader><Leader>d", ":bdelete!<CR>", { silent = true, desc = "Delete Buffer (force)" })
keymap(
  "t",
  "<Leader><Leader>d",
  "<c-\\><c-n>:bdelete!<CR>",
  { silent = true, desc = "Delete Buffer (force, while in a Terminal) " }
)
