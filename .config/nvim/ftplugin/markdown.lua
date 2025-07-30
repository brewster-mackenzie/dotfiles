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

vim.keymap.set("i", "<CR>", function()
  local line = vim.api.nvim_get_current_line()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local before_cursor = line:sub(1, col)
  local bullet = before_cursor:match("^%s*([%-%*])%s+.*$")

  if bullet then
    -- If line is just a bullet and nothing else, don't continue the list
    if line:match("^%s*[%-%*]%s*$") then
      return "<Esc>o"
    else
      --local indent = line:match("^(%s*)")
      return "<CR>" .. bullet .. " " -- .. indent .. bullet .. " "
    end
  else
    return "<CR>"
  end
end, { expr = true, noremap = true, buffer = true })

-- Indent word under cursor in insert mode with Ctrl+>
vim.keymap.set("i", "<C-.>", "<Esc>>iwgi", { noremap = true })

-- Unindent word under cursor in insert mode with Ctrl+<
vim.keymap.set("i", "<C-,>", "<Esc><iwgi", { noremap = true })

