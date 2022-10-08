local M = {}

M.mdp = {
  n = {
    ["<F8>"] = { "<cmd> MarkdownPreviewToggle <CR>", "Markdown Preview Toggle" },
  },
}

M.tel = {
  n = {
    ["<leader>cc"] = { "<cmd> Telescope <CR>", "Telescope" },
  },
}

M.aer = {
  n = {
    ["<F2>"] = { "<cmd> AerialToggle <CR>", "AerialToggle" },
  },
}

M.lspconfig = {
  n = {
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "lsp formatting",
    },
  },
}

return M
