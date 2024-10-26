require("megablaster")
vim.cmd[[set relativenumber]]
vim.opt.fillchars = { eob = ' ' }
require('telescope').setup {
    defaults = {
        file_ignore_patterns = { 'node_modules/*' }
    }
}

require'lspconfig'.pyright.setup{}

require("telescope").load_extension('harpoon')
