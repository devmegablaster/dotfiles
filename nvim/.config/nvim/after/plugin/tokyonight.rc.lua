local status, n = pcall(require, "tokyonight")
if (not status) then return end

n.setup({
  transparent = true,
  night_brightness = 1,
})
