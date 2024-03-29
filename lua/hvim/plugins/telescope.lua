return {
  defaults = {
    -- ignore files in directories
    file_ignore_patterns = {
      'dist',
      'build',
      '__pycache__',
      'vendor',
      'node_modules',
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = 'smart_case',
      },
    },
    prompt_prefix = '   ',
    selection_caret = '  ',
    entry_prefix = '  ',
    sorting_strategy = 'ascending',
    layout_strategy = 'flex',
    layout_config = {
      horizontal = {
        prompt_position = 'top',
        preview_width = 0.55,
      },
      vertical = {
        mirror = false,
      },
      -- width = 0.85,
      -- height = 0.8,
      preview_cutoff = 120,
    },
  },
}
