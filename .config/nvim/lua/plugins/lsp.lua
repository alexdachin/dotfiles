return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { { "mason-org/mason.nvim", opts = {} }, "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls",
          "cssls",
          "dockerls",
          "eslint",
          "gopls",
          "jdtls",
          "jsonls",
          "lua_ls",
          "rust_analyzer",
          "starpls",
          "ts_ls",
          "yamlls",
        },
        automatic_enable = true,
      })

      vim.lsp.config('jdtls', {
        root_markers = { '.project' },
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(ev)
          local map = function(mode, keys, func, desc)
            vim.keymap.set(mode, keys, func, { buffer = ev.buf, desc = 'LSP: ' .. desc })
          end

          map('n', 'K', vim.lsp.buf.hover, 'Hover')
          map('n', 'gd', require('telescope.builtin').lsp_definitions, 'Definitions')
          map('n', 'grr', require('telescope.builtin').lsp_references, 'References')
          map('n', 'gl', vim.diagnostic.open_float, 'Line Diagnostics')
          map('n', '<leader>td', require('telescope.builtin').lsp_type_definitions, 'Type Definitions')
          map({ 'n', 'v' }, 'gra', vim.lsp.buf.code_action, 'Code Action')
          map('n', 'grn', vim.lsp.buf.rename, 'Rename')
          map('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end, 'Format Document')
          map('n', '<leader>xx', require('telescope.builtin').diagnostics, 'All Diagnostics')
        end,
      })
    end,
  },
  {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
      keymap = { preset = "enter" },
    },
  },
}
