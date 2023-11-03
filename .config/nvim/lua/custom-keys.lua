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



-- Telekasten notes

function ZkNote(templ)
	input = vim.fn.input("Title: ")

	vim.cmd.normal(vim.api.nvim_replace_termcodes(':Telekasten new_templated_note<CR>' .. input .. '<CR>' .. templ .. '.md<CR>' , true, true, true))
end

map("n", "<leader>z", [[:Telekasten panel<CR>]],cmd_options)

map("n", "<leader>zn", [[:lua ZkNote('note')<CR>]], cmd_options)   
map("n", "<leader>zk", [[:lua ZkNote('zettel')<CR>]], cmd_options)  


--map("n", "<leader>zn", [[:Telekasten new_note<CR>notes/]],cmd_options)
--map("n", "<leader>zk", [[:Telekasten new_note<CR>zk/]],cmd_options)
--map("n", "<leader>zr", [[:Telekasten new_note
-- Most used functions



--map("n", "<leader>zf", [[:Telekasten find_notes<CR>]],cmd_options)
--map("n", "<leader>zg", [[:Telekasten search_notes<CR>]],cmd_options)
--map("n", "<leader>zd", [[:Telekasten goto_today<CR>]],cmd_options)
--map("n", "<leader>zz", [[:Telekasten follow_link<CR>]],cmd_options)
--map("n", "<leader>znf", [[:Telekasten new_note<CR>f/]],cmd_options)
--map("n", "<leader>zc", [[:Telekasten show_calendar<CR>]],cmd_options)
--map("n", "<leader>zb", [[:Telekasten show_backlinks<CR>]],cmd_options)
--map("n", "<leader>zI", [[:Telekasten insert_img_link<CR>]],cmd_options)

-- Call insert link automatically when we start typing a link

