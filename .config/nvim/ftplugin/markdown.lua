-- Disable Treesitter for query blocks in markdown
--require'nvim-treesitter.configs'.setup {
--  highlight = {
--    enable = true,
--    additional_vim_regex_highlighting = false,  -- Optional, to stop any regex-based parsing
--  },
--  -- This is where you can modify or disable Treesitter queries in markdown
--  ensure_installed = {"markdown", "markdown_inline"},
--  ignore_install = {"query"},  -- Ignore installing query-related parsers
--}


vim.opt_local.conceallevel = 2
local map = vim.api.nvim_set_keymap
map("i", "[[", [[<ESC>:lua require'notes'.insert_link_at_selection()<CR>]],{})
