return {
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      view = {
        relativenumber = true,
        number = false,
        float = {
          enable = true,
          open_win_config = function()
            local scr_w = vim.opt.columns:get()
            local scr_h = vim.opt.lines:get()
            local tree_w = 80
            local tree_h = math.floor(tree_w * scr_h / scr_w)
            return {
              border = 'rounded',
              relative = 'editor',
              width = tree_w,
              height = tree_h,
              col = (scr_w - tree_w) / 2,
              row = (scr_h - tree_h) / 2,
            }
          end,
        },
      },
      renderer = {
        -- 这里的配置保持不变，用于设置图标样式等
        icons = {
          glyphs = {
            git = {
              untracked = '',
              -- ...
            },
          },
        },
      },
      git = {
        enable = true, -- 用于显示 Git 状态，替代 show_git
        ignore = false,
      },
      filters = {
        dotfiles = false, -- 用于控制是否显示隐藏文件，替代 show_hidden
        git_ignored = false, -- 用于控制是否显示被 gitignore 忽略的文件，替代 show_ignored
      },
      actions = {
        open_file = {
          -- 默认行为：将文件打开在当前窗口，并关闭 nvim-tree
          quit_on_open = true,
          -- 如果你想打开文件后不关闭 nvim-tree，可以将上面这行改为 false
        },
      },
      disable_netrw = true, -- 禁用 Neovim 内置的文件浏览器
      hijack_netrw = true, -- 接管 Neovim 内置的文件浏览器
    },
    config = function(_, opts)
      require('nvim-tree').setup(opts)
      -- 在 nvim-tree 窗口中配置快捷键
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'NvimTree',
        callback = function()
          vim.keymap.set('n', 'q', '<cmd>NvimTreeClose<CR>', { buffer = true, desc = 'Close NvimTree' })
        end,
      })
    end,
  },
}
