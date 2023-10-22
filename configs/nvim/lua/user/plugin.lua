local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    lazy = true,
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional
    },
  },

  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = false,
  },

  {
    "andweeb/presence.nvim",
    lazy = false,
  },

  -- manipulating surroundings
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({
        -- TODO: config this line for custom
      })
    end
  },

  -- autopairs
  {
    "windwp/nvim-autopairs"
  },

  -- keybinding management
  {
    'folke/which-key.nvim',
    lazy = true,
  },

  -- bufferline
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  -- Colorscheme
  {
    'folke/tokyonight.nvim',
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "lunarvim/horizon.nvim"
  },
  {
    "sheerun/vim-polyglot"
  },
  -- Hop (Better Navigation)
  {
    "phaazon/hop.nvim",
    lazy = true,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {}
  },

  -- Rainbow Highlighting
  {
    "HiPhish/nvim-ts-rainbow2",
  },
  -- Lualine (THE NEW EXTENSION ADDED IN CONFIGURATION)
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
    }
  },
  {
    "nvim-treesitter/nvim-treesitter",
  },
  -- Language Support
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      -- {'williamboman/mason.nvim'},           -- Optional
      -- {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },         -- Required
      { 'hrsh7th/cmp-nvim-lsp' },     -- Required
      { 'hrsh7th/cmp-buffer' },       -- Optional
      { 'hrsh7th/cmp-path' },         -- Optional
      { 'saadparwaiz1/cmp_luasnip' }, -- Optional
      { 'hrsh7th/cmp-nvim-lua' },     -- Optional

      -- Snippets
      { 'L3MON4D3/LuaSnip' },             -- Required
      { 'rafamadriz/friendly-snippets' }, -- Optional
    },
  },

  -- git
  {
    "lewis6991/gitsigns.nvim",
  },
  {
    "f-person/git-blame.nvim"
  }
})
