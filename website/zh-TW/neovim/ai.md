# AI：透過 Avante 使用 Claude Code

`nvim/lua/plugins/ai.lua` 讓 [avante.nvim](https://github.com/yetone/avante.nvim)
透過 [ACP](https://agentclientprotocol.com)（Agent Client Protocol）連到本機的 Claude Code CLI。
側邊欄執行的就是你在終端機用的 `claude` —— 相同的工具、相同的對話紀錄、相同的
`claude login` 憑證。**不需要 API 金鑰。**

## 設定（只需一次）

```bash
npm install -g @agentclientprotocol/claude-agent-acp
claude login   # 如果還沒登入
```

::: info 為什麼不設定 `ANTHROPIC_API_KEY`
這裡刻意不把 `ANTHROPIC_API_KEY` 交給代理。一旦設定，Claude Code 會優先使用它而不是你的登入，
費用就會改由 API 帳戶支付。
:::

## 快捷鍵

Leader 鍵是 `,`。

| 按鍵 | 動作 |
|---|---|
| `,aa` | 提問 —— 開啟側邊欄並向 Claude Code 下指令 |
| `,an` | 新對話 |
| `,at` | 開關側邊欄 |
| `,af` | 聚焦側邊欄 |
| `,az` | 禪模式（全螢幕，類似 CLI） |
| `,ae` | 直接編輯視覺模式選取的內容 |
| `,aS` | 停止執行中的代理 |
| `,ar` | 重新整理側邊欄 |
| `,ac` | 把目前緩衝區加入上下文 |
| `,aB` | 把所有開啟的緩衝區加入上下文 |
| `,ah` | 瀏覽對話紀錄 |
| `,aM` | 選擇 Claude Code 模型 |
| `,am` | 選擇權限模式（`default`、`acceptEdits`、`plan`、`auto`、`bypassPermissions`） |
| `,aC` | 開關選取提示 |
| `,as` | 開關行內建議 |
| `,ad` | 開關除錯輸出 |
| `,aR` | 開關儲存庫地圖 |

### 側邊欄內

| 按鍵 | 動作 |
|---|---|
| `Enter` / `Ctrl+s` | 送出（一般模式／插入模式） |
| `Tab` / `Shift+Tab` | 在輸入與回應視窗間切換 |
| `Shift+Tab` | 展開工具使用區塊 |
| `A` / `a` | 套用全部差異／游標所在的差異 |
| `r` / `e` | 重試／編輯上一個請求 |
| `@` / `d` | 加入／移除上下文檔案 |
| `x` | 開關程式碼視窗 |
| `q` | 關閉側邊欄 |

### 檢視差異

| 按鍵 | 動作 |
|---|---|
| `]x` / `[x` | 下一個／上一個衝突 |
| `co` / `ct` | 保留我方／對方 |
| `ca` / `cb` / `cc` | 全部保留對方／兩者都保留／保留游標所在區塊 |

## 直接呼叫 API 的備援（選用）

`:AvanteSwitchProvider claude` 會繞過 Claude Code，直接呼叫 Anthropic HTTP API。
這需要 API 金鑰，只在使用時才從鑰匙圈讀取：

```zsh
secret-set ANTHROPIC_API_KEY
```

`:AvanteSwitchProvider claude-code` 可切回 ACP。請見[機密管理](/zh-TW/guide/secrets)。

## Copilot

GitHub Copilot 的建議會出現在補全選單中（copilot.lua + copilot-cmp），
也可以使用 [CopilotChat.nvim](https://github.com/CopilotC-Nvim/CopilotChat.nvim) 對話。
第一次使用請執行 `:Copilot auth` 登入。
