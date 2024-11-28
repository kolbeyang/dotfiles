return {
  'ggandor/leap.nvim',
  config = function()
    require('leap').opts.safe_labels = 'uehtngmb,E1234UHMTAGB<>Z/?'
    vim.keymap.set('n', 's', '<Plug>(leap)')
    vim.keymap.set({ 'x', 'o' }, 's', '<Plug>(leap-forward)')
    vim.keymap.set({ 'x', 'o' }, 'S', '<Plug>(leap-backward)')
    require('leap').opts.preview_filter = function() end
  end,
}
