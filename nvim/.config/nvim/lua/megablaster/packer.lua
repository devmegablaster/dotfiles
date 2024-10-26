vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use 'folke/tokyonight.nvim'

  use('nvim-treesitter/playground')

  use 'APZelos/blamer.nvim'

  use 'wakatime/vim-wakatime'

  use({
  'nvim-treesitter/nvim-treesitter',
  { run = ':TSUpdate' }
  })

  use 'github/copilot.vim'

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use (
    'windwp/nvim-ts-autotag'
    )

  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  requires = {
    --- Uncomment the two plugins below if you want to manage the language servers from neovim
    -- {'williamboman/mason.nvim'},
    -- {'williamboman/mason-lspconfig.nvim'},

    {'neovim/nvim-lspconfig'},
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'L3MON4D3/LuaSnip'},
  }
  }

  use ('MunifTanjim/prettier.nvim')

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use 'navarasu/onedark.nvim'

  use 'ThePrimeagen/harpoon'

end
)
