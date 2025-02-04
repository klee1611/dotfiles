# Dotfiles for Development Environment 🛠️
![CI Tests](https://github.com/klee1611/dotfiles/actions/workflows/ci.yml/badge.svg)
![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)

Welcome to my dotfiles repository! This project serves as a personal and shareable configuration setup for various development tools and environments. It aims to help developers quickly set up a consistent and efficient development environment.

## 🚀 Project Purpose

The primary goal of this repository is to:

- Manage and version control configurations for development environments and tools, including Z shell, Neovim, and more.
- Provide structured and maintainable configuration for Neovim using Lua, offering an extensible and well-organized setup for code editing, linting, formatting, debugging, and language server support.

## 🛠️ Neovim Configuration

- **Modular Configuration**: Organized Lua modules for better maintainability.
- **Plugin Management**: Optimized setup using Lazy.nvim for efficient plugin handling.
- **Performance Optimizations**:
  - Lazy-loading plugins to reduce startup time.
  - Refactoring older Vimscript configurations with Lua-based alternatives.
  - Asynchronous plugin loading for heavy plugins like Treesitter to improve responsiveness.
- **Custom Key Bindings**
- **UI Enhancements**

### Key Features

- **AI-Assisted Development**: Integration with GitHub Copilot and Copilot Chat.
- **Auto-Completion & Snippets**: Seamless coding experience with nvim-cmp and snippet support.
- **Syntax Highlighting**: Enhanced syntax support using Treesitter.
- **Code Formatting & Linting**: Pre-configured tools to maintain code quality.
- **Debugger Integration**: Debugging setup with nvim-dap.
- **LSP Support**: Language server configurations for multiple languages using mason.
- **Git Diff View**: Enhanced Git operations with diffview.nvim.
- **File Browsing**: Efficient file navigation using telescope.nvim.
- **UI Enhancements**: Custom dashboard, status line, onedark color scheme, and indent guides.

### 📦 Major Plugins

- [Lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager for Neovim.
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting and code structure parsing.
- [mason.nvim](https://github.com/williamboman/mason.nvim) - Portable package manager for Neovim.
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Completion engine plugin.
- [nvim-dap](https://github.com/mfussenegger/nvim-dap) - Debugging integration.
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder for files and more.
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP configurations.
- [diffview.nvim](https://github.com/sindrets/diffview.nvim) - Git diff viewer.
- [conform.nvim](https://github.com/stevearc/conform.nvim) - Formatter.
- [nvim-lint](https://github.com/mfussenegger/nvim-lint) - Linter.

## 🔧 Installation and Setup

1. Clone this repository:

   ```bash
   git clone -b develop https://github.com/klee1611/dotfiles.git ~/.dotfiles
   ```

2. Install and set up:

   ```bash
   cd ~/.dotfiles
   ./install.sh
   ```

3. Open Neovim and install plugins:

   ```bash
   nvim
   :Lazy install
   ```

## ⚙️  Usage

After installation, the development environment will be configured with essential tools for:

- Enhanced code editing with Neovim.
- Shell productivity improvements.
- Streamlined Git operations.

## 🧑‍💻 Contributing

Contributions are welcome! If you have ideas for improvement, feel free to fork this repo and submit a pull request.

## 📜 License

This project is open-source and available under the MIT License.

## 💬 Feedback & Support

For issues, questions, or suggestions, please open an issue on GitHub or reach out directly through the repository.

Happy coding!

