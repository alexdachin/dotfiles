local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function(use)
  use {'arcticicestudio/nord-vim'}
  use {
    'itchyny/lightline.vim',
    config = function()
      vim.opt.laststatus = 2
      vim.g['lightline'] = {
        colorscheme = 'nord'
      }
    end
  }
  use {'kyazdani42/nvim-web-devicons'}
  use {
    'kyazdani42/nvim-tree.lua',
    opt = true,
    cmd = {'NvimTreeToggle', 'NvimTreeFindFile'},
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function()
      vim.g['nvim_tree_disable_window_picker'] = 1
      require'nvim-tree'.setup {
        git = {
          enable = false
        }
      }
    end
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
    'phaazon/hop.nvim',
    config = function()
      require'hop'.setup()
    end
  }
  use {'tpope/vim-abolish'}
  use {'tpope/vim-fugitive'}
  use {'tpope/vim-surround'}
  use {'wbthomason/packer.nvim'}

  if packer_bootstrap then
    require('packer').sync()
  end
end)