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

-- Floaterm Mappings
keymap.set('n', 'gh',
  '<cmd> :FloatermNew --height=0.9 --width=0.9 --wintype=float --name=LazyGit --position=center gh<CR>')
keymap.set('n', 'tn',
  '<cmd> :FloatermNew --height=0.8 --width=0.8 --wintype=float --name=Notes --position=center $HOME/bin/notes.sh<CR>')
keymap.set('n', 'tv',
  '<cmd> :FloatermNew --height=0.8 --width=0.8 --wintype=float --name=ViewNotes --position=center glow $HOME/notes<CR>')

-- Telescope Commands
keymap.set('n', 'ff', '<cmd> Telescope file_browser <CR>')
keymap.set('n', '<Space>f', '<cmd> Telescope find_files <CR>')
keymap.set('n', '<Space>r', '<cmd> Telescope buffers <CR>')

-- New tab
keymap.set('n', 'tt', '<cmd> tabedit <CR>')
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
keymap.set('n', '<Space>h', '<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><')
keymap.set('n', '<Space>l', '<C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>>')
keymap.set('n', '<Space>k', '<C-w>+<C-w>+<C-w>+<C-w>+<C-w>+<C-w>+<C-w>+')
keymap.set('n', '<Space>j', '<C-w>-<C-w>-<C-w>-<C-w>-<C-w>-<C-w>-<C-w>-')
