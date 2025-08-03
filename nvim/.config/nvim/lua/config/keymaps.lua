local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Basic
keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
keymap.set('n', '<leader>q', ':quit<CR>')
keymap.set('n', '<Esc>', '<cmd>:nohlsearch<CR>')
keymap.set({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>')
keymap.set({ 'n', 'v', 'x' }, '<leader>d', '"+d<CR>')
keymap.set('n', '<C-s>', function()
	local buf = vim.api.nvim_get_current_buf()
	local name = vim.api.nvim_buf_get_name(buf)
	local buftype = vim.bo[buf].buftype
	if name ~= '' and buftype == '' then
		vim.cmd("w")
		if vim.lsp.buf.format then
			vim.lsp.buf.format({ async = true })
		end
	end
end, { desc = "Save and format buffer" })

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Diagnostic
keymap.set("n", "<leader>cd", vim.diagnostic.open_float)
keymap.set("n", "<leader>xx", vim.diagnostic.setloclist)

-- LSP
keymap.set("n", "gd", vim.lsp.buf.definition)

--Mason
keymap.set("n", "<leader>m", "<cmd>:Mason<CR>")

-- Pick
keymap.set('n', '<leader>f', "<cmd>:Pick files<CR>")
keymap.set('n', '<leader>g', "<cmd>:Pick grep_live<CR>")
keymap.set('n', '<leader>h', "<cmd>:Pick help<CR>")
keymap.set('n', '<leader>b', "<cmd>:Pick buffers<CR>")

-- Files
keymap.set('n', '<leader>e', function() require("mini.files").open(vim.uv.cwd(), true) end)

-- Gitsigns
keymap.set("n", "<leader>gp", "<cmd>:Gitsigns preview_hunk<CR>")
keymap.set("n", "<C-y>", "<cmd>:Yazi cwd<CR>")

-- Tmux-Navigator
keymap.set("n", "<C-h>", "<cmd>:TmuxNavigateLeft<CR>")
keymap.set("n", "<C-l>", "<cmd>:TmuxNavigateRight<CR>")
keymap.set("n", "<C-j>", "<cmd>:TmuxNavigateDown<CR>")
keymap.set("n", "<C-k>", "<cmd>:TmuxNavigateUp<CR>")
