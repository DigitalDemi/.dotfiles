return {
  "ibhagwan/fzf-lua",  -- FZF integration for Neovim using Lua
  -- Optional dependency for icon support
  dependencies = { "echasnovski/mini.icons"},
  -- If using a different icons library, you could also use:
  -- dependencies = { "echasnovski/mini.icons" },

  -- Key mappings configuration
  keys = {
    {
      "<C-p>",  -- Press Control-p to trigger file search
      function() require('fzf-lua').files() end,  -- Calls fzf-lua file picker
      desc = "Finding files using fuzz finder",  -- Description of the key mapping
    },
  },

  -- Additional plugin options can go here
  opts = {},
}

