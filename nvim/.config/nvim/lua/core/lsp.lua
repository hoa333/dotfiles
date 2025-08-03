require('mason').setup()
vim.lsp.enable({ "lua_ls", "pyright", "ruff" })
vim.lsp.config('lua_ls', {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})
