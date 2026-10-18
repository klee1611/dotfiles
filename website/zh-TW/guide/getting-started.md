# 快速開始

macOS 的個人 dotfiles —— 使用 [dotbot](https://github.com/anishathalye/dotbot)
自動設定 Neovim、Zsh 與 Tmux。

## 事前準備

- macOS
- [Homebrew](https://brew.sh)

## 安裝

```bash
git clone https://github.com/klee1611/dotfiles.git
cd dotfiles
./install.sh
```

`install.sh` 會執行 dotbot，依序：

1. 為所有設定檔建立符號連結（見[下方](#symlinks)）。
2. 安裝 Homebrew 套件：`git`、`nvm`、`pyenv`、`nvim`、`pnpm`、`asdf`、
   `curl`、`pipx`、`wget`、`ripgrep`、`uv`。
3. 安裝 [gvm](https://github.com/moovweb/gvm) 與 Go 1.25.7（二進位安裝），並設為預設版本。
4. 用 pyenv 安裝 Python 3.10.0 並設為全域版本。
5. 安裝 oh-my-zsh 及其外掛（見 [Zsh](./zsh)）。

接著開啟新的 shell：

```bash
exec zsh
```

::: tip 略過套件安裝
設定 `DOTFILES_SKIP_BOOTSTRAP=1` 就只會建立符號連結 —— 適合工具都已安裝好的機器，CI 也是這樣執行的。

```bash
DOTFILES_SKIP_BOOTSTRAP=1 ./install.sh
```
:::

## 符號連結 {#symlinks}

| 符號連結 | 來源 |
|---|---|
| `~/.zshrc` | `zshrc` |
| `~/.config/zsh/` | `zsh/*` |
| `~/.config/nvim/` | `nvim/*` |
| `~/.tmux.conf` | `tmux/tmux.conf` |
| `~/.tmux.conf.local` | `tmux/tmux.conf.local` |

::: warning 既有檔案會被取代
dotbot 設定使用了 `force: true`，因此既有的 `~/.zshrc`（或上表任何目標）都會被符號連結覆蓋。
請先備份想保留的檔案。
:::

由於這些都是指向儲存庫的符號連結，shell 或編輯器設定的任何變更都會出現在 `git status` 中 ——
包括不是你自己做的變更。

## 儲存庫結構

```
dotfiles/
├── _scripts/
│   ├── init.sh          # Homebrew 套件、Go、Python
│   ├── zsh_init.sh      # oh-my-zsh 與外掛
│   └── nvim_cleanup.sh  # 清除損毀的 Neovim 快取
├── nvim/                # Neovim 設定（Lua）
│   ├── init.lua
│   └── lua/
│       ├── core/        # 選項、快捷鍵、lazy.nvim 初始化
│       └── plugins/     # 每組外掛一個檔案
├── tmux/
│   ├── tmux.conf        # 基礎設定（gpakosz/.tmux）
│   └── tmux.conf.local  # 本機覆寫設定
├── zsh/
│   ├── aliases          # Shell 別名
│   ├── zsh_functions    # Shell 函式
│   ├── load_secrets     # 鑰匙圈機密工具
│   └── secrets.list     # 已儲存機密的名稱
├── website/             # 本文件網站（VitePress）
├── dotbot/              # dotbot 子模組
├── install.conf.yaml    # 符號連結設定
└── install.sh           # 進入點
```

## 下一步

- 開啟 `nvim` —— lazy.nvim 會在第一次啟動時安裝所有外掛。見 [Neovim](/zh-TW/neovim/)。
- 用 `secret-set` 儲存 API 權杖。見[機密管理](./secrets)。
