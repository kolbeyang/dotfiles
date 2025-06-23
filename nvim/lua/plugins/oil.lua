return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  -- Optional dependencies
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  config = function()
    require('oil').setup {
      skip_confirm_for_simple_edits = true,
      keymaps = {
        -- ["<C-c>" ] = "actions.close",
        ['q'] = 'actions.close',
        ['gy'] = 'actions.yank_entry',
      },
      float = {
        -- Padding around the floating window
        padding = 2,
        border = 'rounded',
      },
      win_options = {
        winbar = "%{v:lua.require('oil').get_current_dir()}",
      },
    }
    -- Open parent directory in current window
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

    -- Open parent directory in floating window
    vim.keymap.set('n', '<leader>-', require('oil').toggle_float)

    --  Auto open preview
    -- vim.api.nvim_create_autocmd('User', {
    --   pattern = 'OilEnter',
    --   callback = vim.schedule_wrap(function(args)
    --     local oil = require 'oil'
    --     if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
    --       oil.open_preview()
    --     end
    --   end),
    -- })
  end,
}
