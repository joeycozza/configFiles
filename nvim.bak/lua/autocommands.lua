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

autoCmdCreate("FileType", {
	pattern = "json",
	callback = function()
		nvimCmd("syntax match Comment +\\/\\/.\\+$+")
	end,
})

autoCmdCreate("TextYankPost", {
	pattern = "*",
	callback = function()
		onYank({ higroup = "IncSearch", timeout = 800 })
	end,
})
