local map = vim.keymap.set

--map('n', '<leader>w', '<C-w>', { desc = 'move focous' })
--map('n', '<leader>e', '<cmd>NERDTreeToggle %:p:h<CR>', { desc = 'nerdtree' })
map('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { noremap = true, silent = true, desc = 'nerdtree' })
map('n', '<leader>Q', '<cmd>wq<CR>', { desc = 'save and quit' })
map('n', '<leader>q', '<cmd>q<CR>', { desc = 'quit' })
--map('n', '<leader>E', function()
--  vim.cmd 'tabnew'
--  vim.cmd 'Explore'
--end, { desc = 'Explore' })
map('n', '<Tab>', '<cmd>bn<CR>', { desc = 'next buffer' })
map('n', '<S-Tab>', '<cmd>bp<CR>', { desc = 'previous buffer' })
map('n', '<leader><Space>', '<cmd>belowright term<CR>', { desc = 'terminal' })
map('n', '<leader>h', '<cmd>Alpha<CR>', { desc = 'home' })
map('n', '<leader>d', '<cmd>bd<CR>', { desc = 'close buffer' })
map('n', '<leader>s', '<cmd>w<CR>', { desc = 'save changes' })
map('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true, desc = 'Exit terminal mode' })
--map('n', 'H', '^')
--map('n', 'L', '$')
map('n', '<leader>w', '<Nop>', { desc = 'Window Management' })

-- 1. 调整窗口聚焦 (hjkl)
-- 映射为原生的 C-w h/j/k/l 命令，实现快速切换窗口
map('n', '<leader>wh', '<C-w>h', { desc = 'move focous left' })
map('n', '<leader>wl', '<C-w>l', { desc = 'move focous right' })
map('n', '<leader>wj', '<C-w>j', { desc = 'move focous down' })
map('n', '<leader>wk', '<C-w>k', { desc = 'move focous up' })

-- 2. 分屏操作
-- " (引号) -> 水平分屏
map('n', '<leader>w"', ':split<CR>', { desc = 'split horizontally' })

-- % -> 垂直分屏
map('n', '<leader>w%', ':vsplit<CR>', { desc = 'split vertically' })

-- 3. 关闭当前窗口
-- x -> 关闭当前窗口 (C-w c)
map('n', '<leader>wx', '<C-w>c', { desc = 'close current window' })

-- 4. 仅保留当前窗口（关闭其他所有窗口）
-- q -> 仅保留当前窗口 (C-w o)
map('n', '<leader>wq', '<C-w>o', { desc = 'close all other windows' })
map('n', '<leader>w+', '<C-w>+', { desc = 'increase hight' })
map('n', '<leader>w-', '<C-w>-', { desc = 'decrease hight' })
map('n', '<leader>w>', '<C-w>>', { desc = 'increase width' })
map('n', '<leader>w<', '<C-w>o', { desc = 'decrease width' })
