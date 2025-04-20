local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.5

return {
  {
    "stevearc/oil.nvim",
    opts = {},
    cmd = { "Oil" },
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Oil - parent dir" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
    keys = {
      { "<leader>ft", "<cmd>NvimTreeToggle<cr>", desc = "Tree toggle" },
      { "<leader>ff", "<cmd>NvimTreeFindFile<cr>", desc = "Reveal current file" },
    },
    opts = {
      git = { enable = true },
      actions = { open_file = { window_picker = { enable = false } } },
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        local opts = function(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        vim.keymap.set("n", "<cr>", api.node.open.edit, opts "Open")
        vim.keymap.set("n", "a", api.fs.create, opts "Create")
        vim.keymap.set("n", "c", api.fs.copy.node, opts "Copy")
        vim.keymap.set("n", "d", api.fs.remove, opts "Delete")
        vim.keymap.set("n", "o", api.node.open.edit, opts "Open")
        vim.keymap.set("n", "p", api.fs.paste, opts "Paste")
        vim.keymap.set("n", "q", api.tree.close, opts "Close")
        vim.keymap.set("n", "<esc>", api.tree.close, opts "Close")
        vim.keymap.set("n", "r", api.fs.rename, opts "Rename")
        vim.keymap.set("n", "R", api.tree.reload, opts "Refresh")
        vim.keymap.set("n", "x", api.fs.cut, opts "Cut")
        vim.keymap.set("n", "y", api.fs.copy.filename, opts "Copy Name")
        vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts "Copy Relative Path")
      end,
      view = {
        float = {
          enable = true,
          open_win_config = function()
            local screen_w = vim.opt.columns:get()
            local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
            local window_w = screen_w * WIDTH_RATIO
            local window_h = screen_h * HEIGHT_RATIO
            local window_w_int = math.floor(window_w)
            local window_h_int = math.floor(window_h)
            local center_x = (screen_w - window_w) / 2
            local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
            return {
              border = "rounded",
              relative = "editor",
              row = center_y,
              col = center_x,
              width = window_w_int,
              height = window_h_int,
            }
          end,
        },
        width = function()
          return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
        end,
      },
      renderer = { icons = { show = { folder_arrow = false } } },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = "nvim-lua/plenary.nvim",
    keys = {
      {
        "<leader>fs",
        function() require("telescope.builtin").find_files({
          hidden = true,
          file_ignore_patterns = { "^.git/", "^node_modules/" },
        }) end,
        desc = "Find Files",
      },
      { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Git Files" },
      { "<leader>bl", "<cmd>Telescope buffers<cr>",  desc = "Buffers" },
      {
        "<leader>rg",
        function()
          require("telescope.builtin").live_grep({
            additional_args = function()
              return {
                "--hidden",
                "-g", "!.git/",
                "-g", "!node_modules/",
              }
            end,
          })
        end,
        desc = "Grep",
      },
      { "<leader>tr", "<cmd>Telescope treesitter<cr>", desc = "Treesitter" },
    },
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("ui-select")
    end,
  },
  {
    "folke/flash.nvim",
    opts = {
      modes = {
        char = {
          enabled = false,
        },
      },
    },
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function() require("flash").jump() end,
        desc = "Flash jump",
      },
    },
  },
}

