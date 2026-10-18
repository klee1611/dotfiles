# Zsh

**框架：**[oh-my-zsh](https://ohmyz.sh)，使用 `agnoster` 主題。

**外掛：**`zsh-completions`、`zsh-syntax-highlighting`、
`zsh-autosuggestions`、`autoupdate`、`git`、`autojump`、`asdf`。

**編輯器：**`vi`、`vim`、`$EDITOR` 與 `$VISUAL` 都指向 `nvim`。

## 啟動速度最佳化

- 以路徑檢查偵測 `HOMEBREW_PREFIX` —— 不需要執行 `brew --prefix` 子程序。
- 直接從 `$NVM_DIR/alias/default` 把 nvm 的預設 Node 版本加入 `PATH`，
  因此不必載入 `nvm.sh`，所有程序（包括 Neovim 外掛）都能使用 `node`/`npm`。
- `nvm` 指令在第一次使用時才延遲載入完整的 nvm 整合。
- 直接把 pyenv shims 加到 `PATH` 前面 —— 不需要 `eval "$(pyenv init --path)"`。
- gvm 在第一次使用 `gvm` 或 `go` 時才延遲載入。

## 別名與函式

| 指令 | 用途 |
|---|---|
| `vi`、`vim` | 開啟 Neovim |
| `myip` | 顯示你的對外 IP（`https://ipecho.net/plain`） |
| `server` | 在 8080 埠提供目前目錄（`python3 -m http.server`） |
| `random_uuid` | 產生一組隨機 UUID |

機密工具（`secret-set`、`secret-run` 等）請見[機密管理](./secrets)。

::: tip 外掛更新
`autoupdate` 外掛會自動拉取自訂 zsh 外掛的新版本。如果你想自己檢查外掛更新，
請把它從 `zshrc` 的 `plugins=(…)` 中移除。
:::
