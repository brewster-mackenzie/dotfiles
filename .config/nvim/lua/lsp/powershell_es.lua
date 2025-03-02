require"lspconfig".powershell_es.setup { 
  bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services",
  filetypes = { "ps1", "psm1", "psd1" },
}
