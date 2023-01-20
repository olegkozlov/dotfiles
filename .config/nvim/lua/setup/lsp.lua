local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local path_to_elixirls = vim.fn.expand("/Users/oleg/.ls-servers/elixir/release/language_server.sh")
capabilities.textDocument.completion.completionItem.snippetSupport = true


local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'ff', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

require("lspconfig").elixirls.setup({
  cmd = {path_to_elixirls},
  settings = {
    elixirLS = {
      dialyzerEnabled = true,
      fetchDeps = false
    }
  },
  on_attach = on_attach,
  capabilities = capabilities
})

require'lspconfig'.html.setup({
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html", "heex" },
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true
    },
    provideFormatter = true
  },
  settings = {}
})
