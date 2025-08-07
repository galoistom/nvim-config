local map = vim.keymap.set

map('n', '<leader>w', '<C-w>', { desc = 'move focous' })
map('n', '<leader>e', '<cmd>NERDTreeToggle %:p:h<CR>', { desc = 'nerdtree' })
map('n', '<leader>q', '<cmd>wq<CR>', { desc = 'quit' })
map('n', '<leader>E', function()
  vim.cmd 'tabnew'
  vim.cmd 'Explore'
end, { desc = 'Explore' })
map('n', '<Tab>', '<cmd>bn<CR>', { desc = 'next buffer' })
map('n', '<S-Tab>', '<cmd>bp<CR>', { desc = 'previous buffer' })
map('n', '<leader>t', '<cmd>belowright term<CR>', { desc = 'terminal' })
map('n', '<leader>h', '<cmd>Alpha<CR>', { desc = 'home' })
map('n', '<leader>d', '<cmd>bd<CR>', { desc = 'close buffer' })
map('n', '<leader>r', '<cmd>w<CR>', { desc = 'save changes' })
map('n', 'H', '0')
map('n', 'L', '$')
