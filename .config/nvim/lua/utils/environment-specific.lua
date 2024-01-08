local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconf = require("lspconfig")
local none_ls = require("null-ls")

local available_langs = {
  ["lua"] = function()
    lspconf.lua_ls.setup({
      capabilities = lsp_capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })
    none_ls.register({
      none_ls.builtins.formatting.stylua.with({
        extra_args = {
          "--config-path",
          vim.fn.expand("$HOME/.config/nvim/lua/config/.stylua.toml"),
        },
      }),
    })
  end,
  ["bash"] = function()
    lspconf.bashls.setup({
      capabilities = lsp_capabilities,
    })
    none_ls.register({
      none_ls.builtins.formatting.shellharden,
      none_ls.builtins.diagnostics.shellcheck,
    })
  end,
  ["csharp"] = function()
    -- csharp-ls and (dotnet) needs to be installed manually,
    -- because Mason can't install it (for net6.0)
    lspconf.csharp_ls.setup({
      capabilities = lsp_capabilities,
    })
    none_ls.register({
      none_ls.builtins.diagnostics.semgrep.with({
        filetypes = { "cs" },
      }),
      none_ls.builtins.formatting.csharpier,
    })
  end,
}

local required_langs = os.getenv("NEOVIM_REQUIRED_LANGUAGES") or "lua"
for lang in string.gmatch(required_langs, "([^,]+)") do
  if available_langs[lang] then
    available_langs[lang]()
  end
end
