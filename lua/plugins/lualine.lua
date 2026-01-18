-- Modified configuration of Zproger/GenesisNvim


local lualine = require('lualine')
local fn = vim.fn;

local colors = {
  bg       = '#1d1d1d',
  fg       = '#d4be98',
  yellow   = '#fabd2f',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#a9b665',
  orange   = '#e08a4e',
  blue     = '#7daea3',
  red      = '#e56962',
}

local conditions = {
  buffer_not_empty = function()
    return fn.empty(fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = fn.expand('%:p:h')
    local gitdir = fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function()
    return '▊'
  end,
  color = { fg = colors.bg }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
  -- mode component
  function()
    return ''
  end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.red,
      i = colors.green,
      v = colors.blue,
      [''] = colors.blue,
      V = colors.blue,
      c = colors.yellow,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
      ic = colors.yellow,
      R = colors.yellow,
      Rv = colors.yellow,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
      ['!'] = colors.red,
      t = colors.red,
    }
    return { fg = mode_color[fn.mode()] }
  end,
  padding = { right = 1 },
}

ins_left {
  'filesize',
  cond = conditions.buffer_not_empty,
}

-- ins_left {
--   'filename',
--   cond = conditions.buffer_not_empty,
--   color = { fg = colors.orange, gui = 'bold' },
-- }

ins_left {
  function()
    local fullpath = fn.expand('%:p')
    local home = os.getenv("HOME")
    if fullpath:find(home, 1, true) == 1 then
      return fullpath:sub(#home + 1)
    else
      return fullpath
    end
  end,
  cond = conditions.buffer_not_empty,
  color = { fg = colors.orange, gui = 'bold' },
}

ins_left { 'location' }

ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

ins_left {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
  function()
    return '%='
  end,
}

ins_left {
  -- Lsp server name .
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.bo.filetype
    local clients = vim.lsp.get_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = ' LSP:',
  color = { fg = '#d4be98', gui = 'bold' },
}

-- Add components to right sections
ins_right {
  'o:encoding', -- option component same as &encoding in viml
  fmt = string.upper,
  cond = conditions.hide_in_width,
  color = { fg = colors.green, gui = 'bold' },
}

ins_right {
  'fileformat',
  fmt = string.upper,
  icons_enabled = false,
  color = { fg = colors.green, gui = 'bold' },
}

ins_right {
  'branch',
  icon = '',
  color = { fg = colors.yellow, gui = 'bold' },
}

ins_right {
  'diff',
  symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
}

ins_right {
  function()
    return '▊'
  end,
  color = { fg = colors.bg },
  padding = { left = 1 },
}

lualine.setup(config)
