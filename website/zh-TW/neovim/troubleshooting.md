# 疑難排解

## Treesitter 解析器錯誤

解析器損毀時，通常會在開啟檔案時出現錯誤：

```bash
./_scripts/nvim_cleanup.sh
nvim   # 下次啟動時會重新安裝解析器
```

這個腳本也會清除 Mason 的 `gopls` 套件，讓它重新乾淨安裝。

## Mason 無法安裝 gopls

gopls 需要可正常運作的 Go 工具鏈：

```bash
go version   # 應顯示 go1.25.7（由 gvm 管理）
go install golang.org/x/tools/gopls@latest
```

## 「client.is_stopped is deprecated」

Neovim 0.11 之後不建議用點號呼叫 LSP client 的方法。copilot-cmp 已無人維護，
仍在使用舊寫法，所以 `basic-plug.lua` 修補了它的原始碼，改用 `client:is_stopped()`。
如果警告再次出現，請執行 `:Lazy sync`，並確認 copilot-cmp 設定中的修補仍然存在。

## Avante 側邊欄沒有反應

- 確認已安裝 ACP 轉接器：`command -v claude-agent-acp`。
- 確認已登入：在終端機執行 `claude` 時不應要求輸入憑證。
- 用 `,ad` 開啟除錯輸出後再試一次。
