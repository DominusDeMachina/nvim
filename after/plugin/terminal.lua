require("toggleterm").setup{
  direction = "float"
}

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>gl", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

local node = Terminal:new({
  cmd = "node",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
})

function _node_toggle()
  node:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>tn", "<cmd>lua _node_toggle()<CR>", {noremap = true, silent = true})
