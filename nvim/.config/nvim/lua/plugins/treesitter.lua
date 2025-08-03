require("nvim-treesitter.configs").setup({
	ensure_installed = { "svelte", "typescript", "javascript", "python" },
	sync_install = false,
	auto_install = true,
	ignore_install = {},
	modules = {},
	highlight = {
		enable = true,
	},
})
