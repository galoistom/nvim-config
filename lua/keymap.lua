local map = vim.keymap.set

local function compile_and_run()
  -- 获取当前文件的文件名和路径
  local file = vim.fn.expand '%'
  local path = vim.fn.expand '%:p:h'
  local filename_no_ext = vim.fn.fnamemodify(file, ':r')

  -- 检查文件是否为 C++ 文件
  if vim.bo.filetype ~= 'cpp' then
    vim.notify('Not a C++ file!', vim.log.levels.WARN)
    return
  end

  -- 保存当前文件
  vim.cmd 'w'

  -- 编译命令：使用 g++，将可执行文件命名为文件名 (无后缀)
  -- 注意：这里使用 -o 指定输出文件名，-std=c++17 指定C++标准
  local compile_cmd = string.format('g++ %s -o %s/%s -std=c++17', file, path, filename_no_ext)
  -- 运行命令：执行刚刚编译生成的可执行文件
  local run_cmd = string.format('%s/%s', path, filename_no_ext)

  -- 执行编译和运行，并将输出显示在 Neovim 的浮动窗口或终端
  vim.cmd 'split | terminal' -- 创建一个新分屏并打开终端
  vim.api.nvim_chan_send(vim.g.terminal_job, compile_cmd .. ' && ' .. run_cmd .. '\n')
end

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
map('n', '<leader>h', '<cmd>Alpha<CR>', { desc = 'home' })
map('n', '<leader>d', '<cmd>bd<CR>', { desc = 'close buffer' })
map('n', '<leader>r', '<cmd>w<CR>', { desc = 'save changes' })
map('n', 'H', '0')
map('n', 'L', '$')
map('n', '<F5>', compile_and_run, { desc = 'Compile and run C++ file' })
