return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    config = function()
      require("configs.trouble").setup()
    end,
  },
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
    "gelguy/wilder.nvim",
    event = "CmdlineEnter",
    config = function()
      require("configs.wilder").setup()
    end,
    dependencies = { "romgrk/fzy-lua-native" },
  },
  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    config = function()
      require("configs.illuminate").setup()
    end,
  },
  { "sindrets/diffview.nvim", lazy = true, cmd = { "DiffviewOpen", "DiffviewClose" } },
  {
    "LunarVim/bigfile.nvim",
    lazy = false,
    config = require "configs.bigfile",
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
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup {
        signs = false,
        keywords = {
          FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
          TODO = { icon = " ", color = "info", alt = { "NOTE" } },
          HACK = { icon = " ", color = "warning", alt = { "TEMP" } },
          WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        },
      }
    end,
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require("zen-mode").setup {
        window = {
          backdrop = 1,
          height = 0.85, -- height of the Zen window
          width = 0.85,
          options = {
            signcolumn = "no", -- disable signcolumn
            number = false, -- disable number column
            relativenumber = false, -- disable relative numbers
            cursorline = false, -- disable cursorline
            cursorcolumn = false, -- disable cursor column
            foldcolumn = "0", -- disable fold column
            list = false, -- disable whitespace characters
          },
        },
        plugins = {
          gitsigns = { enabled = false }, -- disables git signs
          tmux = { enabled = false }, -- disables the tmux statusline
          twilight = { enabled = false }, -- disables the twilight plugin
        },
        on_open = function()
          vim.cmd [[
            set foldlevel=20
          ]]
        end,
        on_close = function()
          vim.cmd [[
            set foldlevel=99
          ]]
        end,
      }
    end,
  },
  {
    "folke/twilight.nvim",
    cmd = "Twilight",
    config = function()
      require("twilight").setup {
        dimming = {
          alpha = 0.25, -- amount of dimming
          -- we try to get the foreground from the highlight groups or fallback color
          color = { "Normal", "#ffffff" },
        },
        context = 10, -- amount of lines we will try to show around the current line
        treesitter = true, -- use treesitter when available for the filetype
        -- treesitter is used to automatically expand the visible text, 
        -- but you can further control the types of nodes that should always be fully expanded
        expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
          "function",
          "method",
          "table",
          "if_statement",
        },
        exclude = {}, -- exclude these filetypes
      }
    end,
  },
    {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    config = require "configs.rust-tools",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "Saecki/crates.nvim",
    event = "BufReadPost Cargo.toml",
    config = require "configs.crates",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    -- event = { "BufReadPost", "BufAdd", "BufNewFile" },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
    dependencies = {
      { "ray-x/lsp_signature.nvim" },
      {
        "stevearc/aerial.nvim",
        config = function()
          require("configs.aerial").setup()
        end,
      },
      {
        "nvimtools/none-ls.nvim",
        config = function()
          require("configs.null-ls").setup()
        end,
      },
    },
  },
  --
  {
  	"williamboman/mason.nvim",
  	opts = {
      ensure_installed = {
        "clangd",
        "jedi-language-server",
        "cmake-language-server",
        "lua-language-server",
        "rust-analyzer",
      },
  	},
  },
  --
  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
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
  	},
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
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = require "configs.cmp",
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
}
