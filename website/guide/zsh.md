# Zsh

**Framework:** [oh-my-zsh](https://ohmyz.sh) with the `agnoster` theme.

**Plugins:** `zsh-completions`, `zsh-syntax-highlighting`,
`zsh-autosuggestions`, `autoupdate`, `git`, `autojump`, `asdf`.

**Editor:** `vi`, `vim`, `$EDITOR` and `$VISUAL` all point to `nvim`.

## Startup optimizations

- `HOMEBREW_PREFIX` is detected with a path check — no `brew --prefix` subprocess.
- nvm's default Node version is added to `PATH` directly from
  `$NVM_DIR/alias/default`, so `node`/`npm` are available to every process
  (including Neovim plugins) without sourcing `nvm.sh`.
- The `nvm` command lazy-loads the full nvm integration on first use.
- pyenv shims are prepended to `PATH` directly — no `eval "$(pyenv init --path)"`.
- gvm is lazy-loaded on the first use of `gvm` or `go`.

## Aliases and functions

| Command | What it does |
|---|---|
| `vi`, `vim` | Open Neovim |
| `myip` | Print your public IP (`https://ipecho.net/plain`) |
| `server` | Serve the current directory on port 8080 (`python3 -m http.server`) |
| `random_uuid` | Print a random UUID |

Secret helpers (`secret-set`, `secret-run`, …) are covered in [Secrets](./secrets).

::: tip Plugin updates
The `autoupdate` plugin pulls new versions of the custom zsh plugins
automatically. Remove it from `plugins=(…)` in `zshrc` if you prefer to review
plugin updates yourself.
:::
