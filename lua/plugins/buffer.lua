-- ~/.config/nvim/lua/plugins/bufferline.lua

return {
  'akinsho/bufferline.nvim',
  version = '*', -- 推荐使用最新稳定版本
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- 用于显示文件图标
  config = function()
    require('bufferline').setup {
      options = {
        mode = 'buffers', -- 或者 'tabs', 'quicklist'
      },
    }
  end,
}
