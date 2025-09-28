-- ~/.config/nvim/lua/plugins/alpha.lua

return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- 用于显示图标
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    -- =======================================
    -- 自定义 Header (顶部欢迎语/ASCII 艺术)
    -- =======================================
    -- 你可以使用在线 ASCII Art 生成器创建自己的欢迎语
    dashboard.section.header.val = {
      [[███╗   ███╗██╗   ██╗██╗   ██╗██╗███╗   ███╗]],
      [[████╗ ████║╚██╗ ██╔╝██║   ██║██║████╗ ████║]],
      [[██╔████╔██║ ╚████╔╝ ██║   ██║██║██╔████╔██║]],
      [[██║╚██╔╝██║  ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║]],
      [[██║ ╚═╝ ██║   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║]],
      [[╚═╝     ╚═╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝]],
    }
    dashboard.section.header.opts.hl = 'AlphaHeader' -- 设置高亮组 (需要你的颜色方案支持)

    -- =======================================
    -- 自定义 Buttons (操作按钮)
    -- =======================================
    -- 这些按钮会显示在界面上，并可点击执行命令
    -- 'key': 快捷键
    -- 'text': 显示文本 (可以包含图标)
    -- 'cmd': 执行的命令
    dashboard.section.buttons.val = {
      dashboard.button('n', '  New File', ':ene<CR>'), -- 新建空文件
      dashboard.button('e', '  Explore', ':NvimTreeOpen<CR>'), -- 新建空文件
      dashboard.button('f', '  Find File', ':Telescope find_files<CR>'), -- 查找文件 (需要 Telescope 插件)
      dashboard.button('r', '  Recent Files', ':Telescope oldfiles<CR>'), -- 最近文件 (需要 Telescope 插件)
      dashboard.button('c', '  Configuration', ':NvimTreeOpen ' .. vim.fn.stdpath 'config' .. '<CR>'), -- 打开 Neovim 配置目录
      dashboard.button('u', '  Update Plugins', ':Lazy sync<CR>'), -- 更新插件 (lazy.nvim)
      dashboard.button('m', '  Mason Setting', ':Mason<CR>'),
      dashboard.button('q', '  Quit Neovim', ':qa<CR>'), -- 退出 Neovim
    }
    dashboard.section.buttons.opts.hl = 'AlphaButtons' -- 设置高亮组

    -- =======================================
    -- 自定义 Footer (底部信息)
    -- =======================================
    dashboard.section.footer.val = os.date '%A, %B %d, %Y' -- 显示当前日期
    dashboard.section.footer.opts.hl = 'Comment' -- 设置高亮组为注释的颜色

    -- =======================================
    -- 其他配置 (例如，当没有文件打开时自动显示)
    -- =======================================
    alpha.setup(dashboard.opts) -- 将 dashboard 主题应用到 alpha

    -- 这是一个可选的自动命令：当 Alpha Ready 时自动进入插入模式。
    -- 通常你不会需要它，除非你希望每次启动 Neovim 时都直接开始输入。
    -- vim.cmd([[autocmd User AlphaReady ++once startinsert]])

    -- 如果你希望在任何时候都能手动打开 Dashboard，可以设置一个快捷键
    -- local map = vim.keymap.set
    -- map('n', '<leader>d', '<cmd>Alpha<CR>', { desc = 'Open Dashboard' })
  end,
}
