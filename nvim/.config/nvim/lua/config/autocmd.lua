vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if not client then return end
		local bufnr = ev.buf
		if client.supports_method and client:supports_method('textDocument/completion') then
			if vim.lsp.completion and vim.lsp.completion.enable then
				vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
			end
		end
	end,
})
vim.cmd("set completeopt=menu,menuone,noselect")
