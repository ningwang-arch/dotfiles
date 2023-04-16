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
    "rust",
    "vue",
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
    "rust-analyzer",
    "vue-language-server",
    "css-lsp",
  },
}

M.cmp = {
  func = function()
    local compare = require "cmp.config.compare"
    local cmp = require "cmp"
    if not unpack then
      unpack = table.unpack
    end
    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
    end
    local t = function(str)
      return vim.api.nvim_replace_termcodes(str, true, true, true)
    end

    return {
      sorting = {
        priority_weight = 2,
        comparators = {
          require("copilot_cmp.comparators").prioritize,
          require("copilot_cmp.comparators").score,
          compare.offset,
          compare.exact,
          compare.score,
          compare.recently_used,
          compare.locality,
          compare.kind,
          compare.sort_text,
          compare.length,
          compare.order,
        },
      },
      sources = {
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "copilot" },
      },
      mapping = cmp.mapping.preset.insert {
        ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.close(),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif require("luasnip").expand_or_jumpable() then
            vim.fn.feedkeys(t "<Plug>luasnip-expand-or-jump", "")
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif require("luasnip").jumpable(-1) then
            vim.fn.feedkeys(t "<Plug>luasnip-jump-prev", "")
          else
            fallback()
          end
        end, { "i", "s" }),
      },
    }
  end,
}

return M
