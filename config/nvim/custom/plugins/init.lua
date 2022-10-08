-- Example pgugins file!
-- (suggestion) -> lua/custom/plugins/init.lua or anywhere in custom dir

local overrides = require "custom.override"

return {
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  ["lukas-reineke/indent-blankline.nvim"] = {
    override_options = overrides.blankline,
  },
  ["hrsh7th/nvim-cmp"] = {
    override_options = function()
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
  },
  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },
  ["iamcco/markdown-preview.nvim"] = {
    ft = { "markdown" },
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      vim.g.mkdp_echo_preview_url = 1
      vim.g.mkdp_port = "11223"
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },
  ["folke/trouble.nvim"] = {
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("custom.plugins.trouble").setup()
    end,
  },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.null-ls").setup()
    end,
  },

  -- load it after nvim-lspconfig cuz we lazy loaded lspconfig
  ["nvim-telescope/telescope-media-files.nvim"] = {
    after = "telescope.nvim",
    config = function()
      require("telescope").setup {
        extensions = {
          media_files = {
            filetypes = { "png", "webp", "jpg", "jpeg" },
            find_cmd = "rg", -- find command (defaults to `fd`)
          },
        },
      }
      require("telescope").load_extension "media_files"
    end,
  },

  ["stevearc/aerial.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.aerial").setup()
    end,
  },
  ["p00f/nvim-ts-rainbow"] = {
    after = "nvim-treesitter",
    event = "BufRead",
    config = function()
      require("nvim-treesitter.configs").setup {
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = nil, -- Do not enable for files with more than n lines, int
        },
      }
    end,
  },
  ["mbbill/undotree"] = {
    cmd = "UndotreeToggle",
  },
  ["goolord/alpha-nvim"] = {
    disable = false,
  },
  ["romainl/vim-cool"] = {
    event = { "CursorMoved", "InsertEnter" },
  },
  ["zbirenbaum/copilot.lua"] = {
    event = "VimEnter",
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    end,
  },
  ["zbirenbaum/copilot-cmp"] = {
    after = "copilot.lua",
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  ["folke/which-key.nvim"] = false,
  -- load it after nvim-lspconfig , since we'll use some lspconfig stuff in the null-ls config!
}
