vim.keymap.set("n", "+", ":Neotree toggle<CR>", { desc = "Toggle file tree" })

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find keymaps" })

vim.keymap.set("i", "<C-S>", "<C-O>:w<CR>", { desc = "Save" })
vim.keymap.set("i", "<C-A>", "<C-O>0", { desc = "Go to start" })
vim.keymap.set("i", "<C-E>", "<C-O>$", { desc = "Go to end" })
vim.keymap.set("n", "<C-S>", ":w<CR>", { desc = "Save" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-N>", { desc = "Escape terminal" })
vim.keymap.set("n", "<leader>t", ":term<CR>", { desc = "Terminal" })
vim.keymap.set("n", "<C-C>", ":noh<CR>", { desc = "Clear search" })

vim.keymap.set({ "n", "v" }, "<leader>cf", function()
	local conform = require("conform")
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	})
end, { desc = "Format file or range (in visual mode)" })

-- copy to system clipboard with option+c, and keep the selection
vim.keymap.set("v", "<M-c>", '"+ygv', { desc = "Copy to system clipboard" })
vim.keymap.set("i", "<M-v>", "<C-R>+", { desc = "Paste from system clipboard" })
vim.keymap.set("n", "<M-v>", '"+P', { desc = "Paste from system clipboard" })

-- accept Copilot suggestion with control + Enter
vim.keymap.set("i", "<C-CR>", 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true

vim.keymap.set("v", "//", [[y/\V<C-R>=escape(@",'/')<CR><CR>]], { desc = "Search selected text" })
vim.keymap.set("v", "/s", [[y:%s/\V<C-R>"//gc<Left><Left><Left>]], { desc = "Replace selected text" })
vim.keymap.set("n", "/s", [[yiw:%s/\V<C-R>"//gc<Left><Left><Left>]], { desc = "Replace current word" })
vim.keymap.set("v", "/c", [[y:%S/<C-R>"//gc<Left><Left><Left>]], { desc = "Replace selected text, preserve case" })
vim.keymap.set("n", "/c", [[yiw:%S/<C-R>"//gc<Left><Left><Left>]], { desc = "Replace current word, preserve case" })
