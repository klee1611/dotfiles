# Neovim

**Plugin manager:** [lazy.nvim](https://github.com/folke/lazy.nvim) ·
**Leader key:** `,` · **Theme:** onedark

## First launch

```bash
nvim   # lazy.nvim installs every plugin automatically
```

Mason installs the LSP servers, formatters, linters and debug adapters listed
below on startup. Open `:Mason` to check their status or add more.

## Key mappings

### Files and search

| Key | Action |
|---|---|
| `F2` | Toggle file explorer (nvim-tree) |
| `,f` | Refresh file explorer |
| `,n` | Reveal current file in explorer |
| `F3` | Toggle code outline (aerial) |
| `,ff` | File browser (Telescope) |
| `,fg` | Live grep (Telescope) |
| `,fb` | Buffers (Telescope) |
| `,fh` | Help tags (Telescope) |

### LSP

Available in buffers with an attached language server.

| Key | Action |
|---|---|
| `gd` / `gD` | Go to definition / declaration |
| `gi` | Go to implementation |
| `gr` | Find references |
| `K` | Hover documentation |
| `Space rn` | Rename symbol |
| `Space f` | Format buffer |
| `Space df` | Jump to next diagnostic |

### Windows, tabs and terminal

| Key | Action |
|---|---|
| `,t` | Save, then open a terminal in a split |
| `Ctrl+↑` / `Ctrl+↓` | Increase / decrease split height |
| `Ctrl+←` / `Ctrl+→` | Decrease / increase split width |
| `tc` / `tk` | New / close tab |
| `tn` / `tp` | Next / previous tab |
| `t1` … `t9`, `t0` | Jump to tab 1–9, 10 |

::: tip
In a terminal split, press `Ctrl+\` `Ctrl+n` to return to normal mode before
resizing or switching windows.
:::

AI keymaps are on the [AI page](./ai).

## Language tooling

Installed by Mason (`nvim/lua/plugins/utils/common.lua`):

| Kind | Tools |
|---|---|
| LSP | bashls, clangd, denols, basedpyright, rust_analyzer, gopls, lua_ls, elixirls, eslint |
| Formatters ([conform.nvim](https://github.com/stevearc/conform.nvim)) | prettier (JS/TS, CSS, HTML, JSON, YAML, Markdown, GraphQL), stylua, ruff |
| Linters ([nvim-lint](https://github.com/mfussenegger/nvim-lint)) | eslint_d (JS/TS/Svelte), ruff + mypy (Python) |
| Debug adapters ([nvim-dap](https://github.com/mfussenegger/nvim-dap)) | js-debug-adapter |

## Plugins

| Plugin | Purpose |
|---|---|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
| [mason.nvim](https://github.com/williamboman/mason.nvim) + mason-lspconfig, mason-tool-installer, mason-nvim-dap | Install LSP servers, formatters, linters, debug adapters |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP server configs |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) + LuaSnip | Completion (LSP, Copilot, snippets, buffer, path, cmdline) |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Formatting |
| [nvim-lint](https://github.com/mfussenegger/nvim-lint) | Linting |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) + nvim-dap-ui | Debugger |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) + file-browser | Fuzzy finder |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | File explorer |
| [aerial.nvim](https://github.com/stevearc/aerial.nvim) | Code outline |
| [vim-fugitive](https://github.com/tpope/vim-fugitive), [vim-flog](https://github.com/rbong/vim-flog) | Git commands and commit graph |
| [copilot.lua](https://github.com/zbirenbaum/copilot.lua) + copilot-cmp | GitHub Copilot suggestions in completion |
| [CopilotChat.nvim](https://github.com/CopilotC-Nvim/CopilotChat.nvim) | Copilot chat |
| [avante.nvim](https://github.com/yetone/avante.nvim) | AI sidebar driving Claude Code — see [AI](./ai) |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Status line |
| [alpha-nvim](https://github.com/goolord/alpha-nvim) | Start screen |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Indent guides |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-close brackets and quotes |
| [markview.nvim](https://github.com/OXY2DEV/markview.nvim) | Markdown rendering |
| [nvim-remote-containers](https://github.com/jamestthompson3/nvim-remote-containers) | Dev container support |
