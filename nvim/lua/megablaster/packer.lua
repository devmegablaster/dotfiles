vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {                                                                                                                                                                                        
    "folke/todo-comments.nvim",                                                                                                                                                                
    requires = {"nvim-lua/plenary.nvim"} 
  }

  use {
    'ray-x/go.nvim',
    requires = { 
      'ray-x/guihua.lua', -- recommended if need floating window support
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    }
  }

  use {
  'kawre/leetcode.nvim',
  requires = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim'
  }
}
  use 'rcarriga/nvim-notify'
  use 'nvim-tree/nvim-web-devicons'

  use {
    "williamboman/mason.nvim"
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use({
  "glacambre/firenvim",
  run = function() fn["firenvim#install"](0) end,
  opt = true,
  setup = [[vim.cmd('packadd firenvim')]],
  })

  use 'folke/tokyonight.nvim'

  use('nvim-treesitter/playground')

  use 'APZelos/blamer.nvim'

  use 'wakatime/vim-wakatime'

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use 'github/copilot.vim'

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use (
    'windwp/nvim-ts-autotag'
    )

  use ('MunifTanjim/prettier.nvim')

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use 'navarasu/onedark.nvim'

  use 'ThePrimeagen/harpoon'

  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  requires = {
    --- Uncomment the two plugins below if you want to manage the language servers from neovim
    -- {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    {'neovim/nvim-lspconfig'},
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'L3MON4D3/LuaSnip'},
  }
}

end
)
