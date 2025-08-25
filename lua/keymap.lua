local map = vim.keymap.set

map('n', '<leader>w', '<C-w>', { desc = 'move focous' })
map('n', '<leader>e', '<cmd>NERDTreeToggle %:p:h<CR>', { desc = 'nerdtree' })
map('n', '<leader>Q', '<cmd>wq<CR>', { desc = 'save and quit' })
map('n', '<leader>q', '<cmd>q<CR>', { desc = 'quit' })
map('n', '<leader>E', function()
  vim.cmd 'tabnew'
  vim.cmd 'Explore'
end, { desc = 'Explore' })
map('n', '<Tab>', '<cmd>bn<CR>', { desc = 'next buffer' })
map('n', '<S-Tab>', '<cmd>bp<CR>', { desc = 'previous buffer' })
map('n', '<leader>t', '<cmd>belowright term<CR>', { desc = 'terminal' })
jap('n', '<leader>h', '<cmd>Alpha<CR>', { desc = 'home' })
map('n', '<leader>d', '<cmd>bd<CR>', { desc = 'close buffer' })
map('n', '<leader>s', '<cmd>w<CR>', { desc = 'save changes' })
map('n', 'H', '^')
map('n', 'L', '$')
