# AI: Claude Code via Avante

`nvim/lua/plugins/ai.lua` points [avante.nvim](https://github.com/yetone/avante.nvim)
at the local Claude Code CLI over [ACP](https://agentclientprotocol.com) (Agent
Client Protocol). The sidebar runs the same agent as `claude` in your terminal —
same tools, same session history, same `claude login` credentials. **No API key
required.**

## Setup (once)

```bash
npm install -g @agentclientprotocol/claude-agent-acp
claude login   # if you have not already
```

::: info Why no `ANTHROPIC_API_KEY`
The agent is deliberately not given `ANTHROPIC_API_KEY`. If it were set, Claude
Code would use it instead of your login and bill the API account.
:::

## Keymaps

Leader is `,`.

| Key | Action |
|---|---|
| `,aa` | Ask — open the sidebar and prompt Claude Code |
| `,an` | New conversation |
| `,at` | Toggle the sidebar |
| `,af` | Focus the sidebar |
| `,az` | Zen mode (full-screen, CLI-like) |
| `,ae` | Edit the visual selection in place |
| `,aS` | Stop the running agent |
| `,ar` | Refresh the sidebar |
| `,ac` | Add the current buffer as context |
| `,aB` | Add all open buffers as context |
| `,ah` | Browse conversation history |
| `,aM` | Pick the Claude Code model |
| `,am` | Pick the permission mode (`default`, `acceptEdits`, `plan`, `auto`, `bypassPermissions`) |
| `,aC` | Toggle selection hints |
| `,as` | Toggle inline suggestions |
| `,ad` | Toggle debug output |
| `,aR` | Toggle the repo map |

### Inside the sidebar

| Key | Action |
|---|---|
| `Enter` / `Ctrl+s` | Submit (normal / insert mode) |
| `Tab` / `Shift+Tab` | Switch between input and response windows |
| `Shift+Tab` | Expand a tool-use block |
| `A` / `a` | Apply all diffs / the diff at the cursor |
| `r` / `e` | Retry / edit your last request |
| `@` / `d` | Add / remove a context file |
| `x` | Toggle the code window |
| `q` | Close the sidebar |

### Reviewing diffs

| Key | Action |
|---|---|
| `]x` / `[x` | Next / previous conflict |
| `co` / `ct` | Keep ours / theirs |
| `ca` / `cb` / `cc` | Keep all theirs / both / the block at the cursor |

## Direct-API fallback (optional)

`:AvanteSwitchProvider claude` talks to the Anthropic HTTP API directly instead
of through Claude Code. It needs an API key, read from Keychain only when used:

```zsh
secret-set ANTHROPIC_API_KEY
```

`:AvanteSwitchProvider claude-code` returns to ACP. See [Secrets](/guide/secrets).

## Copilot

GitHub Copilot suggestions appear in the completion menu (copilot.lua +
copilot-cmp), and [CopilotChat.nvim](https://github.com/CopilotC-Nvim/CopilotChat.nvim)
is available for chat. Run `:Copilot auth` once to sign in.
