local init_options = {
   settings = {
      fixAll = true,
      organizeImports = false, -- use ruff_organize_imports via conform
      args = {
         '--preview', -- use experimental features
         '--ignore',
         table.concat({
            'E111', -- indentation-with-invalid-multiple
            'E114', -- indentation-with-invalid-multiple-comment
            'F401', -- unused-import
            'E402', -- module-import-not-at-top-of-file
            'E501', -- line-too-long
            'E702', -- multiple-statements-on-one-line-semicolon
            'E731', -- lambda-assignment
         }, ','),
      },
   },
}

local on_init = function(client, _)
   if client.server_capabilities then
      -- disable ruff hover in favor of pyright
      client.server_capabilities.hoverProvider = false
      -- disable ruff formatting in favor of ruff_format (managed via conform)
      client.server_capabilities.documentFormattingProvider = false
   end
end

return {
   cmd = { 'ruff', 'server' },
   filetypes = { 'python' },
   root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
   init_options = init_options,
   on_init = on_init,
   capabilities = {
      general = {
         -- https://github.com/astral-sh/ruff/issues/14483
         -- positionEncodings = { "utf-8", "utf-16", "utf-32" } <-- default
         -- pyright uses utf-16, we tell ruff to use 'utf-16' only as well
         positionEncodings = { 'utf-16' },
      },
   },
}
