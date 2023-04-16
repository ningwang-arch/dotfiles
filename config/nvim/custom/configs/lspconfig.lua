-- custom.plugins.lspconfig
-- local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local utils = require "core.utils"
capabilities.offsetEncoding = { "utf-16" }

local lspconfig = require "lspconfig"
local servers = { "jedi_language_server", "clangd", "cmake", "lemminx", "rust_analyzer", "cssls", "eslint", "volar" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false

      utils.load_mappings("lspconfig", { buffer = bufnr })

      if client.server_capabilities.signatureHelpProvider then
        require("nvchad_ui.signature").setup(client)
      end
      require("lsp_signature").on_attach {
        bind = true,
        use_lspsaga = false,
        floating_window = true,
        fix_pos = true,
        hint_enable = true,
        hi_parameter = "Search",
        handler_opts = {
          border = "rounded",
        },
      }
    end,
    capabilities = capabilities,
  }
end

lspconfig.eslint.setup {
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
}
