function kitty_window_with(command)
  os.execute('kitty @ --to $KITTY_LISTEN_ON launch --cwd current --no-response')
  os.execute('kitty @ --to $KITTY_LISTEN_ON send-text ' .. command .. '\\\x0d')
end

vim.api.nvim_set_keymap('n', '<leader>tjf', [[<cmd>lua kitty_window_with('jest ' .. vim.fn.expand('%'))<cr>]], { silent = true })
vim.api.nvim_set_keymap('n', '<leader>tjw', [[<cmd>lua kitty_window_with('jest ' .. vim.fn.expand('%') .. ' --watch')<cr>]], { silent = true })
vim.api.nvim_set_keymap('n', '<leader>tmf', [[<cmd>lua kitty_window_with('mocha ' .. vim.fn.expand('%'))<cr>]], { silent = true })
vim.api.nvim_set_keymap('n', '<leader>tmw', [[<cmd>lua kitty_window_with('mocha ' .. vim.fn.expand('%') .. ' --watch')<cr>]], { silent = true })
vim.api.nvim_set_keymap('n', '<leader>trf', [[<cmd>lua kitty_window_with('rspec ' .. vim.fn.expand('%'))<cr>]], { silent = true })
vim.api.nvim_set_keymap('n', '<leader>trl', [[<cmd>lua kitty_window_with('rspec ' .. vim.fn.expand('%') .. ':' .. vim.fn.line('.'))<cr>]], { silent = true })