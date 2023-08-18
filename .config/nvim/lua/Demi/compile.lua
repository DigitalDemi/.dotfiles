local M = {}

-- Define the path to the project-specific compile command file
local project_compile_file = vim.fn.getcwd() .. '/.compile_command'

-- Function to check if tmux is installed
local function is_tmux_installed()
  local output = vim.fn.system('which tmux')
  return output ~= ''
end

-- Define the compile function that executes the stored command
function M.Compile()
  if not vim.fn.filereadable(project_compile_file) then
    print("No compilation command set!")
    return
  end

  -- Read the compilation command from the file
  local project_compile_command = vim.fn.readfile(project_compile_file)[1]

  if project_compile_command == '' then
    print("No compilation command set!")
    return
  end

  -- Check if tmux is installed
  if not is_tmux_installed() then
    print("Tmux is not installed. Cannot open in tmux panel.")
    return
  end

  -- Prepare the tmux split-window command
  local tmux_pane_command = string.format([[tmux split-window -h -c "#{pane_current_path}" 'bash -c "%s; read -p \"Press Enter to exit...\"; tmux send-keys -t '#{pane_id}' Enter; sleep 2; tmux kill-pane -a"']], project_compile_command)

  -- Run the tmux split-window command
  vim.fn.system(tmux_pane_command)
end

-- Function to set and save the compilation command to the project-specific file
function M.SetCompileCommand(command)
  -- Write the command to the file
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













