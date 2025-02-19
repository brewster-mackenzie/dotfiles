local tf_capb = vim.lsp.protocol.make_client_capabilities()
tf_capb.textDocument.completion.completionItem.snippetSupport = true

require"lspconfig".terraformls.setup {
	on_attach = on_attach,
	filetypes = { "terraform", "terraform-vars", "tf", "tf-vars" },
	capabilities = tf_capb,
}
