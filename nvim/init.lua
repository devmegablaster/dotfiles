require("megablaster")
vim.cmd[[set relativenumber]]
vim.opt.fillchars = { eob = ' ' }
require('telescope').setup {
    defaults = {
        file_ignore_patterns = { 'node_modules/*' }
    }
}

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require('go.format').goimport()
  end,
  group = format_sync_grp,
})

require('go').setup()

require('todo-comments').setup {}

require("telescope").load_extension('harpoon')

require('mason').setup()
