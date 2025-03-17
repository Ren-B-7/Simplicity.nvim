return {
	"echasnovski/mini.indentscope",
	version = "*",
	lazy = true,
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = true,
	opts = {
		draw = {
			delay = 200,
			animation = function()
				return 1
			end,
		},
	},
}
