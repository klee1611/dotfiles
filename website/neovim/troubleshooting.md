# Troubleshooting

## Treesitter parser errors

Corrupted parsers usually show up as errors when opening a file:

```bash
./_scripts/nvim_cleanup.sh
nvim   # parsers are reinstalled on next launch
```

The script also clears Mason's `gopls` package so it is reinstalled cleanly.

## Mason fails to install gopls

gopls needs a working Go toolchain:

```bash
go version   # should report go1.25.7 (managed by gvm)
go install golang.org/x/tools/gopls@latest
```

## "client.is_stopped is deprecated"

Neovim 0.11+ deprecates calling LSP client methods with a dot. copilot-cmp is
unmaintained and still does, so `basic-plug.lua` patches its source to use
`client:is_stopped()`. If the warning returns, run `:Lazy sync` and check that
the patch in the copilot-cmp spec is still present.

## Avante sidebar does nothing

- Check the ACP adapter is installed: `command -v claude-agent-acp`.
- Check you are logged in: `claude` in a terminal should start without asking
  for credentials.
- Toggle debug output with `,ad` and retry.
