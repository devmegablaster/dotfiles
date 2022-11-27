local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
  "",
  "",
  "",
  "",
  "",
  "                               )      ((     (           ",
  "                              (        ))     )\\ )        ",
  "                       )       )      //     (()/(   (     ",
  "                  _   (        __    (     ~->>                   ",
  "           ,-----' |__,_~~___<'__`)-~__--__-~->> <                ",
  "           | //  : | -__   ~__ o)____)),__ - '> >-  >             ",
  "           | //  : |- \\_ \\ -\\_\\ -\\ \\ \\ ~\\_  \\ ->> - ,  >>",
  "           | //  : |_~_\\ -\\__\\ \\~'\\ \\ \\, \\__ . -<-  >>    ",
  "           `-----._| `   -__`-- - ~~ -- ` --~> >                  ",
  "            _/___\\_    //)_`//  | ||]                            ",
  "      _____[_______]_[~~-_ (.L_/  ||]                             ",
  "     [____________________]' `\\_,/'/                             ",
  "       ||| /          |||  ,___,'./                               ",
  "       ||| \\          |||,'______|                               ",
  "       ||| /          /|| I==|||I==|                              ",
  "       ||| \\       __/_||  __||__  |                             ",
  "   -----||-/------`-._/||-o--o---o---                             ",
  "     ~~~~~'            `~~~~~~~~~~~~~                             ",
  "",
  "                   Meh..These bugs are annoying me                ",
  "",
  "",
}

-- Set menu
dashboard.section.buttons.val = {
  dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", "  > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
  dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
  dashboard.button("s", "  > Settings", "<cmd> e $MYVIMRC | :cd %:p:h | wincmd k | pwd<CR>"),
  dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
  dashboard.button("h", "  > Find help", ":Telescope help_tags<CR>"),
}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
