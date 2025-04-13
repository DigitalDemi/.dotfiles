vim.cmd("command! Compile lua require('Demi.compile').Compile()")

-- Create a command to set the compilation command and save it
vim.cmd("command! -nargs=1 SetCompileCommand lua require('Demi.compile').SetCompileCommand(<q-args>)")
