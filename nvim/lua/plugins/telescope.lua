local trouble = require("trouble.providers.telescope")

local actions = require("telescope.actions")
-- local action_state = require("telescope.actions.state")
-- local telescope_custom_actions = {}

-- function telescope_custom_actions._multiopen(prompt_bufnr, open_cmd)
--   local picker = action_state.get_current_picker(prompt_bufnr)
--   local num_selections = #picker:get_multi_selection()
--   if not num_selections or num_selections <= 1 then
--     actions.add_selection(prompt_bufnr)
--   end
--   actions.send_selected_to_qflist(prompt_bufnr)
--   vim.cmd("cfdo " .. open_cmd)
-- end

-- function telescope_custom_actions.multi_selection_open(prompt_bufnr)
--   telescope_custom_actions._multiopen(prompt_bufnr, "edit")
-- end

return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
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
            -- ["<C-J>"] = actions.move_selection_next,
            -- ["<C-K>"] = actions.move_selection_previous,
            -- ["<TAB>"] = actions.toggle_selection + actions.move_selection_next,
            -- ["<CR>"] = telescope_custom_actions.multi_selection_open,
            ["<c-t>"] = trouble.open_with_trouble,
          },
          n = i,
        },
      },
    },
  },
}
