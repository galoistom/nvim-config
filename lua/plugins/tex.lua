-- lua/plugins/mdmath.lua

return {
  'Thiago4532/mdmath.nvim',
  -- 只有在 Markdown 文件中才加载
  ft = 'markdown',
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- 依赖 Treesitter 解析 Markdown 结构
  },
  opts = {
    filetypes = { 'markdown' },
    foreground = 'Normal', -- 公式颜色，设置为你的主题 Normal 组颜色
    anticonceal = true, -- 光标在公式上时，显示 LaTeX 源码
    hide_on_insert = true, -- 在插入模式下，显示 LaTeX 源码
    dynamic = false, -- 启用动态尺寸渲染
    dynamic_scale = 1.5,
    -- 其他配置...
  },
}
