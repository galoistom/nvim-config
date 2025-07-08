-- ~/.config/nvim/lua/plugins/telescope.lua

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6', -- 推荐锁定到稳定版本，或者 'branch': '0.1.x'
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    local telescope = require 'telescope.builtin'

    require('telescope').setup {
      defaults = {
        layout_config = {
          prompt_position = 'top',
          preview_width = 0.5,
        },
        selection_caret = '❯',
        -- sorting_strategy = "ascending", -- 你可以保留这个默认排序策略，但 'cycle_sorting_strategy' 动作已不存在
        mappings = {
          i = {
            ['<C-j>'] = 'move_selection_next',
            ['<C-k>'] = 'move_selection_previous',
            ['<C-q>'] = 'send_selected_to_qflist',
            -- ["<C-s>"] = "cycle_sorting_strategy",  -- <-- **移除或注释掉这一行**
          },
          n = {
            ['<C-j>'] = 'move_selection_next',
            ['<C-k>'] = 'move_selection_previous',
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = 'smart_case',
        },
      },
    }

    require('telescope').load_extension 'fzf'

    local map = vim.keymap.set

    map('n', '<leader>ff', telescope.find_files, { desc = '[F]ind [F]iles' })
    map('n', '<leader>fg', telescope.live_grep, { desc = '[F]ind [G]rep (text in files)' })
    map('n', '<leader>fb', telescope.buffers, { desc = '[F]ind [B]uffers' })
    map('n', '<leader>fh', telescope.help_tags, { desc = '[F]ind [H]elp Tags' })
    map('n', '<leader>fo', telescope.oldfiles, { desc = '[F]ind [O]ld Files' })

    map('n', '<leader>gc', telescope.git_commits, { desc = '[G]it [C]ommits' })
    map('n', '<leader>gs', telescope.git_status, { desc = '[G]it [S]tatus' })

    map('n', '<leader>lr', telescope.lsp_references, { desc = '[L]SP [R]eferences' })
    map('n', '<leader>ld', telescope.lsp_definitions, { desc = '[L]SP [D]efinitions' })
    map('n', '<leader>li', telescope.lsp_implementations, { desc = '[L]SP [I]mplementations' })
    map('n', '<leader>lt', telescope.lsp_type_definitions, { desc = '[L]SP [T]ype Definitions' })
    map('n', '<leader>ls', telescope.lsp_document_symbols, { desc = '[L]SP [S]ymbols (current file)' })
    map('n', '<leader>lw', telescope.lsp_workspace_symbols, { desc = '[L]SP [W]orkspace Symbols' })
  end,
}
