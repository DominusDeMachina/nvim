local telescope = require("telescope")

telescope.setup({
	defaults = {
		layout_config = {
			vertical = { width = 0.5 },
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
		file_browser = {
			theme = "ivy",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				["i"] = {
					-- your custom insert mode mappings
				},
				["n"] = {
					-- your custom normal mode mappings
				},
			},
		},
	},
})

telescope.load_extension("fzf")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fg", builtin.git_files, {})

vim.keymap.set("n", "<leader>fs", builtin.grep_string, {})
vim.keymap.set("v", "<leader>fs", builtin.grep_string, {})

vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})

vim.keymap.set("n", "<leader>lD", builtin.lsp_definitions, {})
vim.keymap.set("n", "<leader>lR", builtin.lsp_references, {})
vim.keymap.set("n", "<leader>lt", builtin.lsp_type_definitions, {})
vim.keymap.set("n", "<leader>li", builtin.lsp_implementations, {})
vim.keymap.set("n", "<leader>ld", builtin.diagnostics, {})
