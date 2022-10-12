local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function(use)
  use {'arcticicestudio/nord-vim'}

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
    },
    config = function() require('plugin-config.nvim-cmp') end
  }

  use {
    'itchyny/lightline.vim',
    config = function()
      vim.opt.laststatus = 2
      vim.g['lightline'] = { colorscheme = 'nord' }
    end
  }

  use {'kyazdani42/nvim-web-devicons'}

  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = {'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons', 'MunifTanjim/nui.nvim'},
    setup = function() vim.g.neo_tree_remove_legacy_commands = true end,
    config = function() require('plugin-config.neo-tree') end
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function()
      require('gitsigns').setup {
        signcolumn = true,
        numhl      = true,
      }
    end
  }

  use {'mattn/emmet-vim'}

  use {
    'neovim/nvim-lspconfig',
    after = 'cmp-nvim-lsp',
    config = function() require('plugin-config.nvim-lspconfig') end
  }

  use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}}

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require('plugin-config.nvim-treesitter') end
  }

  use {
    'phaazon/hop.nvim',
    config = function() require'hop'.setup() end
  }

  use {'tpope/vim-abolish'}

  use {'tpope/vim-fugitive'}

  use {'tpope/vim-surround'}

  use {'wbthomason/packer.nvim'}

  if packer_bootstrap then
    require('packer').sync()
  end
end)