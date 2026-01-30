return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    local db = require('dashboard')
    local builtin = require('telescope.builtin')
    local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
    local version = vim.version()
    local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
    local ascii = require('ascii-art')
    local date = os.date("*t")

    local get_todays_date = function()
      local result = {}
      local weekday = ascii.weekdays[date.wday]
      local month = ascii.months[date.month]
      result = weekday
      result = ascii.combine(result, ascii.comma)
      result = ascii.combine(result, month)
      result = ascii.combine(result, ascii.num_to_ascii(date.day), true)

      for i = 1, 10 do
        table.insert(result, "")
      end

      return result
    end

    local get_plugins_stats = function()
      local stats = require("lazy").stats()
      return { " ⚡Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins" }
    end

    local plugins_stats = table.concat(get_plugins_stats(), " ")

    db.setup {
      theme = "doom",
      config = {
        header = get_todays_date(),
        center = {
          {
            icon = '  > ',
            icon_hl = 'Title',
            desc = 'Find File                  ',
            desc_hl = 'String',
            key = 'ff',
            key_format = ' %s',
            action = function() builtin.find_files() end
          },
          {
            icon = '󰱼  > ',
            icon_hl = 'Title',
            desc = 'Find Text',
            desc_hl = 'String',
            key = 'fw',
            key_format = ' %s',
            action = function() builtin.live_grep() end
          },
          {
            icon = '  > ',
            icon_hl = 'Title',
            desc = 'New File',
            desc_hl = 'String',
            key = 'n',
            key_format = ' %s',
            action = function() vim.cmd(':enew') end
          },
          {
            icon = '󰦛  > ',
            icon_hl = 'Title',
            desc = 'Restore Session',
            desc_hl = 'String',
            key = 's',
            key_format = ' %s',
            action = 'lua require("persistence").load()'
          },
          {
            icon = '  > ',
            icon_hl = 'Title',
            desc = 'Configuration',
            desc_hl = 'String',
            key = 'c',
            key_format = ' %s',
            action = "edit ~/.config/nvim/init.lua"
          },
          {
            icon = '󰒲  > ',
            icon_hl = 'Title',
            desc = 'Lazy',
            desc_hl = 'String',
            key = 'l',
            key_format = ' %s',
            action = "Lazy"
          },
          {
            icon = '󰈆  > ',
            icon_hl = 'Title',
            desc = 'Quit',
            desc_hl = 'String',
            key = 'q',
            key_format = ' %s',
            action = ":quit"
          },
        },
        footer = { " ", datetime .. nvim_version_info, " ", plugins_stats  }
      }
    }
  end
}
