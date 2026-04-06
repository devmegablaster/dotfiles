local snacks = require("snacks")

vim.cmd("autocmd!")

vim.cmd("highlight! HarpoonInactive guibg=NONE guifg=#63698c")
vim.cmd("highlight! HarpoonActive guibg=NONE guifg=white")
vim.cmd("highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7")
vim.cmd("highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7")
vim.cmd("highlight! TabLineFill guibg=NONE guifg=white")

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- switch between buffers
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bp", ":bprev<CR>", { noremap = true, silent = true })

-- window/split navigation (works in both normal and insert mode)
vim.keymap.set({"n", "i"}, "<C-h>", "<C-\\><C-N><C-w>h", { noremap = true, silent = true, desc = "Move to left split" })
vim.keymap.set({"n", "i"}, "<C-j>", "<C-\\><C-N><C-w>j", { noremap = true, silent = true, desc = "Move to bottom split" })
vim.keymap.set({"n", "i"}, "<C-k>", "<C-\\><C-N><C-w>k", { noremap = true, silent = true, desc = "Move to top split" })
vim.keymap.set({"n", "i"}, "<C-l>", "<C-\\><C-N><C-w>l", { noremap = true, silent = true, desc = "Move to right split" })

-- split creation/management
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { noremap = true, silent = true, desc = "Vertical split" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { noremap = true, silent = true, desc = "Horizontal split" })
vim.keymap.set("n", "<leader>sc", ":close<CR>", { noremap = true, silent = true, desc = "Close current split" })
vim.keymap.set("n", "<leader>so", ":only<CR>", { noremap = true, silent = true, desc = "Close all other splits" })

-- Snacks
vim.keymap.set("n", "<leader>lg", function() snacks.lazygit() end, { noremap = true })

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.wo.relativenumber = true
vim.wo.number = true

vim.opt.clipboard = "unnamedplus"
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.cmd("autocmd FileType typescript set commentstring=//%s")
vim.opt.shell = "zsh"
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.inccommand = "split"
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false              -- No Wrap lines
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" })     -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.showmode = false          -- Don't show -- INSERT -- etc
vim.opt.ruler = false             -- Don't show the ruler
vim.opt.fillchars = { eob = " " } -- No ~ at End of Buffer

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

--noice
vim.api.nvim_set_keymap("n", "<leader>nn", ":Noice dismiss<CR>", { noremap = true, silent = true })

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })
