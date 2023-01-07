local status, n = pcall(require, "onedark")
if (not status) then return end

n.setup({
  style = "cool",
  transparent = true,
  lualine = {
    transparent = false,
  },
  code_style = {
    comments = "italic",
    functions = "none",
    keywords = "none",
    strings = "none",
    variables = "none",
  },
})

vim.cmd [[colorscheme onedark]]
