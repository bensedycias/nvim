return {
  {
    "folke/snacks.nvim",
    priority = 1000, lazy = false,
    opts = {
      explorer = {
        enabled = true,
        layout = {
          cycle = false,
        }
      },
      quickfile = {
        enabled = true,
        exclude  = {"latex"},
      },
      picker = {
        enabled = true,
        matchers = {
          frecency = true,
          cwd_bonus = true,
        },
        formatters = {
          file = {
            filename_first = false,
            filename_only = false,
            icon_width = 2,
          },
        },
        layout = {
          preset = "telescope",
          cycle = false,
        },
        layouts = {
          select = {
            preview = false,
            layout = {
              backdrop = false,
              width = 0.6, min_width = 80,
              height = 0.4, min_height = 10,
              box = "vertical", border = "rounded",
              title = "{title}", title_pos  = "center",
              {
                height = 1,
                win = "input",
                border = "bottom"
              },
              {
                win = "list",
                border = "none"
              },
              {
                width = 0.6,
                height = 0.4,
                win = "preview",
                title = "{preview}",
                border = "top"
              },
            },
          },
          telescope = {
            reverse = true,
            layout = {
              box = "horizontal",
              backdrop = false,
              width = 0.8,
              height = 0.9,
              border = "none",
              {
                box = "vertical",
                {win = "list", title = " Results ", title_pos = "center", border = "rounded"},
                {win = "input", height = 1, border = "rounded", title = "{title} {live} {flags}", title_pos = "center"},
              },
              {
                win = "preview",
                title = "{preview:Preview}",
                width = 0.5,
                border = "rounded",
                title_pos = "center",
              },
            },
          },
          ivy = {
            layout = {
              box = "vertical",
              backdrop = false,
              width = 0,
              height = 0.4,
              position = "bottom",
              border = "top",
              title = "{title} {live} {flags}",
              title_pos = "left",
              {
                win = "input",
                height = 1,
                border = "bottom",
              },
              {
                box = "horizontal",
                {
                  win = "list",
                  border = "none",
                },
                {
                  win = "preview",
                  title = "{preview}",
                  width = 0.5,
                  border = "left"
                },
              },
            },
          },
        }
      },
      dashboard = {
        enabled = true,
        sections = {
          { section = "terminal",
            cmd = "figlet -f slant 'PathosVim'",
            height = 6,
            random = 10,
            indent = 4,
          },
          {section = "keys", gap = 1, padding = 1},
          {section = "startup"},
        },
      },
      scroll = {
        enabled = true,
      },
    },
    keys = {
      {"<leader>lg", function() require("snacks").lazygit() end, desc = "Lazygit"},
      {"<leader>gl", function() require("snacks").lazygit.log() end, desc = "Lazygit Logs"},
      {"<leader>es", function() require("snacks").explorer() end, desc = "Open Snacks Explorer"},
      {"<leader>rN", function() require("snacks").rename.rename_files() end, desc = "Fast Rename Current Files"},

      -- Snacks Picker
      {"<leader>pf", function() require("snacks").picker.files() end, desc = "Find Files (Snacks Picker)"},
      {"<leader>pc", function() require("snacks").picker.files({cwd = vim.fn.stdpath("config")}) end, desc = "Find Config File"},
      {"<leader>ph", function() require("snacks").picker.files({cwd = "~/.config/hypr"}) end, desc = "Find Config File"},
      {"<leader>ps", function() require("snacks").picker.grep() end, desc = "Grep Word"},
      {"<leader>gbr", function() require("snacks").picker.git_branches({layout = "select"}) end, desc = "Pick and Switch Git Branches"},

      -- Help and Reminders
      {"<leader>pk", function() require("snacks").picker.keymaps({layout = "ivy"}) end, desc = "Search Keymaps (Snacks Picker)"},
      {"<leader>vh", function() require("snacks").picker.help() end, desc = "Help Pages"},
    }
  }

}
