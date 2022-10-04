-- overriding default plugin configs!

local M = {}

M.treesitter = {
  ensure_installed = {
    "lua",
    "vim",
    "c",
    "cpp",
    "json",
    "python",
    "html",
    "css",
    "markdown",
    "javascript",
    "java",
    "make",
    "cmake",
    "bash",
  },
}
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}
M.blankline = {
  filetype_exclude = {
    "help",
    "terminal",
    "alpha",
    "packer",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "nvchad_cheatsheet",
    "lsp-installer",
    "norg",
    "",
  },
}

M.mason = {
  ensure_installed = {
    "clangd",
    "jedi-language-server",
    "cmake-language-server",
    "lua-language-server",
    "lemminx",
  },
}

return M
