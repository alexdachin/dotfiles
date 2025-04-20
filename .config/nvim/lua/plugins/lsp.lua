return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {},
  },
  {
    "echasnovski/mini.completion",
    event = "InsertEnter",
    config = function()
      require("mini.completion").setup({
        lsp_completion = { source_func = "omnifunc", auto_setup = true },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", config = true },
      { "williamboman/mason-lspconfig.nvim" },
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

      require("mason-lspconfig").setup_handlers({
        function(server)
          require("lspconfig")[server].setup({
            on_attach = function(_, bufnr)
              local nmap = function(keys, func, desc)
                vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
              end

              nmap("K", vim.lsp.buf.hover, "Hover")
              nmap("gd", require("telescope.builtin").lsp_definitions, "Definitions")
              nmap("gr", require("telescope.builtin").lsp_references, "References")
              nmap("gl", vim.diagnostic.open_float, "Line Diagnostics")
              nmap("<leader>td", require("telescope.builtin").lsp_type_definitions, "Type Definitions")
              nmap("<leader>ca", vim.lsp.buf.code_action, "Code Action")
              nmap("<leader>rn", vim.lsp.buf.rename, "Rename")
              nmap("<leader>lf", function() vim.lsp.buf.format { async = true } end, "Format Document")
              nmap("<leader>xx", require("telescope.builtin").diagnostics, "All Diagnostics")
            end,
          })
        end,
      })
    end,
  }
}
