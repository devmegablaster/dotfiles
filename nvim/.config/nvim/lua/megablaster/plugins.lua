local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end


packer.startup(function(use)
  -- Packer
  use 'wbthomason/packer.nvim'

  -- NeoSolarized
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }

  -- Lualine
  use 'nvim-lualine/lualine.nvim'

  -- Marking
  use 'kshenoy/vim-signature'

  -- Floaterm
  use 'voldikss/vim-floaterm'

  -- Common Utilities
  use 'nvim-lua/plenary.nvim'

  -- Vscode Like Pictograms
  use 'onsails/lspkind-nvim'

  -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-buffer'

  -- nvim-cmp source for nvim-lsp
  use 'hrsh7th/cmp-nvim-lsp'

  -- Completion
  use 'hrsh7th/nvim-cmp'

  -- LSP
  use 'neovim/nvim-lspconfig'

  -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via lua
  use 'jose-elias-alvarez/null-ls.nvim'

  -- Mason
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- Wakatime
  use 'wakatime/vim-wakatime'

  -- LSP UIs
  use 'glepnir/lspsaga.nvim'
  use 'L3MON4D3/LuaSnip'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- File Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- Autopairs
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  -- Colourizer
  use 'norcalli/nvim-colorizer.lua'

  -- Buffer Line
  use 'akinsho/nvim-bufferline.lua'

  -- Git
  use 'github/copilot.vim'
  use 'dinhhuy258/git.nvim'
  use 'lewis6991/gitsigns.nvim'

  --Alpha
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.startify'.config)
    end
  }

  -- Nvim Tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    tag = 'nightly'
  }

end)

vim.cmd [[packadd packer.nvim]]
