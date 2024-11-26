local c = require('nord.colors').palette
local nord_extended = require 'custom/nord-extended'

local custom_nord = {}

custom_nord.normal = {
  a = { fg = nord_extended.snow_storm.dark, bg = c.polar_night.brightest },
  b = { fg = nord_extended.snow_storm.dark, bg = c.polar_night.brightest },
  c = { fg = nord_extended.snow_storm.darker, bg = c.polar_night.origin },
}

custom_nord.insert = {
  a = { fg = c.frost.artic_water, bg = c.polar_night.brighter },
}

custom_nord.visual = {
  a = { fg = c.frost.ice, bg = c.polar_night.brighter },
}

custom_nord.replace = {
  a = { fg = c.aurora.yellow, bg = c.polar_night.brighter },
}

custom_nord.command = {
  a = { fg = c.aurora.green, bg = c.polar_night.brighter },
}

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        -- theme = 'auto',
        theme = custom_nord,
        component_separators = { left = '│', right = '│' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        },
      },
      sections = {
        -- lualine_a = { { 'branch', separator = { left = '' }, right_padding = 2 } },
        lualine_a = { { 'branch', separator = { right = '', left = '' }, right_padding = 2 }, 'diagnostics' },
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        -- lualine_x = { 'progress' },
        lualine_x = { 'diff', 'mode' },
        lualine_y = {},
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    }
  end,
}
