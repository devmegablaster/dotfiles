require("config.lazy")
require("mappings")
require("plugins.lsp")
require("plugins.treesitter")
require("plugins.telescope")
require("plugins.tokyonight")
require("plugins.lualine")
require("plugins.codesnap")
require("plugins.obsidian")
require("plugins.zenmode")
require("plugins.cmp")
require("plugins.cmp")
require("plugins.notify")
require("plugins.fidget")
require("plugins.rendermd")
-- vim.opt.fillchars = { eob = ' ' }

-- local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*.go",
--   callback = function()
--     require('go.format').goimport()
--   end,
--   group = format_sync_grp,
-- })
--
-- require('go').setup()
--
-- require('todo-comments').setup {}
--
-- require("telescope").load_extension('harpoon')
--
-- require('mason').setup()
--
