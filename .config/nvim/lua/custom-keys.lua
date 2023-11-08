local map = vim.api.nvim_set_keymap

vim.g.mapleader = ','
vim.g.maplocalleader = ','

local cmd_options = {
	noremap = true,
	silent = true,
}

map('n', '<C-b>', [[:NvimTreeToggle<CR>]], cmd_options)

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
map('n', '<leader>ft', [[:lua require'telescope.builtin'.buffers()<CR>]], cmd_options)
map('n', '<leader>tt', [[:BufferLinePick<CR>]], cmd_options)
map('n', '<leader>tn', [[:BufferLineCycleNext<CR>]], cmd_options)
map('n', '<leader>tp', [[:BufferLineCyclePrev<CR>]], cmd_options)
map('n', '<leader>td', [[:bd<CR>]], cmd_options)
map('n', '<leader>tD', [[:BufferLineCloseOthers<CR>]], cmd_options)
