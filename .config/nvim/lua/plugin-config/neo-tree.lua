require'neo-tree'.setup {
  enable_diagnostics = false,
  enable_git_status = false,
  window = {
    mappings = {
      ['<space>'] = 'noop',
      ['H'] = 'noop',
      ['/'] = 'noop',
      ['z'] = 'noop',
      ['o'] = 'open',
    }
  },
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = false,
    }
  }
}
