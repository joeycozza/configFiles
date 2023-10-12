local utils = require("utils")
local keymap = utils.keymap
local telescope = require("telescope")
local trouble = require("trouble.providers.telescope")

local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local telescope_custom_actions = {}

function telescope_custom_actions._multiopen(prompt_bufnr, open_cmd)
	local picker = action_state.get_current_picker(prompt_bufnr)
	local selected_entry = action_state.get_selected_entry()
	local num_selections = #picker:get_multi_selection()
	if not num_selections or num_selections <= 1 then
		actions.add_selection(prompt_bufnr)
	end
	actions.send_selected_to_qflist(prompt_bufnr)
	vim.cmd("cfdo " .. open_cmd)
end

function telescope_custom_actions.multi_selection_open(prompt_bufnr)
	telescope_custom_actions._multiopen(prompt_bufnr, "edit")
end

telescope.setup({
	defaults = {
		sorting_strategy = "ascending",
		prompt_prefix = "🔍 ",
		selection_caret = "->",
		layout_strategy = "vertical",
		layout_config = { mirror = true, width = 0.95, preview_width = 0.55, prompt_position = "top" },
		file_ignore_patterns = { "dist/index.js", ".git/.*" },
		dynamic_preview_title = true,
		color_devicons = true,
		path_display = utils.smartTruncate,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		mappings = {
			i = {
				["<ESC>"] = actions.close,
				["<C-J>"] = actions.move_selection_next,
				["<C-K>"] = actions.move_selection_previous,
				["<TAB>"] = actions.toggle_selection + actions.move_selection_next,
				["<CR>"] = telescope_custom_actions.multi_selection_open,
				["<c-t>"] = trouble.open_with_trouble,
			},
			n = i,
		},
		preview = { filesize_limit = 3, timeout = 100 },
	},
})

telescope.load_extension("fzf")

keymap("n", "<Leader>f", "<cmd>Telescope find_files hidden=true<CR>")
keymap("n", "<Leader>ts", ":Telescope treesitter<CR>")
keymap("n", "<Leader>tb", ":Telescope git_bcommits<CR>")
keymap("n", "<Leader>td", ":Telescope diagnostics<CR>")
-- grep in the entire project
keymap("n", "<Leader>tg", ":Telescope live_grep<CR>")
-- grep in the entire project but start with the string under cursor and then include filename in the fuzzy finding
keymap("n", "<Leader><Leader>tg", ":Telescope grep_string<CR>")
