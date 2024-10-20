require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<F2>", "<cmd> AerialToggle <CR>", { desc = "Toggle Aerial" })
map("n", "<leader>lf", '<cmd> lua vim.diagnostic.open_float { border = "rounded" } <CR>', { desc = "Open diagnostics" })
map("n", "[d", '<cmd> lua vim.diagnostic.goto_prev { float = { border = "rounded" } } <CR>', { desc = "Goto prev" })
map("n", "]d", '<cmd> lua vim.diagnostic.goto_next { float = { border = "rounded" } } <CR>', { desc = "Goto next" })
map({ "n", "i" }, "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
