return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
    "nvim-tree/nvim-web-devicons",
    "andrew-george/telescope-themes",
  },

  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.load_extension("fzf")
    telescope.load_extension("themes")

    telescope.setup({
      defaults = {
        path_display = {"smart"},
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
          },
        },
        extensions = {
          themes = {
            enable_previewer = true,
            enable_live_preview = true,
            persist = {
              enabled = true,
              path = vim.fn.stdpath("config") .. "/lua/current-theme.lua",
            },
          },
        },
      },
    })

    -- Keymaps
    vim.keymap.set(
      "n", "<leader>pr", "<cmd>Telescope oldfiles<CR>",
      {desc = "Fuzzy find recent files"}
    )
    vim.keymap.set(
      "n", "<leader>th", "<cmd>Telescope themes<CR>",
      {noremap = true, silent = true, desc = "Theme Switcher"}
    )
  end
}
