return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        sorting_strategy = "ascending",
        selection_caret = "->",
        layout_config = {
          width = 0.95,
          preview_width = 0.55,
          prompt_position = "top",
        },
      },
    },
  },
}
