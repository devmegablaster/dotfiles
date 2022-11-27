local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

keymap.set('n', '<Space>e', '<cmd> NvimTreeToggle <CR>')
-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Floaterm keybindings
keymap.set('n', 'gg',
  '<cmd> :FloatermNew --height=0.8 --width=0.6 --wintype=float --name=LazyGit --position=center lg<CR>')

-- Telescope Commands
keymap.set('n', '<Space>t', '<cmd> Telescope find_files <CR>')
keymap.set('n', '<Space>f', '<cmd> Telescope file_browser <CR>')

-- New tab
keymap.set('n', 'te', ':tabedit')
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')
