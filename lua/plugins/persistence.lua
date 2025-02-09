require('persistence').setup({
    dir = vim.fn.expand(vim.fn.stdpath('data') .. '~/nvim_sessions_history/'),
    need = 1,
    branch = true, -- use git branch to save session
})
