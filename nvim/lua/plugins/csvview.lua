return {
  'hat0uma/csvview.nvim',
  config = function()
    local csvview = require 'csvview'
    csvview.setup()

    vim.keymap.set('n', '<leader>mc', csvview.toggle, { desc = 'Toggle csv view' })
  end,
}
