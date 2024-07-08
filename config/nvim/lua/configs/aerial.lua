local aerial = require "aerial"

local M = {}

M.setup = function()
  aerial.setup {
    backends = { "treesitter" },
    close_automatic_events = { "unsupported" },
    highlight_closest = true,
    filter_kind = {
      "Array",
      "Boolean",
      "Class",
      "Constant",
      "Constructor",
      "Enum",
      "EnumMember",
      "Event",
      "Field",
      "File",
      "Function",
      "Interface",
      "Key",
      "Method",
      "Module",
      "Namespace",
      "Null",
      "Number",
      "Object",
      "Operator",
      "Package",
      "Property",
      "String",
      "Struct",
      "TypeParameter",
      "Variable",
    },
    nerd_font = "auto",
    layout = {
      -- These control the width of the aerial window.
      -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      -- min_width and max_width can be a list of mixed types.
      -- max_width = {40, 0.2} means "the lesser of 40 columns or 20% of total"
      max_width = { 40, 0.2 },
      width = nil,
      min_width = 30,

      -- Determines the default direction to open the aerial window. The 'prefer'
      -- options will open the window in the other direction *if* there is a
      -- different buffer in the way of the preferred direction
      -- Enum: prefer_right, prefer_left, right, left, float
      default_direction = "prefer_right",

      -- Determines where the aerial window will be opened
      --   edge   - open aerial at the far right/left of the editor
      --   window - open aerial to the right/left of the current window
      placement = "window",
    },
    treesitter = {
      -- How long to wait (in ms) after a buffer change before updating
      update_delay = 300,
    },
  }
end

return M
