return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", config = true },
      { "williamboman/mason-lspconfig.nvim" },
      { "hrsh7th/cmp-nvim-lsp" },
    },
    config = function()
      require("mason-lspconfig").setup({
        automatic_installation = true,
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
          "ts_ls",
          "yamlls",
        },
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("mason-lspconfig").setup_handlers({
        function(server)
          require("lspconfig")[server].setup({
            capabilities = capabilities,
            on_attach = function(_, bufnr)
              local map = function(mode, keys, func, desc)
                vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
              end

              map({ "n" }, "K", vim.lsp.buf.hover, "Hover")
              map({ "n" }, "gd", require("telescope.builtin").lsp_definitions, "Definitions")
              map({ "n" }, "gr", require("telescope.builtin").lsp_references, "References")
              map({ "n" }, "gl", vim.diagnostic.open_float, "Line Diagnostics")
              map({ "n" }, "<leader>td", require("telescope.builtin").lsp_type_definitions, "Type Definitions")
              map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
              map({ "n" }, "<leader>rn", vim.lsp.buf.rename, "Rename")
              map({ "n" }, "<leader>lf", function() vim.lsp.buf.format { async = true } end, "Format Document")
              map({ "n" }, "<leader>xx", require("telescope.builtin").diagnostics, "All Diagnostics")
            end,
          })
        end,
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = {
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<CR>"]  = cmp.mapping.confirm({ select = true }),
        },
        sources = {
          { name = "nvim_lsp" },
        },
      })
    end,
  },
}
