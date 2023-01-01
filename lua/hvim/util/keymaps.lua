local M = {}

local mode_adapters = {
  insert_mode = 'i',
  normal_mode = 'n',
  visual_mode = 'v',
  visual_block_mode = 'x',
  command_mode = 'c',
  terminal_mode = 't',
}

local generic_opts_any = { noremap = true, silent = true }

local generic_opts = {
  insert_mode = generic_opts_any,
  normal_mode = generic_opts_any,
  visual_mode = generic_opts_any,
  visual_block_mode = generic_opts_any,
  command_mode = generic_opts_any,
  term_mode = { silent = true },
}

function M.register_keymaps(mode, mappings)
  if mode_adapters[mode] then
    -- prepare opts
    local opt = generic_opts[mode] or generic_opts_any

    for key, action in pairs(mappings) do
      if type(key) == 'table' then
        opt = key[2]
        action = key[1]
      end
      if action then
        -- add keymap
        vim.api.nvim_set_keymap(mode_adapters[mode], key, action, opt)
      else
        -- delete keymap
        pcall(vim.api.nvim_del_keymap, mode, key)
      end
    end
  end
end

function M.load_keymaps(keymaps)
  for mode, mappings in pairs(keymaps) do
    M.register_keymaps(mode, mappings)
  end
end

return M
