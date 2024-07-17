vim.g.mapleader = " "

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.termguicolors = true

require("core.lazy")
require("core.mappings")

vim.cmd.colorscheme("catppuccin-frappe")

vim.wo.number = true
vim.wo.relativenumber = true

if vim.g.neovide then
	vim.g.neovide_scroll_animation_length = 0.1
end

-- Copy over SSH
vim.g.clipboard = {
	name = "OSC 52",
	copy = {
		["+"] = require("vim.ui.clipboard.osc52").copy("+"),
		["*"] = require("vim.ui.clipboard.osc52").copy("*"),
	},
	paste = {
		["+"] = require("vim.ui.clipboard.osc52").paste("+"),
		["*"] = require("vim.ui.clipboard.osc52").paste("*"),
	},
}
