vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, { buffer = args.buf })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = args.buf })
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, { buffer = args.buf })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, { buffer = args.buf })
  end,
})
