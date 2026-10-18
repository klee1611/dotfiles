# 機密管理

靜態 API 權杖存放在 **macOS 鑰匙圈**，**每次只交給一個指令**使用。
不會匯出到 shell、不會寫入檔案，也絕不會當作指令參數傳遞。

`zsh/secrets.list`（會提交到 git）只記錄你預期會儲存的機密**名稱**。

## 能用登入就不要存金鑰

如果 CLI 提供登入流程就使用它 —— 這樣就沒有需要保存、可能外洩的長期機密：

| 服務 | 登入方式 |
|---|---|
| Claude Code / Avante | `claude login` |
| AWS | 先執行一次 `aws configure sso`，之後用 `aws sso login`（短期憑證） |
| Google Cloud | `gcloud auth login` 與 `gcloud auth application-default login` |

只有沒有登入流程的權杖（例如 `KAGGLE_API_TOKEN`）才需要放進 `secrets.list`。

## 儲存權杖

```zsh
secret-set KAGGLE_API_TOKEN
```

系統會提示你輸入兩次值（不會顯示在畫面上）。請不要直接把值寫在指令裡 ——
`secret-set NAME value` 會被拒絕，也不會記錄到 shell 歷史中，因為指令參數會留在
`~/.zsh_history`，也能被 `ps` 看到。

## 使用權杖

```zsh
secret-run KAGGLE_API_TOKEN -- python train.py
```

只有該指令（以及它啟動的程式）看得到權杖；你的 shell 永遠拿不到。
在 `--` 前列出多個名稱即可一次注入多個機密。

### 核准對話框

每次讀取都會跳出 macOS 鑰匙圈對話框，要求輸入登入密碼。

- 請選 **允許**，不要選 **永遠允許** —— 「永遠允許」會重新信任 `security`，
  之後的讀取又會變成無聲無息。
- 只在你剛執行需要機密的指令後才核准對話框。對話框顯示的是 `security`，
  而不是實際發出請求的程式，所以突然跳出的對話框可能是其他程式想讀取你的權杖。

## 指令

| 指令 | 說明 |
|---|---|
| `secret-set VAR` | 儲存或取代機密（會提示輸入值） |
| `secret-run VAR... -- cmd` | 執行一個指令，並只在它的環境中提供這些機密 |
| `secret-get VAR` | 印出機密的值 |
| `secret-del VAR` | 從鑰匙圈刪除機密 |
| `secret-list` | 顯示哪些追蹤中的機密已儲存（不會讀取值） |

要新增權杖，把名稱加到 `zsh/secrets.list`，再執行一次 `secret-set` 即可。

## 防護方式

| 威脅 | 防護 |
|---|---|
| 機密出現在檔案或 git 中 | 值只存在鑰匙圈 |
| 機密出現在 shell 歷史或 `ps` | 以提示輸入，絕不當作參數傳遞 |
| 所有程序都繼承到機密 | 不匯出任何機密；`secret-run` 只交給單一指令 |
| 透過 `security` 無聲讀取 | 項目以「無信任應用程式」（`-T ""`）儲存，每次讀取都需核准 |
| 在 `PATH` 上放置偽造的 `security` | 工具以絕對路徑呼叫 `/usr/bin/security` |

::: warning 無法防範的情況
你交出機密的那個指令一定讀得到它 —— 這正是目的。而已經以你的身分執行的惡意程式，
也可以等你核准一次正常的請求。請讓權杖的權限範圍盡量小、可撤銷，
並在懷疑外洩時立即更換。
:::
