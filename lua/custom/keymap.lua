local map = vim.keymap.set

map('n', '<leader>w', '<C-w>', { desc = 'move focous' })
map('n', '<leader>e', '<cmd>NERDTreeToggle %:p:h<CR>')
map('n', '<leader>q', '<cmd>wq<CR>')
map('n', '<leader>E', '<cmd>Explore<CR>')
map('n', '<Tab>', '<cmd>bn<CR>')
map('n', '<S-Tab>', '<cmd>bp<CR>')
map('n', '<leader>t', '<cmd>belowright term<CR>')
map('n', '<leader>h', '<cmd>Alpha<CR>')
map('n', '<leader>d', '<cmd>bd<CR>')
