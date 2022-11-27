local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    mode = "tabs",
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true
  },
  highlights = {
    separator = {
      fg = '#004400',
      bg = '#000000',
    },
    separator_selected = {
      fg = '#000000',
    },
    background = {
      fg = '#657b83',
      bg = '#000000'
    },
    buffer_selected = {
      fg = '#fdf6e3',
      bg = '#008800',
      bold = true,
    },
    fill = {
      bg = '#000000'
    }
  },
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
