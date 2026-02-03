return {
  "pocco81/auto-save.nvim",
  event = { "InsertLeave", "TextChanged" },
  config = function()
    require("auto-save").setup({
      enabled = true,
      execution_message = {
        message = function()
          return ""
        end,
        dim = 0.18,
        cleaning_interval = 1250,
      },
      trigger_events = { "InsertLeave" },
      condition = nil,
      write_all_buffers = false,
      debounce_delay = 1000,
    })
  end
}
