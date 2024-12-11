return {
  'akinsho/git-conflict.nvim',
  version = '*',
  config = function()
    require('git-conflict').setup {
      default_mappings = false, -- disable buffer local mapping created by this plugin
      default_commands = true, -- disable commands created by this plugin
      disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
      list_opener = 'copen', -- command or function to open the conflicts list
      highlights = { -- They must have background color, otherwise the default color will be used
        incoming = 'DiffAdd',
        current = 'DiffText',
      },
      debug = true,
    }
    vim.keymap.set('n', '<leader>go', '<Plug>(git-conflict-ours)', { desc = 'Git conflct ours' })
    vim.keymap.set('n', '<leader>gt', '<Plug>(git-conflict-theirs)', { desc = 'Git conflct theirs' })
    vim.keymap.set('n', '<leader>gb', '<Plug>(git-conflict-both)', { desc = 'Git conflct both' })
    vim.keymap.set('n', '<leader>gn', '<Plug>(git-conflict-none)', { desc = 'Git conflct none' })
    vim.keymap.set('n', '<leader>gk', '<Plug>(git-conflict-prev-conflict)', { desc = 'Git conflct prev conflict' })
    vim.keymap.set('n', '<leader>gj', '<Plug>(git-conflict-next-conflict)', { desc = 'Git conflct next conflict' })
  end,
}
