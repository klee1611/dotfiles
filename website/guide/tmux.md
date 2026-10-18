# Tmux

Based on [gpakosz/.tmux](https://github.com/gpakosz/.tmux). Your own changes go
in `tmux/tmux.conf.local`; `tmux/tmux.conf` is the upstream base.

## Prefix

`Ctrl+b` (tmux default) or `Ctrl+a` (GNU Screen style) — both work.
Below, `prefix` means either.

## Key bindings

| Keys | Action |
|---|---|
| `prefix` `-` | Split into top / bottom panes |
| `prefix` `\|` | Split into side-by-side panes |
| `prefix` `h` `j` `k` `l` | Move to the pane left / down / up / right |
| `prefix` `H` `J` `K` `L` | Resize the pane |
| `prefix` `<` / `>` | Swap with the previous / next pane |
| `prefix` `+` | Maximize the pane into a new window (toggle) |
| `prefix` `n` / `p` | Next / previous window |
| `prefix` `Tab` | Last active window |
| `prefix` `m` | Toggle mouse mode |
| `prefix` `e` | Edit `~/.tmux.conf.local` and reload |
| `prefix` `r` | Reload the config |
| `prefix` `P` | Choose a buffer to paste |

::: info `p` is previous-window
The base config binds `prefix p` to paste; `tmux.conf.local` restores it to
previous-window to pair with `n`. Paste with `prefix P` (choose buffer).
:::

## Mouse and copy mode

- Mouse support is on: click to focus panes, drag borders to resize, scroll to
  enter copy mode.
- Copy mode uses vi keys. Select text and press `Enter` (or release a mouse
  drag) to copy it to the macOS clipboard via `pbcopy`.
