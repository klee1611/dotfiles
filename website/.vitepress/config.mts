import { defineConfig, type DefaultTheme } from 'vitepress'

const repo = 'https://github.com/klee1611/dotfiles'

// Pages exist in every locale under the same path, so nav and sidebar are
// built from one list per locale: `prefix` is '' for English, '/zh-TW' for
// Traditional Chinese.
function nav(prefix: string, t: { guide: string; neovim: string }): DefaultTheme.NavItem[] {
  return [
    { text: t.guide, link: `${prefix}/guide/getting-started`, activeMatch: `${prefix}/guide/` },
    { text: t.neovim, link: `${prefix}/neovim/`, activeMatch: `${prefix}/neovim/` },
  ]
}

function sidebar(
  prefix: string,
  t: {
    guide: string
    gettingStarted: string
    zsh: string
    secrets: string
    tmux: string
    neovim: string
    overview: string
    ai: string
    troubleshooting: string
  },
): DefaultTheme.SidebarItem[] {
  return [
    {
      text: t.guide,
      items: [
        { text: t.gettingStarted, link: `${prefix}/guide/getting-started` },
        { text: t.zsh, link: `${prefix}/guide/zsh` },
        { text: t.secrets, link: `${prefix}/guide/secrets` },
        { text: t.tmux, link: `${prefix}/guide/tmux` },
      ],
    },
    {
      text: t.neovim,
      items: [
        { text: t.overview, link: `${prefix}/neovim/` },
        { text: t.ai, link: `${prefix}/neovim/ai` },
        { text: t.troubleshooting, link: `${prefix}/neovim/troubleshooting` },
      ],
    },
  ]
}

const coffee = '<a href="https://www.buymeacoffee.com/klee1611">Buy me a coffee ☕</a>'

export default defineConfig({
  title: 'Dotfiles',
  // Served from https://klee1611.github.io/dotfiles/
  base: '/dotfiles/',
  cleanUrls: true,
  lastUpdated: true,

  head: [
    ['link', { rel: 'icon', type: 'image/svg+xml', href: '/dotfiles/favicon.svg' }],
    ['meta', { name: 'theme-color', content: '#3c8772' }],
  ],

  locales: {
    root: {
      label: 'English',
      lang: 'en-US',
      description: 'Automated macOS development environment: Neovim, Zsh and Tmux',
      themeConfig: {
        nav: nav('', { guide: 'Guide', neovim: 'Neovim' }),
        sidebar: sidebar('', {
          guide: 'Guide',
          gettingStarted: 'Getting Started',
          zsh: 'Zsh',
          secrets: 'Secrets',
          tmux: 'Tmux',
          neovim: 'Neovim',
          overview: 'Overview & Keymaps',
          ai: 'AI: Claude Code via Avante',
          troubleshooting: 'Troubleshooting',
        }),
        editLink: {
          pattern: `${repo}/edit/master/website/:path`,
          text: 'Edit this page on GitHub',
        },
        footer: {
          message: 'Released under the MIT License.',
          copyright: `Like it? ${coffee}`,
        },
      },
    },

    'zh-TW': {
      label: '繁體中文',
      lang: 'zh-TW',
      link: '/zh-TW/',
      description: '一鍵自動化的 macOS 開發環境：Neovim、Zsh 與 Tmux',
      themeConfig: {
        nav: nav('/zh-TW', { guide: '指南', neovim: 'Neovim' }),
        sidebar: sidebar('/zh-TW', {
          guide: '指南',
          gettingStarted: '快速開始',
          zsh: 'Zsh',
          secrets: '機密管理',
          tmux: 'Tmux',
          neovim: 'Neovim',
          overview: '總覽與快捷鍵',
          ai: 'AI：透過 Avante 使用 Claude Code',
          troubleshooting: '疑難排解',
        }),
        editLink: {
          pattern: `${repo}/edit/master/website/:path`,
          text: '在 GitHub 上編輯此頁',
        },
        footer: {
          message: '以 MIT 授權條款釋出。',
          copyright: `喜歡嗎？${coffee}`,
        },
        outline: { level: [2, 3], label: '本頁目錄' },
        docFooter: { prev: '上一頁', next: '下一頁' },
        lastUpdated: { text: '最後更新' },
        returnToTopLabel: '回到頂端',
        sidebarMenuLabel: '選單',
        darkModeSwitchLabel: '外觀',
        lightModeSwitchTitle: '切換為淺色模式',
        darkModeSwitchTitle: '切換為深色模式',
        langMenuLabel: '切換語言',
        notFound: {
          title: '找不到頁面',
          quote: '這個頁面不存在，可能已被移動或刪除。',
          linkLabel: '回到首頁',
          linkText: '回到首頁',
        },
      },
    },
  },

  themeConfig: {
    socialLinks: [{ icon: 'github', link: repo }],
    outline: [2, 3],
    search: {
      provider: 'local',
      options: {
        locales: {
          'zh-TW': {
            translations: {
              button: { buttonText: '搜尋', buttonAriaLabel: '搜尋' },
              modal: {
                displayDetails: '顯示詳細清單',
                resetButtonTitle: '清除搜尋',
                backButtonTitle: '關閉搜尋',
                noResultsText: '找不到相關結果',
                footer: {
                  selectText: '選擇',
                  selectKeyAriaLabel: 'Enter',
                  navigateText: '切換',
                  navigateUpKeyAriaLabel: '上',
                  navigateDownKeyAriaLabel: '下',
                  closeText: '關閉',
                  closeKeyAriaLabel: 'Esc',
                },
              },
            },
          },
        },
      },
    },
  },
})
