-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "onedark",
  	statusline = {
    	theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
  	},
	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
	},
}

return M
