return {
  -- NOTE: nightfox
  {
    "EdenEast/nightfox.nvim",
    priority = 1000, lazy = true,
    config = function()
      require('nightfox').setup({
        options = {
          -- Compiled file's destination location
          compile_path = vim.fn.stdpath("cache") .. "/nightfox", compile_file_suffix = "_compiled", -- Compiled file suffix
          transparent = true,     -- Disable setting background
          terminal_colors = true,  -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
          dim_inactive = false,    -- Non focused panes set to alternative background
          module_default = true,   -- Default enable value for modules
          colorblind = {
            enable = false,        -- Enable colorblind support
            simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
            severity = {
              protan = 0,          -- Severity [0,1] for protan (red)
              deutan = 0,          -- Severity [0,1] for deutan (green)
              tritan = 0,          -- Severity [0,1] for tritan (blue)
            },
          },
          styles = {               -- Style to be applied to different syntax groups
            comments = "italic",     -- Value is any valid attr-list value `:help attr-list`
            conditionals = "NONE",
            constants = "NONE",
            functions = "NONE",
            keywords = "italic",
            numbers = "NONE",
            operators = "NONE",
            strings = "NONE",
            types = "NONE",
            variables = "NONE",
          },
          inverse = {             -- Inverse highlight for different types
            match_paren = false,
            visual = false,
            search = false,
          },
          modules = {             -- List of various plugins and additional options
            -- ...
          },
        },
        palettes = {},
        specs = {},
        groups = {},
      })
    end,
  },
  {
    "eldritch-theme/eldritch.nvim",
    priority = 1000, lazy = true,
    opts = {},
    config = function()
      require("eldritch").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- palette = "default", -- This option is deprecated. Use `vim.cmd[[colorscheme eldritch-dark]]` or `vim.cmd[[colorscheme eldritch-minimal]] instead.
        transparent = true, -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
        styles = {
          -- Style to be applied to different syntax groups
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = "dark", -- style for sidebars, see below
          floats = "dark", -- style for floating windows
        },
        sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
        hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
        dim_inactive = false, -- dims inactive windows, transparent must be false for this to work
        lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

        --- You can override specific color groups to use other groups or a hex color
        --- function will be called with a ColorScheme table
        ---@param colors ColorScheme
        on_colors = function(colors) end,

        --- You can override specific highlights to use other groups or a hex color
        --- function will be called with a Highlights and ColorScheme table
        ---@param highlights Highlights
        ---@param colors ColorScheme
        on_highlights = function(highlights, colors) end,
      })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin-nvim",
    priority = 1000, lazy = true,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true,
        dim_inactive = {
          enabled = false,
          shade = "dark",
          percentage = 0.15,
        },
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = { "bold" },
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        custom_highlights = function(colors)
          return {
            ColorColumn = { bg = "#1C1C21" },

            -- Pmenu styling (similar to your rose-pine)
            Pmenu = { bg = colors.transparent_background, fg = colors.text },
            PmenuSel = { bg = colors.surface2, fg = "NONE" },
            PmenuSbar = { bg = colors.surface0 },
            PmenuThumb = { bg = colors.overlay2 },

            -- For fully transparent
            -- Normal = { bg = "none" },
            NormalFloat = { bg = "none" },
          }
        end,
        integrations = {
          treesitter = true,
          native_lsp = {
            enabled = true,
            virtual_text = { errors = { "italic" }, hints = { "italic" } },
          },
          lsp_trouble = true,
          lsp_saga = true,
          cmp = true,
          telescope = true,
          which_key = true,
          gitsigns = true,
          markdown = true,
          mini = true,
          dap = true,
          dap_ui = true,
          -- terminal = false,
        },
      })
    end,
  },
  {
    "olivercederborg/poimandres.nvim",
    priority = 1000, lazy = true,
    config = function()
      require('poimandres').setup {
        bold_vert_split = false, -- use bold vertical separators
        dim_nc_background = false, -- dim 'non-current' window backgrounds
        disable_background = true, -- disable background
        disable_float_background = true, -- disable background for floats
        disable_italics = false, -- disable italics
      }
    end
  },
  {
    "shaunsingh/nord.nvim",
    priority = 1000, lazy = true,
    config = function()
      vim.g.nord_contrast = false
      vim.g.nord_borders = false
      vim.g.nord_disable_background = true
      vim.g.nord_uniform_diff_background = false
      vim.g.nord_italic = false
      vim.g.nord_bold = false
    end
  },
  {
    "tiagovla/tokyodark.nvim",
    priority = 1000, lazy = true,
    config = function()
      require('tokyodark').setup {
        transparent_background = true
      }
    end
  },
  {
    "oskarnurm/koda.nvim",
    lazy = false, priority = 1000,
    config = function()
      require("koda").setup({
          transparent = true, -- enable for transparent backgrounds

          -- Set the variants to use when auto-switching based on vim.o.background
          -- Valid values: 'dark', 'light', 'moss', 'glade'
          theme = { dark = "dark", },

          -- Automatically enable highlights only for plugins installed by your plugin manager
          -- Currently only supports `lazy.nvim`, `mini.deps` and `vim.pack`
          auto = true,  -- disable to load ALL available plugin highlights

          cache = true, -- caches the theme for better performance

          -- Style to be applied to different syntax groups
          -- Common use case would be to set either `italic = true` or `bold = true` for a desired group
          -- See `:help nvim_set_hl` for more valid values
          styles = {
             functions = { bold = true },
             keywords  = { italic = true },
             comments  = { italic = true },
             strings   = {},
             constants = {}, -- includes numbers, booleans
          },

          -- Override colors for the active variant
          -- Available keys (e.g., 'func') can be found in lua/koda/palette/
          colors = {
            -- func = "#4078F2",
            -- keyword = "#A627A4",
          },

          -- You can modify or extend highlight groups using the `on_highlights` configuration option
          -- Any changes made take effect when highlights are applied
          on_highlights = function(hl, c)
            -- hl.LineNr = { fg = c.info } -- change a specific highlight to use a different palette color
            -- hl.Comment = { fg = c.emphasis, italic = true } -- modify a syntax group (add bold, italic, etc)
            -- hl.RainbowDelimiterRed = { fg = "#fb2b2b" } -- add a custom highlight group for another plugin
          end,
      })
    end
  },
}
