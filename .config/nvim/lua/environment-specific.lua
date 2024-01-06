local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

local available_langs = {
  ["lua"] = function(null_ls)
    require("lspconfig").lua_ls.setup({
      capabilities = lsp_capabilities,
      settings = {
        Lua= {
          diagnostics = {
            globals = { "vim" }
          }
        }
      }
    })
    null_ls.register({
      null_ls.builtins.formatting.stylua.with({
        extra_args = {
          "--config-path", "$HOME/.config/nvim/lua/config/.stylua.toml"
        }
      }),
    })
  end,
  ["bash"] = function(null_ls)
    require("lspconfig").bashls.setup({
      capabilities = lsp_capabilities,
    })
    null_ls.register({
      null_ls.builtins.formatting.shellharden,
      null_ls.builtins.diagnostics.shellcheck,
    })
  end
}

local required_langs = os.getenv("NEOVIM_REQUIRED_LANGUAGES") or "lua"
local null_ls = require("null-ls")
for lang in string.gmatch(required_langs, "([^,]+)") do
  if available_langs[lang] then
    available_langs[lang](null_ls)
  end
end
