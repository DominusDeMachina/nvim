vim.opt.signcolumn = 'yes'
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

require("luasnip.loaders.from_vscode").lazy_load()

local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

local lspkind = require('lspkind')


lsp.setup_nvim_cmp({
  documentation = {
    max_height = 15,
    max_width = 60,
    border = 'rounded',
    col_offset = 0,
    side_padding = 1,
    winhighlight = 'Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None',
    zindex = 1001
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',       -- show only symbol annotations
      maxwidth = 50,         -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
    })
  }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr}
  local bind = vim.keymap.set

  bind('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  bind('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  bind('n', '<leader>lj', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
  bind('n', '<leader>lk', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
  -- more keybindings...
end)

lsp.setup()
