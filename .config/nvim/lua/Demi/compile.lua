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

  -- Check if tmux is installed and if the system is not Windows
  if not is_tmux_installed() and vim.fn.has('unix') == 1 then
    print("Tmux is not installed. Cannot open in tmux panel.")
    return
  end

  -- Open terminal based on the system
  if vim.fn.has('win32') == 1 then
    -- For Windows, use regular vertical split with a terminal
    local terminal_command = 'vsplit term://' .. project_compile_command
    vim.cmd(terminal_command)
  else
    -- For non-Windows, use tmux panel split
    local tmux_terminal_command = string.format('silent !tmux split-window -h "%s"', project_compile_command)
    vim.cmd(tmux_terminal_command)
  end
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

return M

