require("luasnip.loaders.from_vscode").lazy_load()

local lsp = require("lsp-zero").preset({
	name = "minimal",
	set_lsp_keymaps = { omit = { "gd", "<F2>", "<F4>", "go", "K", "gl", "gr" } },
	manage_nvim_cmp = true,
	suggest_lsp_servers = false,
})

local lspkind = require("lspkind")

lsp.setup_nvim_cmp({
	documentation = {
		max_height = 15,
		max_width = 60,
		border = "rounded",
		col_offset = 0,
		side_padding = 1,
		winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None",
		zindex = 1001,
	},
	formatting = {
		format = lspkind.cmp_format({
			-- mode = "symbol", -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
		}),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip", keyword_length = 2 },
		{ name = "buffer", keyword_length = 3 },
		{ name = "path" },
	},
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr }
	local bind = vim.keymap.set

	bind("n", "<leader>lr", "<cmd>Lspsaga rename<CR>", opts)
	bind("n", "<leader>la", "<cmd>Lspsaga code_action<CR>", opts)
	bind("n", "<leader>lj", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	bind("n", "<leader>lk", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	bind("n", "K", "<cmd>Lspsaga hover_doc<CR>")
	bind("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
	bind("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")
	bind("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>")
	bind("n", "gr", "<cmd>Lspsaga lsp_finder<CR>")
	bind("n", "<leader>lo", "<cmd>Lspsaga outline<CR>")
	-- more keybindings...
end)

local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

lsp.setup()
