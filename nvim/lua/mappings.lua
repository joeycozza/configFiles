local options = {noremap = true}

local function map(mode, lhs, rhs, opts)
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.api.nvim_set_keymap('n', '<leader>f', '<CMD>Telescope find_files hidden=true<CR>', options)
map('n', '<leader>tn', '<CMD>Telescope file_browser<CR>', options)
map('n', '<leader>tg', ":lua require('telescope.builtin').live_grep({previewer = false})<cr>", options)
