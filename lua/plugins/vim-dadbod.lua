return {
  'kristijanhusak/vim-dadbod-ui',
  cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection" },
  dependencies = {
    { 'tpope/vim-dadbod' },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }}
  }
}
