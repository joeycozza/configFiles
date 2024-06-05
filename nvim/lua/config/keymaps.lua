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
end, { desc = "delete line", expr = true })

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
keymap("n", "<Leader>[", "<cmd>BufferLineMovePrev<cr>", { silent = true, desc = "Move buffer prev" })
keymap("n", "<Leader>]", "<cmd>BufferLineMoveNext<cr>", { silent = true, desc = "Move buffer next" })

keymap("t", "<Esc>", "<C-\\><C-n>", { desc = "In terminal mode, Esc will go back to normal mode" })
keymap("t", "<C-v><Esc>", "<Esc>", { desc = "In terminal mode, send Verbatim Esc to the terminal itself" })

keymap("n", ",,", "m`A,<Esc>``", { desc = "Add comma to end of line and put cursor back where it was" })
keymap("n", ";;", "m`$x``", { desc = "Remove last character of a line and put cursor back where it was" })
