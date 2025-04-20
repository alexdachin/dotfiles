return {
  {
    "rmehri01/onenord.nvim",
    priority = 1000,
    config = function()
      require("onenord").setup()
      vim.cmd.colorscheme("onenord")

      vim.api.nvim_set_hl(0, "Identifier", { fg = "#c0aaff", italic = true })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      options = {
        theme = "onenord",
        section_separators = "",
        component_separators = "|",
      },
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
}
