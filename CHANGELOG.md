# Changelog

Each version ships as a git tag. Tags are never moved or re-pointed.

## v1.0.2

### Changed

- **`project-create`** (port of canonical 0.5.8): the Phase 2 activation block written into a new draft brief is now a real Continuation Prompt, in the same Date · Mode · Context · Resume from · Key decisions · Blockers · Files touched fields `session-close` writes, with no fenced prompt inside it. The draft carries the Next Action `Review and commit this draft brief (/project-create Phase 2)`, which the prompt names. On commit (Step 6d) that task is checked off and the block is replaced with a **filled** Continuation Prompt whose "Resume from" copies the first open Next Action, instead of an empty template. The leftover-text check (6d step 4b) keeps its two checks, which catch leftovers of both the old and the new block.
- READMEs: install examples updated to `v1.0.2`.

A plain `./install.sh` skips skills you already have: run `./install.sh force` to pick up the updated `project-create`.

## v1.0.1

Safety release. The pack now never edits, opens or prints Claude Code settings files, never adds permission rules, never reads credentials, and never tells Claude to skip permission prompts.

### Removed

- **`extract`**: its batch mode spawned agents in `bypassPermissions` mode (no permission prompts), and its fetch step read an auth token from environment variables or a local `.env` file and ran a third-party package via `bunx`.
- **`permissions`**: it opened and displayed the contents of your `settings.json` files, its example rules allowed broad access (`Bash(git *)`, `Read`, `Write`, `Edit`), and its name collided with Claude Code's built-in `/permissions` screen.

### Renamed

- **`context` → `load-context`**: the old name collided with Claude Code's built-in `/context` command. Behaviour is unchanged: an estimate of context usage plus a summary of the session's topics. Use the built-in `/context` for exact token counts.

### Changed

- **`session-close`** (closeout protocol step 4) and **`retro`** (retrospective protocol step 14): the "permission review" step used to ask whether prompted permissions should be pre-authorized and then edited `.claude/settings.json` or `~/.claude/settings.json`. It is now an observe-only note: Claude may mention commands that prompted often, but never edits, opens or prints a settings file and never adds a rule. If you want a lasting rule, add one exact rule yourself through the built-in `/permissions` screen, and avoid broad wildcard rules.
- **`retro`**: hook proposals are text only; registering a hook is left to the user (built-in `/hooks` screen).
- **`install.sh`**: installs the nine remaining skills. If it finds `context`, `permissions` or `extract` left over from v1.0.0 in `~/.claude/skills/`, it prints a note and leaves them in place. The skip-by-default and `force` behaviour is unchanged.
- READMEs: skill list, count and install examples updated to `v1.0.1`.

## v1.0.0

Initial release: eleven curated starter skills for Claude Code (`session-close`, `context`, `permissions`, `retro`, `extract`, `skill-create`, `project-create`, `deep-research`, `deep-planning`, `fermi-decomposition`, `inbox-clear`) and `install.sh`.
