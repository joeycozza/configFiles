return {
  {
    "navarasu/onedark.nvim",
    opts = {
      style = "darker",
      toggle_style_key = "<Leader>ts", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
      highlights = {
        IlluminatedWordText = { fmt = "italic,bold" },
        IlluminatedWordRead = { fmt = "italic,bold" },
        IlluminatedWordWrite = { fmt = "italic,bold" },
      },
    },
  },

  -- Configure LazyVim to load onedark
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
