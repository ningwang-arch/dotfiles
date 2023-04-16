local illuminate = require "illuminate"

local M = {}

M.setup = function()
  illuminate.configure {
    providers = {
      "lsp",
      "treesitter",
      "regex",
    },
    delay = 100,
    filetypes_denylist = {
      "alpha",
      "dashboard",
      "DoomInfo",
      "fugitive",
      "help",
      "norg",
      "NvimTree",
      "Outline",
      "packer",
      "toggleterm",
    },
    under_cursor = false,
  }
end

return M
