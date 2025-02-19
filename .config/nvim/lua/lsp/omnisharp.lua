require'lspconfig'.omnisharp.setup {
  cmd = { "dotnet", "/home/brewster/.local/omnisharp/OmniSharp.dll" },

  -- enable .editorconfig support
  enable_editorconfig_support = true,

  -- disable MSBuild project system only loading projects for
  -- files that were opened in the editor.
  enable_ms_build_load_projects_on_demand = false,

  -- disable roslyn analyzers
  enable_roslyn_analyzers = false,

  -- disable 'using' directive grouping in document formatting
  organize_imports_on_format = false,

  -- enable import completion
  enable_import_completion = true,

  -- include sdk prereleases
  sdk_include_prereleases = true,

  -- analyze all documents
  analyze_open_documents_only = false
}

