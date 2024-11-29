return {
  'chrisgrieser/nvim-scissors',
  dependencies = 'nvim-telescope/telescope.nvim',
  opts = {
    snippetDir = '../../snippets/',
  },
  config = function()
    vim.keymap.set('n', '<leader>je', function()
      require('scissors').editSnippet()
    end)
    -- when used in visual mode, prefills the selection as snippet body
    vim.keymap.set({ 'n', 'x' }, '<leader>ja', function()
      require('scissors').addNewSnippet()
    end)
  end,
}
