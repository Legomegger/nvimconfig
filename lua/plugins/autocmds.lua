vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    -- Переопределяем =G в нормальном режиме на формат через LSP
    vim.keymap.set("n", "=G", function()
      -- форматируем текущий буфер синхронно
      vim.lsp.buf.format({ async = false, bufnr = bufnr })
    end, {
      buffer = bufnr,
      desc   = "Format buffer via LSP (=G)",
    })
  end,
})

