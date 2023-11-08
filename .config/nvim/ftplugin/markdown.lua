local map = vim.api.nvim_buf_set_keymap
map(0, "i", "[[", [[<ESC>:Telekasten insert_link<CR>]],{})
