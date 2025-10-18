# Dotfiles for Development Environment 🛠️
![CI Tests](https://github.com/klee1611/dotfiles/actions/workflows/CI.yml/badge.svg)
![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)

Welcome to my dotfiles repository! This project provides an automated setup for a complete development environment with configurations for Neovim, Zsh, Tmux, and Kitty terminal. It's designed to help developers quickly bootstrap a consistent and efficient workspace across machines.

## 🚀 Project Purpose

This repository automates the setup of a modern development environment with:

- **Automated Installation**: Single command setup for all development tools and dependencies
- **Neovim IDE Configuration**: Modern Neovim setup with LSP, debugging, auto-completion, and AI assistance
- **Shell Environment**: Zsh with oh-my-zsh, plugins, and custom configurations
- **Terminal Configuration**: Kitty terminal with themes and optimizations
- **Version Managers**: Automated setup of Python (pyenv), Node.js (nvm), and Go (gvm)
- **Symlink Management**: Dotbot-based automatic symlinking of configuration files

## 📋 What Gets Installed

### Development Tools
- **Neovim** - Modern text editor with IDE features
- **Git** - Version control
- **Homebrew packages**: curl, wget, ripgrep, asdf, pnpm
- **Kitty terminal** - GPU-accelerated terminal emulator

### Language Environments
- **Go 1.23** - Via gvm (Go Version Manager) with complete bootstrap chain
- **Python 3.10** - Via pyenv with poetry package manager
- **Node.js** - Via nvm (Node Version Manager)

### Shell Environment
- **Zsh** - Default shell
- **Oh-my-zsh** - Shell framework
- **Zsh plugins**: zsh-completions, zsh-syntax-highlighting, zsh-autosuggestions, autojump

## 🛠️ Neovim Configuration

### Architecture
- **Modular Lua Configuration**: Well-organized plugin structure in `nvim/lua/plugins/`
- **Plugin Manager**: [Lazy.nvim](https://github.com/folke/lazy.nvim) for efficient plugin management
- **Modern LSP**: Uses Neovim 0.11+ native `vim.lsp.config` API (not deprecated lspconfig)

### Key Features

- **Language Server Protocol (LSP)**: Multi-language support via Mason and nvim-lspconfig
  - Supported languages: Bash, C/C++, Deno, Python, Rust, Go, Lua, Elixir, JavaScript/TypeScript
  - Auto-installation of LSP servers via mason-lspconfig
  - Native Neovim 0.11+ LSP configuration

- **AI-Assisted Development**: GitHub Copilot integration with chat support

- **Auto-Completion**: nvim-cmp with multiple sources (LSP, buffer, path, snippets)

- **Syntax Highlighting**: Treesitter with curated parser list
  - Languages: Lua, Vim, JavaScript/TypeScript, Python, Go, Rust, C/C++, Bash, Markdown, YAML, SQL, Elixir
  - Automatic error recovery for problematic parsers

- **Code Quality Tools**:
  - **Formatting**: conform.nvim with prettier, stylua, black, isort
  - **Linting**: nvim-lint with pylint, eslint_d

- **Debugging**: nvim-dap with support for multiple languages

- **File Navigation**: 
  - telescope.nvim for fuzzy finding
  - nvim-tree for file explorer

- **Git Integration**: diffview.nvim for enhanced Git operations

- **UI Enhancements**: 
  - Custom dashboard
  - Status line with airline
  - Onedark color scheme
  - Indent guides

### 📦 Major Plugins

- [Lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting
- [mason.nvim](https://github.com/williamboman/mason.nvim) - LSP/DAP/linter/formatter installer
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP configurations
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Completion engine
- [nvim-dap](https://github.com/mfussenegger/nvim-dap) - Debugging
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
- [conform.nvim](https://github.com/stevearc/conform.nvim) - Code formatting
- [nvim-lint](https://github.com/mfussenegger/nvim-lint) - Linting
- [diffview.nvim](https://github.com/sindrets/diffview.nvim) - Git diff viewer
- [github-copilot](https://github.com/github/copilot.vim) - AI pair programming

## 🔧 Installation and Setup

### Prerequisites
- macOS (tested on macOS with ARM64)
- Internet connection
- Homebrew (will be used to install packages)

### Quick Start

1. **Clone this repository:**

   ```bash
   git clone https://github.com/klee1611/dotfiles.git 
   cd dotfiles
   ```

2. **Run the installation script:**

   ```bash
   ./install.sh
   ```

   This will:
   - Install Homebrew packages
   - Set up language version managers (gvm, pyenv, nvm)
   - Install Go 1.23 with complete bootstrap chain (1.4 → 1.17.13 → 1.20.14 → 1.23)
   - Install Python 3.10 and poetry
   - Set up oh-my-zsh with plugins
   - Symlink all configuration files to your home directory
   - Install Kitty terminal with theme

3. **Restart your shell or source the new configuration:**

   ```bash
   source ~/.zshrc
   ```

4. **Open Neovim and install plugins:**

   ```bash
   nvim
   ```
   
   Lazy.nvim will automatically install all plugins on first launch.

5. **Install LSP servers, formatters, and linters:**

   Open Neovim and run:
   ```vim
   :Mason
   ```
   
   The configured tools will be automatically installed via mason-lspconfig.

### What Gets Symlinked

The installation creates symlinks for:
- `~/.zshrc` → `zshrc`
- `~/.config/zsh/` → `zsh/*`
- `~/.config/nvim/` → `nvim/*`
- `~/.tmux.conf` → `tmux/tmux.conf`
- `~/.tmux.conf.local` → `tmux/tmux.conf.local`
- `~/.config/kitty/kitty.conf` → `kitty.conf`

**Note**: Existing files will be replaced (backed up by dotbot if needed).

## 📁 Project Structure

```
dotfiles/
├── _scripts/           # Installation and setup scripts
│   ├── init.sh        # Main system setup (brew, gvm, pyenv, etc.)
│   ├── zsh_init.sh    # Oh-my-zsh and plugin setup
│   └── nvim_cleanup.sh # Utility to clean corrupted Neovim caches
├── nvim/              # Neovim configuration
│   ├── init.lua       # Entry point
│   └── lua/
│       ├── core/      # Core settings (options, keymaps)
│       └── plugins/   # Plugin configurations (modular)
├── zsh/               # Zsh configuration files
├── tmux/              # Tmux configuration
├── dotbot/            # Dotbot submodule for symlink management
├── install.conf.yaml  # Dotbot configuration
├── install.sh         # Main installation script
└── README.md          # This file
```

## ⚙️ Configuration Details

### Neovim Key Mappings

Leader key: `Space`

- **LSP**:
  - `gD` - Go to declaration
  - `gd` - Go to definition
  - `K` - Hover documentation
  - `gi` - Go to implementation
  - `<Space>rn` - Rename symbol
  - `gr` - Find references
  - `<Space>f` - Format code
  - `<Space>df` - Next diagnostic

- **File Navigation**:
  - `<Space>fm` - Format file/selection

- **Linting**:
  - `<Leader>l` - Trigger linting

### Go Version Management

The installation sets up a complete Go bootstrap chain:
1. Installs gvm (Go Version Manager)
2. Builds Go 1.4 (binary bootstrap)
3. Uses Go 1.4 to build Go 1.17.13
4. Uses Go 1.17.13 to build Go 1.20.14
5. Uses Go 1.20.14 to build Go 1.23 (final version)

This ensures gopls and other Go tools work correctly with Mason.

### Troubleshooting

**If Mason fails to install gopls:**
- Ensure Go 1.23 is installed: `go version`
- Check GOPATH is set: `echo $GOPATH`
- Manually install: `go install golang.org/x/tools/gopls@latest`

**If Treesitter parsers fail:**
- Run the cleanup script: `./_scripts/nvim_cleanup.sh`
- Reopen Neovim to reinstall parsers

**If symlinks fail:**
- The `force: true` option in `install.conf.yaml` will overwrite existing files
- Backup important configs before running `./install.sh`

## 🧑‍💻 Contributing

Contributions are welcome! If you have ideas for improvement:

1. Fork this repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 📜 License

This project is open-source and available under the MIT License.

## 💬 Feedback & Support

For issues, questions, or suggestions:
- Open an issue on GitHub
- Check existing issues for solutions
- Review the troubleshooting section above

Happy coding! 🚀

