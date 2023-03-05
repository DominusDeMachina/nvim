vim.api.nvim_set_keymap("n", "<leader>e", ":Ex<cr>", { noremap = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>tt", vim.cmd.ToggleTerm)
vim.keymap.set("t", "<leader>tt", vim.cmd.ToggleTerm)

vim.keymap.set("n", "<leader>ls", "<cmd>AerialToggle!<CR>")
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")
