-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--

local nvimCmd = vim.api.nvim_command
local onYank = vim.highlight.on_yank
local autoCmdCreate = vim.api.nvim_create_autocmd

-- This fixes my cursor the way I like it in the terminal after quitting vim
autoCmdCreate("VimLeave", {
  pattern = "*",
  callback = function()
    nvimCmd("set guicursor=a:ver10-blinkon0")
  end,
})

autoCmdCreate("TextYankPost", {
  pattern = "*",
  callback = function()
    onYank({ higroup = "IncSearch", timeout = 800 })
  end,
})
