local M = {}

local project_compile_file = vim.fn.getcwd() .. '/.compile_command'

local function is_tmux_installed()
  local output = vim.fn.system('which tmux')
  return output ~= ''
end

function M.Compile()
  if not vim.fn.filereadable(project_compile_file) then
    print("No compilation command set!")
    return
  end

  local project_compile_command = vim.fn.readfile(project_compile_file)[1]

  if project_compile_command == '' then
    print("No compilation command set!")
    return
  end

  if not is_tmux_installed() then
    print("Tmux is not installed. Cannot open in tmux panel.")
    return
  end

  local tmux_pane_command = string.format([[tmux split-window -h -c "#{pane_current_path}" 'bash -c "%s; read -p \"Press Enter to exit...\"; tmux send-keys -t '#{pane_id}' Enter; sleep 2; tmux kill-pane -a"']], project_compile_command)

  vim.fn.system(tmux_pane_command)
end

function M.SetCompileCommand(command)
  local f = io.open(project_compile_file, 'w')
  if f then
    f:write(command)
    f:close()
    print('Compilation command set and saved.')
  else
    print('Error: Unable to save compilation command.')
  end
end

vim.api.nvim_set_keymap('n', '<F5>', [[:lua require('Demi.compile').Compile()<CR>]], { noremap = true, silent = true })

return M
