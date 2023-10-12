local onedark = require("onedark")

onedark.setup({
	style = "darker",
	highlights = {
		IlluminatedWordText = { fmt = "italic,bold" },
		IlluminatedWordRead = { fmt = "italic,bold" },
		IlluminatedWordWrite = { fmt = "italic,bold" },
	},
})

onedark.load()
