local map = vim.api.nvim_set_keymap

vim.g.mapleader = ','
vim.g.maplocalleader = ','

map('n', '<C-b>', [[:NvimTreeToggle<CR>]], {})

-- DAP
map('n', '<F5>', [[:lua require'dap'.continue()<CR>]], {})
map('n', '<F9>', [[:lua require'dap'.toggle_breakpoint()<CR>]], {})
map('n', '<F10>', [[:lua require'dap'.step_over()<CR>]], {})
map('n', '<F11>', [[:lua require'dap'.step_into()<CR>]], {})
map('n', '<F12>', [[:lua require'dap'.step_out()<CR>]], {})
map('n', "<C-'>", [[:lua require'dap'.repl.open()<CR>]], {})
map('n', "<C-d>", [[:NvimTreeClose<CR> :lua require'dapui'.toggle()<CR>]], {})

-- Telescope
map('n', '<leader>ff', [[:lua require'telescope.builtin'.find_files({no_ignore=true, hidden=true})<CR>]], {})
map('n', '<leader>fg', [[:lua require'telescope.builtin'.live_grep()<CR>]], {})
