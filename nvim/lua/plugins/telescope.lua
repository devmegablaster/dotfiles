require("telescope").setup({})

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")

vim.keymap.set("n", "<Leader>t", require("telescope.builtin").find_files, {})
vim.keymap.set("n", "<leader>f", require("telescope.builtin").live_grep, {})

-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = true,
	}))
end, { desc = "[/] Fuzzily search in current buffer]" })

vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })

vim.keymap.set("n", "<leader>sb", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>sm", ":Telescope harpoon marks<CR>", { desc = "Harpoon [M]arks" })
vim.keymap.set("n", "<Leader>sn", "<CMD>lua require('telescope').extensions.notify.notify()<CR>", silent)

vim.api.nvim_set_keymap("n", "st", ":TodoTelescope<CR>", { noremap = true })
