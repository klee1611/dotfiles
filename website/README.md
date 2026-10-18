# Dotfiles Docs

Source for the documentation site at https://klee1611.github.io/dotfiles/,
built with [VitePress](https://vitepress.dev).

## Local development

```bash
npm install
npm run docs:dev       # live-reloading dev server
npm run docs:build     # production build into .vitepress/dist
npm run docs:preview   # serve the production build
```

## Structure

```
website/
├── .vitepress/config.mts   # Site config: nav, sidebar, search, base path
├── index.md                # Home page
├── guide/                  # Getting started, Zsh, Secrets, Tmux
├── neovim/                 # Neovim overview, AI, troubleshooting
└── zh-TW/                  # Traditional Chinese — mirrors the tree above
```

Add a page by creating a Markdown file and linking it in `sidebar()` in
`.vitepress/config.mts`.

## Translations

English lives at the root; each other language mirrors the same file tree under
its own folder (`zh-TW/`), so the language menu can switch to the same page.
When you add or change a page, update every language — the sidebar is shared,
so a page missing from one language shows a 404 from its sidebar link.

To add a language, copy `zh-TW/`, translate it, and add an entry to `locales`
in `.vitepress/config.mts` with its nav/sidebar labels and UI strings.

## Deployment

`.github/workflows/docs.yml` builds and deploys the site to GitHub Pages on every
push to `master` that touches `website/`. It can also be run manually from the
Actions tab.
