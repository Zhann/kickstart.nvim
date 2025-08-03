# My Neovim Configuration

A personalized Neovim configuration that started from [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) and evolved into a fully modular setup tailored to my workflow.

## Overview

This configuration began as kickstart.nvim - a fantastic starting point for understanding Neovim configuration. However, it has since been extensively customized and reorganized to suit my specific needs. While the foundation came from kickstart, this is now a standalone configuration that won't track upstream changes.

### Key Features

- **Fully Modular**: All plugins are organized in separate files under `lua/zhann/plugins/`
- **Clean init.lua**: Core configuration reduced to ~190 lines (from 900+)
- **LSP Support**: Configured for Ruby, Lua, Terraform/OpenTofu, and more
- **Modern Plugins**: Using latest tools like blink.cmp for completion
- **Custom Formatting**: Support for multiple languages with conform.nvim
- **OpenTofu Integration**: Full support for OpenTofu with tofu_fmt formatter

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

Each plugin has its own file in `lua/zhann/plugins/`. Simply edit the relevant file and restart Neovim.

## Credits

This configuration started from [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim), which provided an excellent foundation for learning Neovim configuration. Thanks to the kickstart.nvim maintainers for creating such a well-documented starting point.

## License

MIT License (same as kickstart.nvim)

