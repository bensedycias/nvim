return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore_enabled = false,
      auto_session_suppress_dirs = {"~/", "~/dev"},
    })

    vim.keymap.set("n", "<leader>wr", "<cmd>AutoSession restore<CR>", {desc = "Restore session for cwd"})
    vim.keymap.set("n", "<leader>ws", "<cmd>AutoSession save<CR>", {desc = "Save session for auto session root dir"})

    -- save session on quit
    vim.keymap.set("n", "ZZ", function()
      vim.cmd("AutoSession save")
      vim.cmd("wqa")
    end, {desc = "save and quit"})
  end
}

-- vim.keymap.set("n", "<leader>lr", function()
--     vim.cmd("lsp restart")
--     vim.notify("LSP restarted", vim.log.levels.INFO)
-- end, { desc = "Restart LSP" })
