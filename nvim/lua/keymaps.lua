local opts = { noremap = true, silent = true }

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- vim.keymap.set({ 'x', 'n' }, '<leader>w', '<cmd>w<cr><esc>', { desc = 'Save file', noremap = true, silent = true })
vim.keymap.set({ 'x', 'n' }, '<leader>w', function()
  vim.cmd 'write'
end, { desc = 'Save file', noremap = true, silent = true })

-- up and down respecting line wrapping
vim.keymap.set({ 'n', 'v' }, 'j', 'gj', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v' }, 'k', 'gk', { noremap = true, silent = true })

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>x', ':bdelete<CR>', opts) -- close buffer
-- vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts) -- new buffer

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', opts) -- split window vertically
vim.keymap.set('n', '<leader>h', '<C-w>s', opts) -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', opts) -- make split windows equal width & height
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- close current split window

-- Quick horizontal navigation
-- vim.keymap.set('n', '<C-h>', '20h', opts)
-- vim.keymap.set('n', '<C-l>', '20l', opts)
-- vim.keymap.set('n', '<C-S-h>', '40h', opts)
-- vim.keymap.set('n', '<C-S-l>', '40l', opts)

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows

-- Navigate between splits
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-k', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts) -- open new tab
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts) --  go to next tab
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts) --  go to previous tab

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Commenting
vim.keymap.set({ 'n' }, '<leader>c', 'gcc', { remap = true })
vim.keymap.set('v', '<leader>c', function()
  vim.cmd.norm 'gc'
end)

-- Auto formatting
vim.keymap.set('n', '<leader>i', function()
  vim.lsp.buf.execute_command { command = 'typescript.organizeImports', arguments = { vim.fn.expand '%:p' } }
end, { desc = 'Organize imports', noremap = true, silent = true })

-- Diagnostics
vim.keymap.set('n', '<leader>D', function()
  vim.diagnostic.goto_prev()
end, { desc = '[D]iagnostics previous', noremap = true, silent = true })

vim.keymap.set('n', '<leader>d', function()
  local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line '.' - 1, col = vim.fn.col '.' - 1 })
  if #diagnostics > 0 then
    vim.diagnostic.open_float { focusable = false }
  else
    vim.diagnostic.goto_next()
  end
end, { desc = '[D]iagnostics next', noremap = true, silent = true })

-- Markdown export as PDF
vim.api.nvim_set_keymap('n', '<leader>mp', ':!pandoc % -V geometry:margin=1in -o %:r.pdf<CR>', { noremap = true, silent = true })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
