return {
  -- nvim-dap：调试器
  {
    'mfussenegger/nvim-dap',
    config = function()
      -- Go 调试器配置
      local dap = require 'dap'
      dap.adapters.go = {
        type = 'server',
        host = '127.0.0.1',
        port = 38692,
        executable = {
          command = 'dlv',
          args = { 'dap', '--listen=127.0.0.1:38692' },
        },
      }
      dap.configurations.go = {
        {
          type = 'go',
          name = 'Launch file',
          request = 'launch',
          program = '${file}',
        },
      }

      -- 调试快捷键
      vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'DAP Continue' })
      vim.keymap.set('n', '<leader>do', dap.step_over, { desc = 'DAP Step Over' })
      vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'DAP Step Into' })
      vim.keymap.set('n', '<leader>ds', dap.step_out, { desc = 'DAP Step Out' })
      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'DAP Toggle Breakpoint' })
    end,
  },
}
