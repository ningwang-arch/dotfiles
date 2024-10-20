-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onedark",
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.ui = {
  statusline = {
    enbale = true,
    theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
  },
  telescope = { style = "bordered" },
}
M.mason = {
  cmd = true,
  pkgs = {
    "clangd",
    "jedi-language-server",
    "cmake-language-server",
    "lua-language-server",
    "rust-analyzer",
  },
}

return M
