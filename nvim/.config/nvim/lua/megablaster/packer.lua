vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use 'folke/tokyonight.nvim'

  use({ 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } })

  use('nvim-treesitter/playground')

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },         -- Required
      { 'williamboman/mason.nvim' },       -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'hrsh7th/cmp-buffer' },   -- Optional
      { 'hrsh7th/cmp-path' },     -- Optional
      { 'saadparwaiz1/cmp_luasnip' }, -- Optional
      { 'hrsh7th/cmp-nvim-lua' }, -- Optional

      -- Snippets
      { 'L3MON4D3/LuaSnip' },         -- Required
      { 'rafamadriz/friendly-snippets' }, -- Optional
    }
  }

  use 'wakatime/vim-wakatime'

  use 'github/copilot.vim'

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use (
    'windwp/nvim-ts-autotag'
    )

  use ('jose-elias-alvarez/null-ls.nvim')
  use ('MunifTanjim/prettier.nvim')

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use 'navarasu/onedark.nvim'

end
)
