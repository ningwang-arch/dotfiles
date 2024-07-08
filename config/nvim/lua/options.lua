require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

local g = vim.g
local opt = vim.opt

local languages = {
  go = {
    tabwidth = 4,
    expandtab = false,
  },
  rust = {
    tabwidth = 4,
    expandtab = true,
  },
  c = {
    tabwidth = 4,
    expandtab = true,
  },
  cpp = {
    tabwidth = 4,
    expandtab = true,
  },
}


vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("tabset", { clear = true }),
  callback = function()
    local tabwidth = 2
    local expandtab = true
    local filetype = vim.o.filetype

    if languages[filetype] ~= nil then
      tabwidth = languages[filetype].tabwidth
      expandtab = languages[filetype].expandtab
    end

    opt.expandtab = expandtab
    opt.shiftwidth = tabwidth
    opt.smartindent = true
    opt.tabstop = tabwidth
    opt.softtabstop = tabwidth
  end,
})