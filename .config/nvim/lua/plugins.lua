-- Bootstrap lazy.nvim
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

-- Plugins
require("lazy").setup({
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
    },
    config = function() require("plugin-config.nvim-cmp") end
  },

  "kyazdani42/nvim-web-devicons",

  {
    "nvim-lualine/lualine.nvim",
    dependencies = {"kyazdani42/nvim-web-devicons"},
    config = function() require("plugin-config.lualine") end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {"nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons", "MunifTanjim/nui.nvim"},
    init = function() vim.g.neo_tree_remove_legacy_commands = true end,
    config = function() require("plugin-config.neo-tree") end
  },

  "github/copilot.vim",

  {
    "lewis6991/gitsigns.nvim",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
      require("gitsigns").setup {
        signcolumn = true,
        numhl      = true,
      }
    end
  },

  "mattn/emmet-vim",

  {
    "neovim/nvim-lspconfig",
    dependencies = {"hrsh7th/cmp-nvim-lsp"},
    config = function() require("plugin-config.nvim-lspconfig") end
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {"nvim-lua/plenary.nvim"},
    tag = "0.1.4",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function() require("plugin-config.nvim-treesitter") end
  },

  {
    "phaazon/hop.nvim",
    config = function() require"hop".setup() end
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false, -- load during startup
    priority = 1000, -- load this before all the other start plugins
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato",
      })

      vim.cmd([[colorscheme catppuccin]])
    end,
  },

  "tpope/vim-abolish",

  "tpope/vim-fugitive",

  "tpope/vim-surround",
})