-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.o.termguicolors = true

require("lazy").setup({
  "github/copilot.vim",
  "onsails/lspkind.nvim",
  "ray-x/go.nvim",
  "nvim-lualine/lualine.nvim",
  "williamboman/mason.nvim",
  "folke/twilight.nvim",
  { "wakatime/vim-wakatime", lazy = false },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- For LSP logs / status
      "j-hui/fidget.nvim",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      pcall(require("nvim-treesitter.install").update({ with_sync = true }))
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
  {
    "mistricky/codesnap.nvim",
    build = "make",
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        progress = {
          enabled = false,
        },
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")

      -- Custom black formatter that uses pipenv if Pipfile exists
      conform.formatters.black = {
        command = function()
          -- Check if we're in a pipenv project
          local pipfile = vim.fn.findfile("Pipfile", ".;")
          if pipfile ~= "" then
            return "pipenv"
          end
          return "black"
        end,
        args = function()
          local pipfile = vim.fn.findfile("Pipfile", ".;")
          if pipfile ~= "" then
            return { "run", "black", "--quiet", "-" }
          end
          return { "--quiet", "-" }
        end,
        stdin = true,
      }

      conform.setup({
        formatters_by_ft = {
          go = { "gofmt" },
          lua = { "stylua" },
          markdown = { "prettier" },
          nix = { "nixpkgs-fmt" },
          python = { "black" },
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout = 10000,
        },
      })

      vim.keymap.set({ "n", "v" }, "<leader>mp", function()
        require("conform").format({
          lsp_fallback = true,
          async = false,
          timeout = 5000,
        })
      end)
    end,
  },
  {
    "f-person/git-blame.nvim",
    -- load the plugin at startup
    event = "VeryLazy",
    -- Because of the keys part, you will be lazy loading this plugin.
    -- The plugin will only load once one of the keys is used.
    -- If you want to load the plugin at startup, add something like event = "VeryLazy",
    -- or lazy = false. One of both options will work.
    opts = {
      -- your configuration comes here
      -- for example
      enabled = true, -- if you want to enable the plugin
      message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
      date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
      virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
    },
  },
  {
    "andythigpen/nvim-coverage",
    version = "*",
    config = function()
      require("coverage").setup({
        auto_reload = true,
      })
    end,
  },
  {
    "kawre/leetcode.nvim",
    dependencies = {
      -- include a picker of your choice, see picker section for more details
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      -- configuration goes here
    },
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      dashboard = {
        enabled = true,
        width = 60,
        pane_gap = 16,
        sections = {
          {
            pane = 1,
            padding = 5,
            align = 'center',
            {
              enabled = function() return vim.o.lines > 40 end,
              section = 'terminal',
              cmd =
              'ascii-image-converter --color -H30 -c "$HOME/.config/nvim/data/dash.gif"',
              height = 30,
              padding = 2,
              align = 'center',
            },
            {
              enabled = function() return not (vim.o.lines > 40) and vim.o.columns > 70 end,
              section = 'terminal',
              cmd =
              'ascii-image-converter --color -H24 -c "$HOME/.config/nvim/data/dash.gif"',
              height = 24,
              padding = 2,
              indent = 13,
              align = 'center',
            },
            {
              enabled = function() return not (vim.o.columns > 140) and vim.o.lines > 40 end,
              section = 'keys',
              padding = 2,
              align = 'left',
              gap = 1
            },
            {
              enabled = function() return not (vim.o.columns > 140) and vim.o.lines > 40 end,
              icon = ' ',
              title = 'Recent Files',
            },
            {
              enabled = function() return not (vim.o.columns > 140) and vim.o.lines > 40 end,
              section = 'recent_files',
              opts = { limit = 5 },
              align = 'left',
              padding = 2,
            },
            {
              enabled = function() return not (vim.o.columns > 140) and vim.o.lines > 40 end,
              section = 'startup',
              padding = 2,
            },
          },
          {
            pane = 2,
            padding = 5,
            align = 'center',
            {
              enabled = function() return vim.o.columns > 140 or not (vim.o.lines > 40) end,
              section = 'keys',
              padding = 2,
              align = 'left',
              gap = 1,
            },
            {
              enabled = function() return vim.o.columns > 140 or not (vim.o.lines > 40) end,
              icon = ' ',
              title = 'Recent Files',
            },
            {
              enabled = function() return vim.o.columns > 140 or not (vim.o.lines > 40) end,
              section = 'recent_files',
              opts = { limit = 5 },
              align = 'left',
              padding = 2,
            },
            {
              enabled = function() return vim.o.columns > 140 or not (vim.o.lines > 40) end,
              section = 'startup',
              padding = 2,
            },
          },
        },
      },
      explorer = { enabled = false },
      indent = { enabled = true, scope = { enabled = false } },
      input = { enabled = false },
      picker = { enabled = false },
      notifier = { enabled = true },
      quickfile = { enabled = false },
      scope = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = true },
      words = { enabled = false },
      lazygit = { enabled = true },
    },
  }
})
