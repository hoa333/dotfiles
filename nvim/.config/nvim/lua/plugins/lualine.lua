return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			theme = "auto",
			component_separators = { left = "│", right = "│" },
			section_separators = "",
		},
		sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_y = {},
			lualine_z = {},

			-- Trái: File + Git
			lualine_c = {
				{
					"filename",
					icon = "",
					path = 1, -- 0 = chỉ tên file, 1 = path tương đối
					symbols = { modified = " ", readonly = " " },
				},
				{
					"branch",
					icon = "",
					separator = "│",
				},
			},

			-- Phải: LSP + Diagnostics + File size
			lualine_x = {
				{
					function()
						local clients = vim.lsp.get_clients({ bufnr = 0 })
						if #clients == 0 then
							return " No LSP"
						end
						return " " .. clients[1].name
					end,
					color = { fg = "#ffffff", gui = "bold" },
				},
				{
					"diagnostics",
					sources = { "nvim_diagnostic" },
					symbols = { error = " ", warn = " ", info = " " },
					separator = "│",
				},
				{
					function()
						local fsize = vim.fn.getfsize(vim.fn.expand("%:p"))
						if fsize <= 0 then
							return ""
						end
						if fsize < 1024 then
							return fsize .. "B"
						elseif fsize < 1024 * 1024 then
							return string.format("%.1fK", fsize / 1024)
						else
							return string.format("%.1fM", fsize / (1024 * 1024))
						end
					end,
					icon = "",
				},
			},
		},
	},
}
