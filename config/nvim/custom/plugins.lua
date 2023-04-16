-- Example pgugins file!
-- (suggestion) -> lua/custom/configs/init.lua or anywhere in custom dir

local overrides = require "custom.override"

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufAdd", "BufNewFile" },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
    dependencies = {
      { "ray-x/lsp_signature.nvim" },
      {
        "stevearc/aerial.nvim",
        config = function()
          require("custom.configs.aerial").setup()
        end,
      },
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require("custom.configs.null-ls").setup()
        end,
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
    dependencies = {
      { "mrjones2014/nvim-ts-rainbow" },
      { "andymass/vim-matchup" },
      { "JoosepAlviste/nvim-ts-context-commentstring" },
      {
        "windwp/nvim-ts-autotag",
        config = function()
          require("nvim-ts-autotag").setup {
            filetypes = {
              "html",
              "javascript",
              "javascriptreact",
              "typescriptreact",
              "vue",
              "xml",
            },
          }
        end,
      },
      {
        "abecodes/tabout.nvim",
        config = function()
          require("tabout").setup {
            tabkey = "", -- key to trigger tabout, set to an empty string to disable
            backwards_tabkey = "", -- key to trigger backwards tabout, set to an empty string to disable
            act_as_tab = true, -- shift content if tab out is not possible
            act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
            enable_backwards = true,
            completion = true, -- if the tabkey is used in a completion pum
            tabouts = {
              { open = "'", close = "'" },
              { open = '"', close = '"' },
              { open = "`", close = "`" },
              { open = "(", close = ")" },
              { open = "[", close = "]" },
              { open = "{", close = "}" },
            },
            ignore_beginning = true, -- if the cursor is at the beginning of a filled element it will rather tab out than shift the content
            exclude = {}, -- tabout will ignore these filetypes
          }
        end,
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = overrides.blankline,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = require "custom.configs.cmp",
    dependencies = {
      { "onsails/lspkind.nvim" },
      { "lukas-reineke/cmp-under-comparator" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },
      { "andersevenrud/cmp-tmux" },
      { "hrsh7th/cmp-path" },
      { "f3fora/cmp-spell" },
      { "hrsh7th/cmp-buffer" },
      { "kdheepak/cmp-latex-symbols" },
      { "ray-x/cmp-treesitter" },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "iamcco/markdown-preview.nvim",
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
  {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
    config = function()
      require("custom.configs.trouble").setup()
    end,
  },

  -- load it after nvim-lspconfig cuz we lazy loaded lspconfig
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
  },
  {
    "goolord/alpha-nvim",
    disable = false,
  },
  {
    "romainl/vim-cool",
    lazy = true,
    event = { "CursorMoved", "InsertEnter" },
  },
  {
    "zbirenbaum/copilot.lua",
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    end,
    cmd = "Copilot",
    event = "InsertEnter",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          vim.defer_fn(function()
            require("copilot").setup {
              cmp = {
                enabled = true,
                method = "getCompletionsCycling",
              },
              panel = {
                -- if true, it can interfere with completions in copilot-cmp
                enabled = false,
              },
              suggestion = {
                -- if true, it can interfere with completions in copilot-cmp
                enabled = false,
              },
              filetypes = {
                ["dap-repl"] = false,
                ["big_file_disabled_ft"] = false,
              },
            }
          end, 100)
        end,
      },
    },
  },
  {
    "gelguy/wilder.nvim",
    event = "CmdlineEnter",
    config = function()
      require("custom.configs.wilder").setup()
    end,
    dependencies = { "romgrk/fzy-lua-native" },
  },
  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    config = function()
      require("custom.configs.illuminate").setup()
    end,
  },
  { "sindrets/diffview.nvim", lazy = true, cmd = { "DiffviewOpen", "DiffviewClose" } },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    config = require "custom.configs.rust-tools",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "Saecki/crates.nvim",
    event = "BufReadPost Cargo.toml",
    config = require "custom.configs.crates",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "mfussenegger/nvim-dap",
    cmd = {
      "DapSetLogLevel",
      "DapShowLog",
      "DapContinue",
      "DapToggleBreakpoint",
      "DapToggleRepl",
      "DapStepOver",
      "DapStepInto",
      "DapStepOut",
      "DapTerminate",
    },
    config = require "custom.configs.dap",
    dependencies = {
      { "mfussenegger/nvim-dap-python" },
      {
        "rcarriga/nvim-dap-ui",
        config = require "custom.configs.dap.dapui",
      },
    },
  },
  {
    "LunarVim/bigfile.nvim",
    lazy = false,
    config = require "custom.configs.bigfile",
    cond = true,
  },
  {
    "folke/paint.nvim",
    event = { "CursorHold", "CursorHoldI" },
    config = function()
      require("paint").setup {
        ---type PaintHighlight[]
        highlights = {
          {
            -- filter can be a table of buffer options that should match,
            -- or a function called with buf as param that should return true.
            -- The example below will paint @something in comments with Constant
            filter = { filetype = "lua" },
            pattern = "%s*%-%-%-%s*(@%w+)",
            hl = "Constant",
          },
          {
            filter = { filetype = "python" },
            pattern = "%s*(%w+:)",
            hl = "Constant",
          },
        },
      }
    end,
  },
  -- load it after nvim-lspconfig , since we'll use some lspconfig stuff in the null-ls config!
}
