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
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
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
  ["folke/which-key.nvim"] = false,
  -- load it after nvim-lspconfig , since we'll use some lspconfig stuff in the null-ls config!
}
