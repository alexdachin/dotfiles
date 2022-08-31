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
      require'nvim-tree'.setup {
        actions = {
          open_file = {
            window_picker = {
              enable = true,
            },
          },
        },
        git = {
          enable = false,
        },
        renderer = {
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = false,
              git = false,
            },
          },
        },
        view = {
          mappings = {
            list = {
              { key = 'H', action = '' }, -- disable toggling hidden items
            },
          },
        },
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
    'neovim/nvim-lspconfig',
    config = function()
      local nvim_lsp = require('lspconfig')
      local on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local opts = { noremap=true, silent=true }
        buf_set_keymap('n', '<space>ld', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        buf_set_keymap('n', '<space>lh', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        buf_set_keymap('n', '<space>ls', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        buf_set_keymap('n', '<space>lt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        buf_set_keymap('n', '<space>lca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        buf_set_keymap('n', '<space>lrn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        buf_set_keymap('n', '<space>lre', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        buf_set_keymap('n', '<space>lf', '<cmd>lua vim.lsp.buf.formatting()<cr>', opts)
        buf_set_keymap('n', '<space>lj', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
        buf_set_keymap('n', '<space>lk', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
      end

      local servers = { 'eslint', 'jsonls', 'pyright', 'rust_analyzer', 'solargraph', 'terraformls', 'tsserver', 'vimls' }
      for _, lsp in ipairs(servers) do
        nvim_lsp[lsp].setup { on_attach = on_attach, flags = { debounce_text_changes = 150 } }
      end
    end
  }
  use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}}
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = {
          'bash',
          'css',
          'dockerfile',
          'fish',
          'go',
          'graphql',
          'hcl',
          'html',
          'http',
          'java',
          'javascript',
          'json',
          'kotlin',
          'lua',
          'make',
          'php',
          'python',
          'prisma',
          'ruby',
          'rust',
          'scala',
          'scss',
          'svelte',
          'tsx',
          'typescript',
          'vim',
          'vue',
          'yaml',
        },
        sync_install = false,
        highlight = { enable = true },
      }
    end
  }
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