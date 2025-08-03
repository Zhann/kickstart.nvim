# My Neovim Configuration

A personalized Neovim configuration that started from [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) and evolved into a fully modular setup tailored to my workflow.

## Structure

```
~/.config/nvim/
├── init.lua                    # Core settings and plugin loader
├── lua/
│   └── zhann/
│       ├── plugins/           # All plugin configurations
│       │   ├── blink-cmp.lua
│       │   ├── conform.lua
│       │   ├── gitsigns.lua
│       │   ├── telescope.lua
│       │   └── ...
│       └── themes/           # Theme configurations
│           └── catppuccin.lua
└── lazy-lock.json            # Plugin version lock file
```

## Installation

### Prerequisites

- Neovim stable or nightly
- Git
- Make, gcc (for compiling some plugins)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
- [fd](https://github.com/sharkdp/fd#installation)
- Node.js (for prettier and other JS-based tools)
- A [Nerd Font](https://www.nerdfonts.com/) (optional but recommended)

### Setup

> [!NOTE]
> Backup your previous configuration (if any exists)

1. Backup your existing Neovim configuration:

   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. Clone this configuration:

   ```bash
   git clone <your-repo-url> ~/.config/nvim
   ```

3. Start Neovim:

   ```bash
   nvim
   ```

4. Wait for plugins to install automatically

## Key Mappings

### General

- Leader key: `<Space>`
- Format current buffer: `<leader>f`
- Toggle file explorer: `\`

### Window Navigation

- Move between windows: `<C-h/j/k/l>`
- Toggle window zoom: `<leader>z`

### LSP (Language Server)

- Go to definition: `grd`
- Find references: `grr`
- Rename: `grn`
- Code action: `gra`
- Go to implementation: `gri`

### Search (Telescope)

- Find files: `<leader>sf`
- Live grep: `<leader>sg`
- Search help: `<leader>sh`
- Search buffers: `<leader><leader>`

## Installed Language Servers

The following language servers and tools are automatically installed:

- **Ruby**: ruby-lsp, rubocop
- **Lua**: lua-language-server, stylua
- **Terraform/OpenTofu**: terraform-ls, tflint, tofu_fmt
- **Web**: prettier (JSON, YAML, Markdown)
- **Shell**: shfmt

## Customization

### Common Configuration

The most frequently modified settings are now accessible at the top of `init.lua` in the User Configuration section:

```lua
-- Formatters by file type
vim.g.formatters_by_ft = {
  lua = { 'stylua' },
  ruby = { 'rubocop' },
  -- Add your formatters here
}

-- Linters by file type
vim.g.linters_by_ft = {
  markdown = { 'markdownlint' },
  -- Add your linters here
}

-- Tools to automatically install
vim.g.mason_ensure_installed = {
  'ruby-lsp',
  'stylua',
  -- Add language servers, linters, and formatters here
}
```

After modifying these settings, restart Neovim for changes to take effect.

### Adding Plugins

Create a new file in `lua/zhann/plugins/` with the plugin specification:

```lua
-- lua/zhann/plugins/my-plugin.lua
return {
  'author/plugin-name',
  opts = {
    -- configuration
  }
}
```

### Modifying Existing Plugins

For deeper customization beyond the common settings, each plugin has its own file in `lua/zhann/plugins/`. Edit the relevant file and restart Neovim.

Key plugin files:
- `conform.lua` - Formatter configuration (uses `vim.g.formatters_by_ft`)
- `nvim-lint.lua` - Linter configuration (uses `vim.g.linters_by_ft`)
- `nvim-lspconfig.lua` - LSP server configuration and Mason tool installation

## Credits

This configuration started from [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim), which provided an excellent foundation for learning Neovim configuration. Thanks to the kickstart.nvim maintainers for creating such a well-documented starting point.

## License

MIT License (same as kickstart.nvim)
