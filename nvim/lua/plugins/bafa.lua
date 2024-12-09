return {
  'mistweaverco/bafa.nvim',
  opts = {
    width = 100,
    height = 100,
    title = '',
    title_pos = 'center',
    relative = 'editor',
    border = 'rounded',
    style = 'minimal',
    diagnostics = true,
  },
  config = function()
    vim.keymap.set('n', '<leader>b', function()
      require('bafa.ui').toggle()
    end, { noremap = true, desc = 'toggle bafa bufffer lit' }) --git status
    vim.api.nvim_set_hl(0, 'BafaModified', { fg = '#888888', bg = '#1e222a' })
  end,
}
