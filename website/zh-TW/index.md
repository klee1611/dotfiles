---
layout: home

hero:
  name: Dotfiles
  text: 一個指令建好 macOS 開發環境
  tagline: Neovim、Zsh 與 Tmux —— 透過 dotbot 自動安裝、設定並建立符號連結。
  actions:
    - theme: brand
      text: 快速開始
      link: /zh-TW/guide/getting-started
    - theme: alt
      text: Neovim 快捷鍵
      link: /zh-TW/neovim/
    - theme: alt
      text: 在 GitHub 上查看
      link: https://github.com/klee1611/dotfiles

features:
  - icon: ⚡
    title: 一鍵安裝
    details: install.sh 會安裝 Homebrew 套件、語言版本管理工具與 oh-my-zsh，再用 dotbot 為所有設定檔建立符號連結。
  - icon: 📝
    title: Neovim IDE
    details: lazy.nvim、透過 Mason 安裝的 LSP、自動補全、格式化、程式碼檢查、除錯、Telescope 與檔案樹。
  - icon: 🤖
    title: 在編輯器中使用 Claude Code
    details: avante.nvim 透過 ACP 驅動本機的 Claude Code CLI —— 同一個代理、同一個登入，不需要 API 金鑰。
  - icon: 🔐
    title: 不匯出的機密管理
    details: 靜態權杖存放在 macOS 鑰匙圈，每次只交給單一指令使用，且讀取前需要你核准。
  - icon: 🐚
    title: 快速的 Zsh
    details: oh-my-zsh 搭配補全、語法高亮與自動建議；nvm 與 gvm 皆為延遲載入。
  - icon: 🖥️
    title: Tmux
    details: 以 gpakosz/.tmux 為基礎，支援滑鼠、vi 複製模式與系統剪貼簿。
---
