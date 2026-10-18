---
layout: home

hero:
  name: Dotfiles
  text: macOS dev environment in one command
  tagline: Neovim, Zsh and Tmux — installed, configured and symlinked with dotbot.
  actions:
    - theme: brand
      text: Get Started
      link: /guide/getting-started
    - theme: alt
      text: Neovim Keymaps
      link: /neovim/
    - theme: alt
      text: View on GitHub
      link: https://github.com/klee1611/dotfiles

features:
  - icon: ⚡
    title: One-command install
    details: install.sh installs Homebrew packages, language version managers and oh-my-zsh, then symlinks every config with dotbot.
  - icon: 📝
    title: Neovim IDE
    details: lazy.nvim, LSP via Mason, completion, formatting, linting, debugging, Telescope and a file tree.
  - icon: 🤖
    title: Claude Code in the editor
    details: avante.nvim drives the local Claude Code CLI over ACP — same agent, same login, no API key.
  - icon: 🔐
    title: Secrets without exports
    details: Static tokens live in macOS Keychain and are handed to one command at a time, behind an approval prompt.
  - icon: 🐚
    title: Fast Zsh
    details: oh-my-zsh with completions, syntax highlighting and autosuggestions; nvm and gvm are lazy-loaded.
  - icon: 🖥️
    title: Tmux
    details: Based on gpakosz/.tmux with mouse support, vi copy mode and clipboard integration.
---
