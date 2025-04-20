-- Clipboard
vim.keymap.set('v', '<space>y', '"+y', { desc = 'Yank to clipboard' })
vim.keymap.set('n', '<space>yy', '"+yy', { desc = 'Yank line to clipboard' })
vim.keymap.set('n', '<space>p', '"+p', { desc = 'Paste (after) from clipboard' })
vim.keymap.set('n', '<space>P', '"+P', { desc = 'Paste (before) from clipboard' })

vim.keymap.set('n', '<leader>yff', function()
  local file = vim.fn.expand('%')            -- current buffer name (relative path)
  vim.fn.setreg('+', file)                   -- write to + register (system clipboard)
end, { desc = 'Yank file path to clipboard' })

vim.keymap.set('n', '<leader>yfl', function()
  local file = vim.fn.expand('%')          -- current buffer name (relative path)
  local line = vim.fn.line('.')            -- current cursor line
  vim.fn.setreg('+', file .. ':' .. line)  -- write to + register (system clipboard)
end, { desc = 'Yank file:line to clipboard' })

-- Buffers
vim.keymap.set('n', '<leader>bd', function()
  vim.cmd('bp')   -- go to previous buffer
  vim.cmd('bd #') -- delete the buffer we just left (alternate buffer)
end, { desc = 'Buffer delete (keep window)' })
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<cr>',     { desc = 'Buffer next' })
vim.keymap.set('n', '<leader>bp', '<cmd>bprevious<cr>', { desc = 'Buffer previous' })
vim.keymap.set('n', '<leader>b#', '<cmd>b #<cr>', { desc = 'Buffer alternate' })
