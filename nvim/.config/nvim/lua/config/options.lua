vim.o.number = true
vim.o.mouse = ""
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.termguicolors = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.swapfile = false
vim.o.winborder = "rounded"
vim.o.clipboard = "unnamedplus"
vim.o.undofile = true

vim.o.updatetime = 300
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})
vim.bo.commentstring = "-- %s"
local fidget = require("fidget")

vim.notify = function(msg, level, opts)
	if msg:match("Config Change Detected") then
		opts = opts or {}
		opts.title = "⚙️ LazyVim"
		opts.timeout = 5000
	end
	fidget.notify(msg, level, opts)
end
