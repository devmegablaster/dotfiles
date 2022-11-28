require('megablaster.base')
require('megablaster.highlights')
require('megablaster.maps')
require('megablaster.plugins')

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require('megablaster.macos')
end
if is_win then
  require('megablaster.windows')
end
