return {
  'MeanderingProgrammer/render-markdown.nvim',
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
  config = function()
    require('render-markdown').setup {
      heading = {
        -- Turn on / off heading icon & background rendering
        enabled = false,
      },
      checkbox = {
        enabled = true,
        unchecked = {
          -- Replaces '' of 'task_list_marker_unchecked'
          -- icon = '󰄱',
          icon = '_',
          -- Highlight for the unchecked icon
          highlight = 'RenderMarkdownUnchecked',
          -- Highlight for item associated with unchecked checkbox
          scope_highlight = nil,
        },
        checked = {
          -- Replaces '[x]' of 'task_list_marker_checked'
          icon = 'x',
          -- Highlight for the checked icon
          highlight = 'RenderMarkdownChecked',
          scope_highlight = 'Comment',
          -- Highlight for item associated with checked checkbox
          -- scope_highlight = nil,
        },
      },
    }
  end,
}
