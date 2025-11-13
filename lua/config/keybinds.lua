-- Set Keybinds for Neovim

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Browse netrw directory" })

-- Telescope bindings
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = 'Telescope git files' })
vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = 'Telescope string' })
vim.keymap.set("n", "<leader>ft", builtin.treesitter, { desc = 'Telescope treesitter' })

-- Controls for termninal mode when using split windows
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = 'Exit terminal mode' })
vim.keymap.set("t", "<A-esc>", "<C-\\><C-n><C-w>h", { desc = 'Exit terminal mode, move back to left buffer' })
vim.keymap.set("n", "<A-esc>", "<C-w>li", { desc = 'Enter terminal to right' })

