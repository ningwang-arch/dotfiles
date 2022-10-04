local aerial = require "aerial"

local M = {}

M.setup = function()
  aerial.setup {
    backends = { "treesitter" },
    close_automatic_events = { "unsupported" },
    default_direction = "prefer_right",
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
    max_width = 40,
    min_width = 40,
    nerd_font = "auto",

    treesitter = {
      -- How long to wait (in ms) after a buffer change before updating
      update_delay = 300,
    },
  }
end

return M
