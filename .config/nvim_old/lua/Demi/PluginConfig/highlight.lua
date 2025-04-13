local M = {}

function M.setup()
    -- Create an augroup for highlight on yank
    local highlight_yank_group = vim.api.nvim_create_augroup("HighlightYank", { clear = true })
    
    -- Create an autocommand in the group
    vim.api.nvim_create_autocmd("TextYankPost", {
        group = highlight_yank_group,
        pattern = "*",
        callback = function()
            vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
        end,
    })
end

return M

