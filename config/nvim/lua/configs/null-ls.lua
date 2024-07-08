local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {

  -- b.formatting.deno_fmt,

  -- Lua
  b.formatting.stylua,

  -- Shell
  b.formatting.shfmt,

  -- cxx
  b.formatting.clang_format.with {
    filetypes = { "c", "cpp" },
    extra_args = { "-style", "file" },
  },
  b.diagnostics.cppcheck,

  -- python
  b.formatting.black,
  b.formatting.isort,
  b.diagnostics.pylint,

  -- cmake
  b.formatting.cmake_format,

  -- rust
  b.formatting.rustfmt,

  b.formatting.prettier,
}

local M = {}

M.setup = function()
  null_ls.setup {
    debug = true,
    sources = sources,

    on_init = function(new_client, _)
      new_client.offset_encoding = "utf-16"
    end,

    -- format on save
    on_attach = function(client)
      if client.server_capabilities.documentFormattingProvider then
        vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.format({async = true})"
      end
    end,
  }
end

return M
