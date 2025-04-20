return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "bash",
        "css",
        "dockerfile",
        "go",
        "java",
        "javascript",
        "json",
        "lua",
        "rust",
        "tsx",
        "typescript",
        "vim",
        "xml",
        "yaml",
      },
      highlight = { enable = true },
      incremental_selection = { enable = true },
    },
  },
}
