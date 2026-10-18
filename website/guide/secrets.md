# Secrets

Static API tokens live in **macOS Keychain** and are handed to **one command at
a time**. Nothing is exported into your shell, nothing is written to files, and
values are never passed as command arguments.

`zsh/secrets.list` (committed) lists only the **names** you expect to have stored.

## Prefer a login over a stored key

Where a CLI has a login flow, use it — there is no long-lived secret to store or leak:

| Service | Login |
|---|---|
| Claude Code / Avante | `claude login` |
| AWS | `aws configure sso` once, then `aws sso login` (short-lived credentials) |
| Google Cloud | `gcloud auth login` and `gcloud auth application-default login` |

Only tokens with no login flow (for example `KAGGLE_API_TOKEN`) belong in
`secrets.list`.

## Store a token

```zsh
secret-set KAGGLE_API_TOKEN
```

You are prompted for the value twice (hidden). Never type it inline —
`secret-set NAME value` is rejected and kept out of shell history, because
arguments end up in `~/.zsh_history` and are visible to `ps`.

## Use a token

```zsh
secret-run KAGGLE_API_TOKEN -- python train.py
```

Only that command (and whatever it starts) sees the token; your shell never
does. Pass several names before `--` to inject more than one.

### The approval dialog

Every read shows a macOS Keychain dialog asking for your login password.

- Choose **Allow**, not **Always Allow** — "Always Allow" re-trusts `security`
  and makes reads silent again.
- Only approve a dialog right after you ran something that needs a secret.
  The dialog names `security`, not the program that asked, so an unexpected one
  may be something else trying to read your tokens.

## Commands

| Command | Description |
|---|---|
| `secret-set VAR` | Store or replace a secret (prompts for the value) |
| `secret-run VAR... -- cmd` | Run one command with those secrets in its environment |
| `secret-get VAR` | Print a secret's value |
| `secret-del VAR` | Remove a secret from Keychain |
| `secret-list` | Show which tracked secrets are stored (never reads values) |

To add a token, append its name to `zsh/secrets.list` and run `secret-set` once.

## How it is protected

| Threat | Protection |
|---|---|
| Secrets in files or git | Values only ever live in Keychain |
| Secrets in shell history / `ps` | Values are prompted for, never passed as arguments |
| Every process inheriting secrets | Nothing is exported; `secret-run` scopes them to one command |
| Silent reads via `security` | Items are stored with no trusted apps (`-T ""`), so every read needs approval |
| A fake `security` planted on `PATH` | Helpers call `/usr/bin/security` by absolute path |

::: warning What this cannot stop
A command you hand a secret to can read it — that is the point. And malware
already running as your user can wait for you to approve a legitimate request.
Keep tokens scoped and revocable, and rotate any token you suspect was exposed.
:::
