return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local actions = require("telescope.actions")
      local trouble_telescope = require("trouble.sources.telescope")
      return {
        defaults = {
          sorting_strategy = "ascending",
          path_display = {
            "filename_first",
          },
          selection_caret = "->",
          layout_config = {
            width = 0.95,
            preview_width = 0.55,
            prompt_position = "top",
          },
          mappings = {
            i = {
              ["<ESC>"] = actions.close,
              ["<c-t>"] = trouble_telescope.open,
            },
            n = {
              ["<c-t>"] = trouble_telescope.open,
            },
          },
        },
      }
    end,
  },
}
