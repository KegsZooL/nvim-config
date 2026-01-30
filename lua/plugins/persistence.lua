return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  config = function()
    require('persistence').setup({
      dir = vim.fn.expand(vim.fn.stdpath('data') .. '~/nvim_sessions_history/'),
      need = 1,
      branch = true,
      pre_save = function()
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          local bufname = vim.api.nvim_buf_get_name(buf)
          local ft = vim.bo[buf].filetype
          if ft == "neo-tree" or bufname:match("neo%-tree") then
            vim.api.nvim_buf_delete(buf, { force = true })
          end
        end
      end,
    })

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
  end
}
