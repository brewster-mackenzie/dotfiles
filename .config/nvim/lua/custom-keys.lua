local map = vim.api.nvim_set_keymap

vim.g.mapleader = ','
vim.g.maplocalleader = ','

local cmd_options = {
	noremap = true,
	silent = true,
}

-- delete active file and purge the buffer 
map('n', '<leader>rm', [[:call delete(@%)<CR>]], cmd_options)
map('n', '<leader>rM', [[:call delete(@%) | bdelete!<CR>]], cmd_options)



--map('n', '<C-b>', [[:NvimTreeToggle<CR>]], cmd_options)
--function NvimTreeFocusOrToggle()
--  local api = require('nvim-tree.api')
--  local view = require('nvim-tree.view')
--
--  if not view.is_visible() then
--    -- If NvimTree is closed, open it
--    api.tree.open()
--  elseif view.is_visible() and not api.tree.is_tree_buf(vim.api.nvim_get_current_buf()) then
--    -- If NvimTree is open but not focused, focus it
--    api.tree.focus()
--  else
--    -- If NvimTree is open and focused, close it
--    api.tree.close()
--  end
--end


-- map('n', '<C-b>', [[:lua NvimTreeFocusOrToggle()<CR>]], cmd_options)

map('n', '<C-b>', [[:NnnExplorer<CR>]], cmd_options)

-- Buffers
map('n', '<leader>bf', [[:Telescope buffers<CR>]], cmd_options)
map('n', '<leader>bn', [[:bnext<CR>]], cmd_options)
map('n', '<leader>bp', [[:bprevious<CR>]], cmd_options)

-- Window helper
map('n', '<leader>wh', [[:split<CR>]], cmd_options)
map('n', '<leader>wv', [[:vsplit<CR>]], cmd_options)
map('n', '<leader>wj', [[:lua require'nvim-window'.pick()<CR>]], cmd_options)

-- DAP
map('n', '<F5>', [[:lua require'dap'.continue()<CR>]], cmd_options)
map('n', '<F9>', [[:lua require'dap'.toggle_breakpoint()<CR>]], cmd_options)
map('n', '<F10>', [[:lua require'dap'.step_over()<CR>]], cmd_options)
map('n', '<F11>', [[:lua require'dap'.step_into()<CR>]], cmd_options)
map('n', '<F12>', [[:lua require'dap'.step_out()<CR>]], cmd_options)
map('n', "<C-'>", [[:lua require'dap'.repl.open()<CR>]], cmd_options)
map('n', "<C-d>", [[:NvimTreeClose<CR> :lua require'dapui'.toggle()<CR>]], cmd_options)

-- Telescope
map('n', '<leader>ff', [[:lua require'telescope.builtin'.find_files({no_ignore=true, hidden=true})<CR>]], cmd_options)
map('n', '<leader>fg', [[:lua require'telescope.builtin'.live_grep()<CR>]], cmd_options)

-- Notes
map('n', '<leader>nn', [[:ObsidianNew<CR>]], cmd_options)
map('n', '<leader>nf', [[:ObsidianOpen<CR>]], cmd_options)
map('n', '<leader>nj', [[:ObsidianDailies<CR>]], cmd_options)
map('n', '<leader>nJ', [[:ObsidianToday<CR>]], cmd_options)
