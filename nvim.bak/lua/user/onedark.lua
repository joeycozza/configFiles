local onedark = require("onedark")

onedark.setup({
	style = "darker",
	highlights = {
		MiniCursorword = {
			fmt = "italic,bold",
		},
		MiniCursorwordCurrent = {
			fmt = "italic,bold",
		},
	},
})

onedark.load()
