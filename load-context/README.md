# load-context

> Estimate context window usage, list the session's topics, and say whether to compact

**Version:** 0.0.3

Renamed from `context` in v1.0.1: that name collided with Claude Code's built-in `/context` command, which shows exact token usage. This skill gives a quick estimate plus a summary of what the session covered.

## Installation

This skill ships as part of **cc-starter-pack**. Install the pack, not the skill:

```bash
git clone --depth 1 --branch v1.0.1 https://github.com/AI-Acceleration/cc-starter-pack.git
cd cc-starter-pack
./install.sh
```

**Updating an existing install:** a plain `./install.sh` **skips** every skill you already have and reports nothing wrong, so an update silently does nothing. Run `./install.sh force` to overwrite your copies with the current versions.

## Usage

Invoke in Claude Code:

```
/load-context
```

## Files

- `SKILL.md`

