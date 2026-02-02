local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Disable Ctrl-Z (suspend)
keymap.set({'n', 'i', 'v'}, '<C-z>', '<Nop>', opts)

-- Disabling arrows
keymap.set('n', '<Up>', '<Nop>', opts)
keymap.set('n', '<Down>', '<Nop>', opts)
keymap.set('n', '<Left>', '<Nop>', opts)
keymap.set('n', '<Right>', '<Nop>', opts)

keymap.set('i', '<Up>', '<Nop>', opts)
keymap.set('i', '<Down>', '<Nop>', opts)
keymap.set('i', '<Left>', '<Nop>', opts)
keymap.set('i', '<Right>', '<Nop>', opts)

keymap.set('v', '<Up>', '<Nop>', opts)
keymap.set('v', '<Down>', '<Nop>', opts)
keymap.set('v', '<Left>', '<Nop>', opts)
keymap.set('v', '<Right>', '<Nop>', opts)

keymap.set('n', '<A-y>', ':t.<CR>', opts)
keymap.set('x', '<A-y>', ":t'><CR>", opts)

keymap.set("v", "p", '"_dP', opts)

keymap.set('n', 'dd', '"_dd', opts)
keymap.set('v', 'd', '"_d', opts)

keymap.set('n', 's', '"_s', opts)
keymap.set('v', 's', '"_s', opts)

vim.keymap.set({'n','x','o'}, 'f', '<Plug>(leap-forward)')
vim.keymap.set({'n','x','o'}, 'F', '<Plug>(leap-backward)')

keymap.set('n', 'daw', '"_daw', opts)
keymap.set('n', 'dw', '"_daw', opts)

keymap.set('n', '<C-w>', 'vi', opts)
keymap.set('n', '<C-S-w>', 'va', opts)

-- Jump forward
keymap.set('n', '<C-i>', '<C-i>', opts)

-- Commenting on lines
keymap.set('n', '<A-\'>', ':lua require("Comment.api").toggle.linewise.current()<CR>', opts)
keymap.set('v', '<A-\'>', ':lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', opts)
keymap.set('i', '<A-\'>', '<Esc>:lua require("Comment.api").toggle.linewise.current()<CR>gi', opts)

-- Save the current file
keymap.set('n', '<C-s>', ':w!<CR>', opts)
keymap.set('v', '<C-s>', ':w!<CR>', opts)
keymap.set('i', '<C-s>', '<Esc>:w!<CR>a', opts)

-- Save all buffers
keymap.set('n', '<C-s-a>', ':wa!<CR>', opts)
keymap.set('v', '<C-s-a>', ':wa!<CR>', opts)
keymap.set('i', '<C-s-a>', '<Esc>:wa!<CR>a', opts)

-- Tabulation
keymap.set('n', '<Tab>', ':normal! I<Tab><CR>', opts)
keymap.set('v', '<Tab>', '>gv', opts)

-- Reverse tabulation
keymap.set('n', '<S-Tab>', '<<', opts)
keymap.set('v', '<S-Tab>', '<gv', opts)

-- Tab from the beginning of the current line
keymap.set('n', '<C-Tab>', ':normal! I<Tab><CR>', opts)

-- Exiting nvim
keymap.set('n', '<A-ESC>', ':q!<CR>', opts)
keymap.set('i', '<A-ESC>', '<Esc>:q!<CR>', opts)

-- Close current split window
keymap.set('n', '<A-q>', ':close<CR>:wincmd p<CR>', opts)
keymap.set('i', '<A-q>', '<Esc>:close<CR>:wincmd p<CR>', opts)
keymap.set('v', '<A-q>', '<Esc>:close<CR>:wincmd p<CR>', opts)

-- Close current buffer
keymap.set('n', '<M-\\>', ':bprevious | bd!#<CR>', opts)
keymap.set('i', '<M-\\>', ':bprevious | bd!#<CR>', opts)
keymap.set('v', '<M-\\>', ':bprevious | bd!#<CR>', opts)

-- Split the window
keymap.set('n', '<A-t>', '<Cmd>vsplit<CR>', opts)
keymap.set('i', '<A-t>', '<Cmd>vsplit<CR>', opts)

-- Change the focus in the current split window
keymap.set('n', '<A-a>', '<Cmd>wincmd h<CR>')
keymap.set('n', '<A-e>', '<Cmd>wincmd k<CR>')
keymap.set('n', '<A-d>', '<Cmd>wincmd j<CR>')
keymap.set('n', '<A-s>', '<Cmd>wincmd l<CR>')

keymap.set('i', '<A-a>', '<Esc><Cmd>wincmd h<CR>')
keymap.set('i', '<A-e>', '<Esc><Cmd>wincmd k<CR>')
keymap.set('i', '<A-d>', '<Esc><Cmd>wincmd j<CR>')
keymap.set('i', '<A-s>', '<Esc><Cmd>wincmd l<CR>')

-- Move the current split window up
keymap.set('n', '<C-K>', '<C-w>K', opts)
keymap.set('i', '<C-K>', '<Esc><C-w>K', opts)
keymap.set('v', '<C-K>', '<Esc><C-w>K', opts)

-- Move the current split window down
keymap.set('n', '<C-J>', '<C-w>J', opts)
keymap.set('i', '<C-J>', '<Esc><C-w>J', opts)
keymap.set('v', '<C-J>', '<Esc><C-w>J', opts)

-- Move the current split window to the left side
keymap.set('n', '<C-H>', '<C-w>H', opts)
keymap.set('i', '<C-H>', '<Esc><C-w>H', opts)
keymap.set('v', '<C-H>', '<Esc><C-w>H', opts)

-- Move the current split window to the right side
keymap.set('n', '<C-L>', '<C-w>L', opts)
keymap.set('i', '<C-L>', '<Esc><C-w>L', opts)
keymap.set('v', '<C-L>', '<Esc><C-w>L', opts)

-- Moving between buffers in the current split window
keymap.set('n', '<M-n>', '<Cmd>bprev<CR>', opts)
keymap.set('n', '<M-m>', '<Cmd>bnext<CR>', opts)

-- Changing the size of a split window
keymap.set('n', '<A-->', '<Cmd>resize -2<CR>', opts)
keymap.set('n', '<A-=>', '<Cmd>resize +2<CR>', opts)
keymap.set('n', '<A-,>', '<Cmd>vertical resize -2<CR>', opts)
keymap.set('n', '<A-.>', '<Cmd>vertical resize +2<CR>', opts)

-- Neotree
keymap.set('n', '<leader>ee', '<Cmd>Neotree toggle<CR>', opts)

-- Neotree
keymap.set('n', '<leader>ngs', '<Cmd>Neotree git_status<CR>', opts)

-- Lspsaga
keymap.set('n', '<A-c>', '<cmd>Lspsaga goto_definition<CR>', opts)
keymap.set('i', '<A-c>', '<cmd>Lspsaga goto_definition<CR>', opts)

keymap.set('n', '<A-f>', '<cmd>Lspsaga finder ref<CR>', opts)
keymap.set('i', '<A-f>', '<cmd>Lspsaga finder ref<CR>', opts)

-- Show only implementations (child classes)
keymap.set('n', '<A-z>', '<cmd>Lspsaga finder imp<CR>', { desc = "Find implementations" })

-- Type hierarchy (incoming = parents, outgoing = children)
keymap.set('n', '<leader>lc', '<cmd>Lspsaga incoming_calls<CR>', { desc = "Incoming calls" })
keymap.set('n', '<A-s-x>', '<cmd>Lspsaga outgoing_calls<CR>', { desc = "Outgoing calls" })
keymap.set('n', '<A-x>', '<cmd>Lspsaga incoming_calls<CR>', { desc = "Outgoing calls" })

keymap.set('n', '<A-1>', '<cmd>Lspsaga code_action<CR>', opts)
keymap.set('i', '<A-1>', '<cmd>Lspsaga code_action<CR>', opts)
--
-- keymap.set("n", "<A-r>", "<cmd>Lspsaga rename<CR>", opts)
-- keymap.set("i", "<A-r>", "<cmd>Lspsaga rename<CR>", opts)

keymap.set("n", "<A-r>", vim.lsp.buf.rename, opts)

keymap.set('n', '<A-i>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
keymap.set('i', '<A-i>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

keymap.set('n', '<A-o>', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
keymap.set('i', '<A-o>', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

-- Telescope
local builtin = require('telescope.builtin')

keymap.set('n', '<leader>fr', builtin.resume, { desc = "Resume Telescope" })
keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
keymap.set('n', '<leader>fw', builtin.live_grep, { desc = "Find text" })
keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find buffer" })
keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help tags" })
keymap.set('n', '<leader>gb', builtin.git_branches, { desc = "Git branches" })
keymap.set('n', '<leader>gc', builtin.git_commits, { desc = "Git commits" })

keymap.set('n', '<leader>ne', ':Telescope nerdy<CR>', { desc = "Search and insert nerd font glyphs" })
keymap.set('n', '<leader>nn', ':Telescope notify<CR>' )

-- TODO
keymap.set('n', '<leader>td', '<cmd>TodoTelescope<CR>', opts)
keymap.set('i', '<leader>td', '<cmd>TodoTelescope<CR>', opts)

-- Colortils
keymap.set('n', '<leader>cp', '<cmd>Colortils picker blue<CR>', opts)
keymap.set('n', '<leader>cl', '<cmd>Colortils css list<CR>', opts)

--DBUI
keymap.set('n', '<leader>d', '<cmd>DBUIToggle<CR>', opts)
keymap.set('i', '<leader>d', '<cmd>DBUIToggle<CR>', opts)

keymap.set('n', '<leader>dc', '<cmd>DBUIAddConnection<CR>', opts)
keymap.set('i', '<leader>dc', '<cmd>DBUIAddConnection<CR>', opts)

-- Markdown preview
keymap.set("n", "<leader>md", "<cmd>MarkdownPreview<CR>", opts)

-- Database UI
vim.api.nvim_create_autocmd("FileType", {
    pattern = "sql",
    callback = function()
        vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>ds', '<Plug>(DBUI_ExecuteQuery)', opts)
    end
})

-- DAP
local dap = require("dap")
local dap_ui = require("dapui")

keymap.set('n', '<A-p>', dap.toggle_breakpoint, opts)
keymap.set('n', '<F11>', dap.step_over, opts)
keymap.set('n', '<F1>', dap.step_into, opts)
keymap.set('n', '<F10>', dap.continue, opts)
keymap.set('n', '<F5>', function ()
    dap_ui.close()
    dap.disconnect()
    dap.terminate()
end,
opts)

keymap.set('n', '<F4>', dap_ui.toggle, opts)

-- Dashboard
keymap.set('n', '<leader>hh', ':Dashboard<CR>', opts)

-- Gitsigns
keymap.set('n', 'gr', '<cmd>Gitsigns reset_hunk<CR>', opts)
keymap.set('v', 'gr', '<cmd>Gitsigns reset_hunk<CR>', opts)
keymap.set('n', 'GG', '<cmd>Gitsigns preview_hunk_inline<CR>', opts)
keymap.set('n', 'gG', '<cmd>Gitsigns preview_hunk<CR>', opts)
keymap.set('n', 'gn', '<cmd>Gitsigns nav_hunk next<CR>', opts)
keymap.set('n', 'gp', '<cmd>Gitsigns nav_hunk prev<CR>', opts)

local gs = require('gitsigns')
local notify = vim.notify

keymap.set('n', 'gb', function()
  local on = gs.toggle_current_line_blame()
  notify(string.format('Gitsigns: line blame %s', on and 'ON' or 'OFF'),
    vim.log.levels.INFO, { title = 'gitsigns' })
end, opts)

-- Git
keymap.set('n', '<leader>gs', "<cmd>LazyGit<cr>", opts)

-- Inalay hints
local lsp = vim.lsp
keymap.set("n", "X", function()
  local enabled = vim.lsp.inlay_hint.is_enabled()
  if enabled then
      lsp.inlay_hint.enable(false)
  else
      lsp.inlay_hint.enable(true)
  end
end, opts)

local diagnostics_visible = true

keymap.set('n', 'C', function ()
  require("tiny-inline-diagnostic").toggle()
  diagnostics_visible = not diagnostics_visible
  vim.diagnostic.config({
      underline = diagnostics_visible,
  })
end, opts)

-- Trouble
keymap.set("n", "]D", '<cmd>Trouble diagnostics open<CR>', opts)
keymap.set("n", "[d", '<cmd>Trouble diagnostics next<CR>', opts)
keymap.set("n", "[d", '<cmd>Trouble diagnostics prev<CR>', opts)

-- GO
keymap.set("n", "<leader>st", "<cmd>GoFillStruct<CR>", opts )

-- Aider
keymap.set('n', '<leader>ai', '<cmd>Aider toggle<CR>', opts)
keymap.set('n', '<leader>as', '<cmd>Aider send<CR>', opts)
keymap.set('v', '<leader>as', '<cmd>Aider send<CR>', opts)
keymap.set('n', '<leader>ac', '<cmd>Aider command<CR>', opts)
keymap.set('n', '<leader>ab', '<cmd>Aider buffer<CR>', opts)
keymap.set('n', '<leader>a+', '<cmd>Aider add<CR>', opts)
keymap.set('n', '<leader>a-', '<cmd>Aider drop<CR>', opts)
keymap.set('n', '<leader>ar', '<cmd>Aider add readonly<CR>', opts)
keymap.set('n', '<leader>aR', '<cmd>Aider reset<CR>', opts)

-- Docker
keymap.set({ 'n', 't' }, '<leader>ld', '<Cmd>lua LazyDocker.toggle()<CR>')

-- Listchars
keymap.set({'n', 'v'}, '<A-;>', '<cmd>ListcharsToggle<CR>', opts)

-- Resolve python import
keymap.set('n', '<A-[>', '<cmd>PympleResolveImport<CR>')

-- Autosave toggle
local autosave_enabled = true

keymap.set('n', '<leader>at', function()
  vim.cmd('ASToggle')
  autosave_enabled = not autosave_enabled
  notify(
    string.format('Autosave: %s', autosave_enabled and 'ON' or 'OFF'),
    vim.log.levels.INFO,
    { title = 'Autosave' }
  )
end, opts)

keymap.set('n', '<space><space>', '<cmd>TSJToggle<CR>', opts)

-- Neovide scale (zoom) controls
if vim.g.neovide then
  keymap.set('n', '<C-=>', function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * 1.1
  end, { noremap = true, silent = true, desc = "Increase Neovide zoom" })

  keymap.set('n', '<C-->', function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor / 1.1
  end, { noremap = true, silent = true, desc = "Decrease Neovide zoom" })

  keymap.set('n', '<C-0>', function()
    vim.g.neovide_scale_factor = 1.0
  end, { noremap = true, silent = true, desc = "Reset Neovide zoom" })
end
