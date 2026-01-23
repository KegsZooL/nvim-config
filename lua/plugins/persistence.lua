require('persistence').setup({
    dir = vim.fn.expand(vim.fn.stdpath('data') .. '~/nvim_sessions_history/'),
    need = 1,
    branch = true, -- use git branch to save session
    pre_save = function()
        -- Close neo-tree windows and delete buffers before saving
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            local bufname = vim.api.nvim_buf_get_name(buf)
            local ft = vim.bo[buf].filetype
            if ft == "neo-tree" or bufname:match("neo%-tree") then
                vim.api.nvim_buf_delete(buf, { force = true })
            end
        end
    end,
})

-- Delete neo-tree buffers after session restore
vim.api.nvim_create_autocmd("SessionLoadPost", {
    callback = function()
        vim.schedule(function()
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                local bufname = vim.api.nvim_buf_get_name(buf)
                if bufname:match("neo%-tree") or bufname:match("filesystem") then
                    pcall(vim.api.nvim_buf_delete, buf, { force = true })
                end
            end
        end)
    end,
})
