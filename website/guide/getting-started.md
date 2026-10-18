# Getting Started

Personal dotfiles for macOS — automated setup for Neovim, Zsh and Tmux using
[dotbot](https://github.com/anishathalye/dotbot).

## Prerequisites

- macOS
- [Homebrew](https://brew.sh)

## Install

```bash
git clone https://github.com/klee1611/dotfiles.git
cd dotfiles
./install.sh
```

`install.sh` runs dotbot, which:

1. Symlinks every config file into place (see [below](#symlinks)).
2. Installs Homebrew packages: `git`, `nvm`, `pyenv`, `nvim`, `pnpm`, `asdf`,
   `curl`, `pipx`, `wget`, `ripgrep`, `uv`.
3. Installs [gvm](https://github.com/moovweb/gvm) and Go 1.25.7 (binary
   install), set as the default.
4. Installs Python 3.10.0 with pyenv and sets it as the global version.
5. Installs oh-my-zsh and its plugins (see [Zsh](./zsh)).

Then start a new shell:

```bash
exec zsh
```

::: tip Skipping the package bootstrap
Set `DOTFILES_SKIP_BOOTSTRAP=1` to only create the symlinks — handy on a machine
that already has the tools, and it is what CI uses.

```bash
DOTFILES_SKIP_BOOTSTRAP=1 ./install.sh
```
:::

## Symlinks

| Symlink | Source |
|---|---|
| `~/.zshrc` | `zshrc` |
| `~/.config/zsh/` | `zsh/*` |
| `~/.config/nvim/` | `nvim/*` |
| `~/.tmux.conf` | `tmux/tmux.conf` |
| `~/.tmux.conf.local` | `tmux/tmux.conf.local` |

::: warning Existing files are replaced
The dotbot manifest uses `force: true`, so an existing `~/.zshrc` (or any other
target above) is overwritten by the symlink. Back up anything you want to keep first.
:::

Because these are symlinks into the repo, `git status` shows any change to
your shell or editor config — including one you did not make.

## Repository layout

```
dotfiles/
├── _scripts/
│   ├── init.sh          # Homebrew packages, Go, Python
│   ├── zsh_init.sh      # oh-my-zsh and plugins
│   └── nvim_cleanup.sh  # Remove corrupted Neovim caches
├── nvim/                # Neovim configuration (Lua)
│   ├── init.lua
│   └── lua/
│       ├── core/        # options, keymaps, lazy.nvim bootstrap
│       └── plugins/     # one file per plugin group
├── tmux/
│   ├── tmux.conf        # Base config (gpakosz/.tmux)
│   └── tmux.conf.local  # Local overrides
├── zsh/
│   ├── aliases          # Shell aliases
│   ├── zsh_functions    # Shell functions
│   ├── load_secrets     # Keychain secret helpers
│   └── secrets.list     # Names of stored secrets
├── website/             # This documentation site (VitePress)
├── dotbot/              # dotbot submodule
├── install.conf.yaml    # Symlink manifest
└── install.sh           # Entry point
```

## Next steps

- Open `nvim` — lazy.nvim installs every plugin on first launch. See [Neovim](/neovim/).
- Store any API tokens with `secret-set`. See [Secrets](./secrets).
