# Neovim

**外掛管理器：**[lazy.nvim](https://github.com/folke/lazy.nvim) ·
**Leader 鍵：**`,` · **主題：**onedark

## 第一次啟動

```bash
nvim   # lazy.nvim 會自動安裝所有外掛
```

Mason 會在啟動時安裝下方列出的 LSP 伺服器、格式化工具、程式碼檢查工具與除錯轉接器。
開啟 `:Mason` 可查看狀態或安裝更多工具。

## 快捷鍵

### 檔案與搜尋

| 按鍵 | 動作 |
|---|---|
| `F2` | 開關檔案總管（nvim-tree） |
| `,f` | 重新整理檔案總管 |
| `,n` | 在檔案總管中定位目前檔案 |
| `F3` | 開關程式碼大綱（aerial） |
| `,ff` | 檔案瀏覽器（Telescope） |
| `,fg` | 即時全文搜尋（Telescope） |
| `,fb` | 緩衝區清單（Telescope） |
| `,fh` | 說明標籤（Telescope） |

### LSP

在已連接語言伺服器的緩衝區中可用。

| 按鍵 | 動作 |
|---|---|
| `gd` / `gD` | 跳到定義／宣告 |
| `gi` | 跳到實作 |
| `gr` | 尋找參照 |
| `K` | 顯示懸停說明文件 |
| `Space rn` | 重新命名符號 |
| `Space f` | 格式化緩衝區 |
| `Space df` | 跳到下一個診斷訊息 |

### 視窗、分頁與終端機

| 按鍵 | 動作 |
|---|---|
| `,t` | 存檔後在分割視窗中開啟終端機 |
| `Ctrl+↑` / `Ctrl+↓` | 增加／減少分割視窗高度 |
| `Ctrl+←` / `Ctrl+→` | 減少／增加分割視窗寬度 |
| `tc` / `tk` | 新增／關閉分頁 |
| `tn` / `tp` | 下一個／上一個分頁 |
| `t1` … `t9`、`t0` | 跳到第 1–9、10 個分頁 |

::: tip
在終端機分割視窗中，先按 `Ctrl+\` `Ctrl+n` 回到一般模式，再調整大小或切換視窗。
:::

AI 相關快捷鍵請見 [AI 頁面](./ai)。

## 語言工具

由 Mason 安裝（`nvim/lua/plugins/utils/common.lua`）：

| 類別 | 工具 |
|---|---|
| LSP | bashls、clangd、denols、basedpyright、rust_analyzer、gopls、lua_ls、elixirls、eslint |
| 格式化（[conform.nvim](https://github.com/stevearc/conform.nvim)） | prettier（JS/TS、CSS、HTML、JSON、YAML、Markdown、GraphQL）、stylua、ruff |
| 程式碼檢查（[nvim-lint](https://github.com/mfussenegger/nvim-lint)） | eslint_d（JS/TS/Svelte）、ruff + mypy（Python） |
| 除錯轉接器（[nvim-dap](https://github.com/mfussenegger/nvim-dap)） | js-debug-adapter |

## 外掛

| 外掛 | 用途 |
|---|---|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | 外掛管理器 |
| [mason.nvim](https://github.com/williamboman/mason.nvim) + mason-lspconfig、mason-tool-installer、mason-nvim-dap | 安裝 LSP 伺服器、格式化與檢查工具、除錯轉接器 |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP 伺服器設定 |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) + LuaSnip | 自動補全（LSP、Copilot、程式碼片段、緩衝區、路徑、指令列） |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | 語法高亮 |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | 格式化 |
| [nvim-lint](https://github.com/mfussenegger/nvim-lint) | 程式碼檢查 |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) + nvim-dap-ui | 除錯器 |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) + file-browser | 模糊搜尋 |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | 檔案總管 |
| [aerial.nvim](https://github.com/stevearc/aerial.nvim) | 程式碼大綱 |
| [vim-fugitive](https://github.com/tpope/vim-fugitive)、[vim-flog](https://github.com/rbong/vim-flog) | Git 指令與提交圖 |
| [copilot.lua](https://github.com/zbirenbaum/copilot.lua) + copilot-cmp | 在補全選單中顯示 GitHub Copilot 建議 |
| [CopilotChat.nvim](https://github.com/CopilotC-Nvim/CopilotChat.nvim) | Copilot 對話 |
| [avante.nvim](https://github.com/yetone/avante.nvim) | 驅動 Claude Code 的 AI 側邊欄 —— 見 [AI](./ai) |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | 狀態列 |
| [alpha-nvim](https://github.com/goolord/alpha-nvim) | 啟動畫面 |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | 縮排參考線 |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | 自動補上括號與引號 |
| [markview.nvim](https://github.com/OXY2DEV/markview.nvim) | Markdown 預覽渲染 |
| [nvim-remote-containers](https://github.com/jamestthompson3/nvim-remote-containers) | 開發容器支援 |
