return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			vim.keymap.set("n", "<space>K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<space>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<space>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<space>gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "<space>gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {})
			vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, {})
			vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, {})
			vim.keymap.set("n", "<space>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, {})
			vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, {})
			vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "<space>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, {})
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})
			vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, {})
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		lazy = false,
		config = function()
			require("lspsaga").setup({
				symbol_in_winbar = {
					enable = true,
					separator = " > ",
					show_file = true,
					file_formatter = "",
					click_support = false,
				},
				code_action_lightbulb = {
					enable = true,
					sign = true,
					enable_in_insert = true,
					sign_priority = 20,
					virtual_text = true,
				},
			})
      local opts = { silent = true, noremap =true }
			vim.keymap.set("n", "gh", "<cmd>Lspsaga finder<CR>", opts)
			vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>", opts)
			vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
			vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
			vim.keymap.set("n", "ga", "<cmd>Lspsaga code_action<CR>", opts)
			vim.keymap.set("n", "gs", "<cmd>Lspsaga signature_help<CR>", opts)
      vim.keymap.set('n', 'gt', '<cmd>Lspsaga outline<CR>')
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},
}
