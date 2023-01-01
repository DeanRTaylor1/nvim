local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.ensure_installed({
	'tsserver',
	'eslint',
	'sumneko_lua'
})




lsp.setup()

--enable inline errors aka set diagnostics to default

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})
