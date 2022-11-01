-- Module-specific disabling:
-- - Don't show highlighting if cursor is on the word that is in a blocklist
--   of current filetype. In this example, blocklist for "lua" is "local" and
--   "require" words, for "javascript" - "import":
--
_G.cursorword_blocklist = function()
  local curword = vim.fn.expand('<cword>')
  local filetype = vim.api.nvim_buf_get_option(0, 'filetype')
  -- Add any disabling global or filetype-specific logic here
  local blocklist = {}
  if filetype == 'lua' then
    blocklist = { 'local', 'require' }
  elseif filetype == 'javascript' then
    blocklist = { 'import', 'const' }
  end
  vim.b.minicursorword_disable = vim.tbl_contains(blocklist, curword)
end

-- Make sure to add this autocommand *before* calling module's `setup()`.
vim.cmd('au CursorMoved * lua _G.cursorword_blocklist()')


-- Note to self: I update the MiniCursorword highlight in the onedark theme
require('mini.cursorword').setup({})

require('mini.pairs').setup({})
