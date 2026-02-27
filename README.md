# Dotfiles 🛠️
![CI Tests](https://github.com/klee1611/dotfiles/actions/workflows/CI.yml/badge.svg)
![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)

Personal dotfiles for macOS — automated setup for Neovim, Zsh, and Tmux using [dotbot](https://github.com/anishathalye/dotbot).

## 📁 Structure

```
dotfiles/
├── _scripts/
│   ├── init.sh          # Install Homebrew packages, Go, Python, Node
│   ├── zsh_init.sh      # Install oh-my-zsh and plugins
│   └── nvim_cleanup.sh  # Remove corrupted Neovim caches
├── nvim/                # Neovim configuration (Lua)
│   ├── init.lua
│   └── lua/
│       ├── core/        # options, keymaps
│       └── plugins/     # one file per plugin
├── tmux/
│   ├── tmux.conf        # Base config (gpakosz/.tmux)
│   └── tmux.conf.local  # Local overrides
├── zsh/
│   ├── aliases          # Shell aliases
│   ├── zsh_functions    # Shell functions
│   ├── load_secrets     # macOS Keychain secrets loader
│   └── secrets.list     # Env var names to load from Keychain
├── dotbot/              # Dotbot submodule
├── install.conf.yaml    # Symlink manifest
└── install.sh           # Entry point
```

## 🚀 Installation

### Prerequisites
- macOS
- Homebrew

### Steps

```bash
git clone https://github.com/klee1611/dotfiles.git
cd dotfiles
./install.sh
```

This will:
1. Install Homebrew packages (`git`, `nvim`, `nvm`, `pyenv`, `pnpm`, `asdf`, `curl`, `wget`, `ripgrep`, `pipx`)
2. Install and configure gvm with Go 1.23 (bootstrap chain: 1.4 → 1.17.13 → 1.20.14 → 1.23)
3. Install Python 3.10 via pyenv and poetry via pipx
4. Set up oh-my-zsh with plugins
5. Symlink all config files via dotbot

Then restart your shell:

```bash
source ~/.zshrc
```

### Symlinks created

| Symlink | Source |
|---|---|
| `~/.zshrc` | `zshrc` |
| `~/.config/zsh/` | `zsh/*` |
| `~/.config/nvim/` | `nvim/*` |
| `~/.tmux.conf` | `tmux/tmux.conf` |
| `~/.tmux.conf.local` | `tmux/tmux.conf.local` |

## ⚙️ Zsh

**Shell framework**: oh-my-zsh  
**Plugins**: `zsh-completions`, `zsh-syntax-highlighting`, `zsh-autosuggestions`, `git`, `autojump`, `asdf`

**Startup optimizations:**
- `HOMEBREW_PREFIX` detected via path check — no `brew --prefix` subprocess
- NVM default node version prepended to `PATH` directly from `$NVM_DIR/alias/default` — node is available to all processes (including nvim plugins) without sourcing nvm.sh
- `nvm` command lazy-loads full NVM shell integration on first use
- `pyenv` shims prepended to `PATH` directly — no `eval "$(pyenv init --path)"` subprocess
- GVM lazy-loaded on first use of `gvm` or `go`

**Editor**: `vi`, `vim`, `$EDITOR`, `$VISUAL` all point to `nvim`

## 🔐 Secrets Management

API keys and tokens are stored in **macOS Keychain** and exported automatically at shell startup. No secrets are ever written to files.

`zsh/secrets.list` (committed) lists only env var **names**. Values live exclusively in Keychain.

### Setup

```zsh
secret-set KAGGLE_API_TOKEN your_value
secret-set AWS_ACCESS_KEY_ID your_value
secret-set AWS_SECRET_ACCESS_KEY your_value
```

After storing, values are exported automatically in every new shell — same effect as `export KAGGLE_KEY=...`.

### Commands

| Command | Description |
|---|---|
| `secret-set VAR value` | Store or update a secret in Keychain |
| `secret-get VAR` | Print a secret's value |
| `secret-del VAR` | Remove a secret from Keychain |
| `secret-list` | Show status of all tracked secrets |

To add a new service, append its env var name to `zsh/secrets.list` and run `secret-set` once.

## 🖥️ Tmux

Based on [gpakosz/.tmux](https://github.com/gpakosz/.tmux). Customizations in `tmux/tmux.conf.local`:

| Keybinding | Action |
|---|---|
| `Ctrl+Space` | Prefix (remap Caps Lock → Control in macOS System Settings for ergonomic use) |
| `Option + ←/→/↑/↓` | Switch panes (no prefix needed) |

Mouse support and vi copy mode are enabled. Selection is copied to the system clipboard via `pbcopy`.

## 📝 Neovim

**Plugin manager**: [lazy.nvim](https://github.com/folke/lazy.nvim)  
**Leader key**: `,`

### Key mappings

| Key | Action |
|---|---|
| `F2` | Toggle file explorer (nvim-tree) |
| `F3` | Toggle code outline (aerial) |
| `,f` | Refresh file explorer |
| `,n` | Find current file in explorer |
| `,ff` | File browser (Telescope) |
| `,fg` | Live grep (Telescope) |
| `,fb` | Buffers (Telescope) |
| `,fh` | Help tags (Telescope) |
| `,t` | Open terminal in split |
| `tc` / `tn` / `tp` / `tk` | New / next / previous / close tab |
| `t1`–`t9`, `t0` | Jump to tab 1–10 |

### Plugins

| Plugin | Purpose |
|---|---|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP/DAP/formatter/linter installer |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP server configs |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Completion engine |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Formatting (prettier, stylua, black, isort) |
| [nvim-lint](https://github.com/mfussenegger/nvim-lint) | Linting (pylint, eslint_d) |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) | Debugger |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) | File explorer |
| [aerial.nvim](https://github.com/stevearc/aerial.nvim) | Code outline |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim) | Git diff viewer |
| [copilot.vim](https://github.com/github/copilot.vim) | GitHub Copilot |

### First launch

```bash
nvim  # lazy.nvim installs all plugins automatically
```

Then install LSP servers, formatters, and linters:

```vim
:Mason
```

### Troubleshooting

**Mason fails to install gopls:**
```bash
go version          # should show go1.23
go install golang.org/x/tools/gopls@latest
```

**Treesitter parser errors:**
```bash
./_scripts/nvim_cleanup.sh
nvim  # reinstalls parsers on next launch
```

## 📜 License

MIT


