
vim.pack.add { 'https://github.com/akinsho/toggleterm.nvim' }
require('toggleterm').setup {}


vim.keymap.set('n', '<C-`>', "<cmd>ToggleTerm direction=float<CR>", { desc = 'Toggle Terminal' })
