# Tmux

以 [gpakosz/.tmux](https://github.com/gpakosz/.tmux) 為基礎。你自己的修改放在
`tmux/tmux.conf.local`；`tmux/tmux.conf` 是上游的基礎設定。

## 前綴鍵

`Ctrl+b`（tmux 預設）或 `Ctrl+a`（GNU Screen 風格）—— 兩者都可以使用。
下文的 `prefix` 代表其中任一個。

## 快捷鍵

| 按鍵 | 動作 |
|---|---|
| `prefix` `-` | 上下分割窗格 |
| `prefix` `\|` | 左右分割窗格 |
| `prefix` `h` `j` `k` `l` | 移到左／下／上／右方的窗格 |
| `prefix` `H` `J` `K` `L` | 調整窗格大小 |
| `prefix` `<` / `>` | 與上一個／下一個窗格交換 |
| `prefix` `+` | 將窗格最大化到新視窗（切換） |
| `prefix` `n` / `p` | 下一個／上一個視窗 |
| `prefix` `Tab` | 上一個使用的視窗 |
| `prefix` `m` | 切換滑鼠模式 |
| `prefix` `e` | 編輯 `~/.tmux.conf.local` 並重新載入 |
| `prefix` `r` | 重新載入設定 |
| `prefix` `P` | 選擇要貼上的緩衝區 |

::: info `p` 是上一個視窗
基礎設定把 `prefix p` 設為貼上；`tmux.conf.local` 把它改回「上一個視窗」，
與 `n` 成對。要貼上請用 `prefix P`（選擇緩衝區）。
:::

## 滑鼠與複製模式

- 已啟用滑鼠支援：點擊切換窗格、拖曳邊框調整大小、滾動即進入複製模式。
- 複製模式使用 vi 按鍵。選取文字後按 `Enter`（或放開滑鼠拖曳），
  就會透過 `pbcopy` 複製到 macOS 剪貼簿。
