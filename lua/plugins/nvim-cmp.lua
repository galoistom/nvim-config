-- ~/.config/nvim/lua/plugins/cmp.lua (或者你的 nvim-cmp 配置所在文件)
return {
  {
    'hrsh7th/nvim-cmp',
    version = false, -- last release is way too old
    event = 'InsertEnter', -- 只在进入插入模式时加载，这样可以避免过早加载导致的冲突
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      -- --- 确保这两个插件已安装且在此处声明 ---
      'L3MON4D3/LuaSnip', -- 代码片段引擎 (cmp.confirm 正常工作的重要依赖)
      'saadparwaiz1/cmp_luasnip', -- nvim-cmp 的 LuaSnip 补全源
      -----------------------------------------------
      'onsails/lspkind.nvim', -- 用于显示漂亮图标 (强烈推荐)
      'rafamadriz/friendly-snippets', -- LuaSnip 的常见代码片段集合 (强烈推荐)
    },
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip' -- 必须确保加载 LuaSnip
      local lspkind = require 'lspkind' -- 必须确保加载 lspkind

      -- 可选：设置 ghost text 的高亮 (如果你使用它的话)
      vim.api.nvim_set_hl(0, 'CmpGhostText', { link = 'Comment', default = true })

      cmp.setup {
        -- **关键：代码片段展开函数**
        -- 即使你目前不使用代码片段，有这个函数能帮助 cmp.confirm 正确工作。
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body) -- 必须调用 luasnip.lsp_expand
          end,
        },
        -- 补全菜单的显示设置
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        -- 补全选项 (通常让 cmp 自动管理 completeopt 即可，无需手动设置)
        -- 你可以删除或注释掉这行，让 cmp 自动设置 vim.opt.completeopt
        -- completion = {
        --   completeopt = 'menu,menuone,noinsert',
        -- },
        mapping = cmp.mapping.preset.insert {
          -- 向上/向下选择补全项
          ['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
          ['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
          -- 也可以用 C-j 和 C-k
          -- ['<C-j>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
          -- ['<C-k>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },

          -- 手动触发补全
          ['<C-Space>'] = cmp.mapping.complete(),
          -- 取消补全
          ['<C-e>'] = cmp.mapping.abort(),

          -- **回车键：确认并选择当前项 (这是解决你问题的核心)**
          ['<CR>'] = cmp.mapping.confirm { select = true },

          -- Tab 键的智能处理 (强烈推荐保留这个，因为它能处理补全和代码片段跳转)
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item() -- 如果补全菜单可见，Tab 键选择下一个
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump() -- 如果是代码片段，跳转到下一个占位符
            else
              fallback() -- 否则，执行默认的 Tab 行为 (插入 Tab 字符)
            end
          end, { 'i', 's' }), -- 在插入模式和选择模式下生效

          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item() -- 如果补全菜单可见，Shift+Tab 键选择上一个
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1) -- 如果是代码片段，跳转到上一个占位符
            else
              fallback() -- 否则，执行默认的 Shift+Tab 行为
            end
          end, { 'i', 's' }),
        },
        -- 补全源的顺序和优先级
        sources = cmp.config.sources({
          { name = 'nvim_lsp' }, -- LSP 服务器提供的补全
          { name = 'luasnip' }, -- 代码片段补全 (请确保 'luasnip' 在这里)
          { name = 'path' }, -- 文件路径补全
        }, {
          { name = 'buffer' }, -- 当前缓冲区中的单词补全
        }),
        -- 格式化 (图标等)
        formatting = {
          format = lspkind.cmp_format { -- 使用 lspkind.nvim 来显示图标
            maxwidth = 50,
            ellipsis_char = '...',
            menu = {
              nvim_lsp = '[LSP]',
              luasnip = '[Snippet]',
              buffer = '[Buffer]',
              path = '[Path]',
            },
          },
        },
        -- 其他可选设置
        -- experimental = {
        --   ghost_text = vim.g.ai_cmp and { hl_group = 'CmpGhostText', } or false,
        -- },
        -- 排序
        sorting = require 'cmp.config.default'().sorting,
      }

      -- 确保加载了 friendly-snippets (如果你使用了这个代码片段集合)
      require('luasnip.loaders.from_vscode').lazy_load()
    end,
  },

  -- 确保你已经独立声明并安装了这些插件，lazy.nvim 才能找到它们
  { 'onsails/lspkind.nvim' },
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'rafamadriz/friendly-snippets', -- 这是一个非常流行的代码片段集合
    },
  },
}
