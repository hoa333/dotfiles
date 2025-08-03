return {
	"projekt0n/github-nvim-theme",
	name = "github-theme",
	opts = {
		options = {
			transparent = true
		},
	},
	config = function(_, opts)
		require("github-theme").setup(opts)
		vim.cmd("colorscheme github_dark_high_contrast")
	end
}
