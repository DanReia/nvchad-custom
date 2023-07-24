local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")
local servers = { "html", "cssls", "clangd"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes={"python"}
})

-- lspconfig.rust_analyzer.setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
--     filetypes={"rust"},
--     root_dir=util.root_pattern("Cargo.toml"),
--     settings={
--         ["rust-analyzer"]={
--             cargo ={
--                 allFeature=true,
--             }
--         }
--     }
--
-- })
