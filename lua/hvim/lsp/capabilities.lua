local function make_capabilities()
   local capabilities = vim.lsp.protocol.make_client_capabilities()

   capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
   }

   capabilities.textDocument.formatting = {
      dynamicRegistration = false,
   }

   capabilities.textDocument.semanticTokens.augmentsSyntaxTokens = false

   capabilities.textDocument.completion.completionItem = {
      contextSupport = true,
      snippetSupport = true,
      deprecatedSupport = true,
      commitCharactersSupport = true,
      resolveSupport = {
         properties = {
            "additionalTextEdits",
            "documentation",
            "detail",
         },
      },
      labelDetailsSupport = true,
      documentationFormat = { "markdown", "plaintext" },
   }

   return require("blink.cmp").get_lsp_capabilities(capabilities, true)
end

return {
   make_capabilities = make_capabilities,
}
