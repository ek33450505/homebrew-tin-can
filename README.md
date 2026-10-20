# homebrew-tin-can

Homebrew tap for [tin-can](https://github.com/ek33450505/tin-can) — hand an AI coding session off to a fresh terminal tab.

## Install

```bash
brew tap ek33450505/tin-can
brew install tin-can
tin-can --version
```

Or in one step:

```bash
brew install ek33450505/tin-can/tin-can
```

The formula puts `tin-can` on your PATH. The Claude Code plugin is separate and optional; see the [tin-can README](https://github.com/ek33450505/tin-can#readme) for how to install it.

Requirements: tin-can starts an agent CLI by name, so `claude` (Claude Code) or `codex` must be on your PATH. It runs on the bash that ships with macOS (3.2) or newer.

## Uninstall

```bash
rm -f ~/.claude/skills/tin-can   # only if you linked the skill (removes the link only)
brew uninstall tin-can
brew untap ek33450505/tin-can
```

## See also

- [tin-can](https://github.com/ek33450505/tin-can) — source repo
