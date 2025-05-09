return {
  "ibhagwan/fzf-lua",  -- FZF integration for Neovim using Lua
  dependencies = { "echasnovski/mini.icons" },
  keys = {
    {
      "<C-p>",
      function() require('fzf-lua').files({
        prompt    = 'Files❯ ',
        no_ignore = false,       -- respect .gitignore
        fd_opts   = "--type f"
      }) end,
      desc = "Find files (respect .gitignore)",
    },
    {
      "<leader>fg",
      function() require('fzf-lua').live_grep({
        rg_opts  = "--column --line-number --no-heading --color=always --smart-case",
        prompt   = 'Rg❯ '
      }) end,
      desc = "Live grep (fzf-lua)",
    },
    {
      "<leader>ffg",
      function() require('fzf-lua').git_files({
        prompt = 'GitFiles❯ '
      }) end,
      desc = "Git tracked files only",
    },
  },
  opts = {
    winopts = {
      height = 0.85,
      width  = 0.80,
    },
    fzf_opts = {
      ['--ansi'] = '',
      ['--prompt'] = '→ ',
    },
  },
}

