# cc-starter-pack

Curated Claude Code skills for members of the **AI Acceleration Club**. Nine skills that bootstrap you into productive workflow patterns from day one — no paid API keys, minimal setup, and every dependency explicitly declared.

This is **Tier A+** of the Member Starter-Pack Initiative. Tier B (14 additional skills including `/meeting-minutes`, `/last30days`, `/weekly-review`) ships after Tier A proves out.

> **Used by the AIAC Facilitator Pack.** This is the starter skills pack that the [AIAC Facilitator Pack](https://github.com/AI-Acceleration/aiac-facilitator-pack) installs during participant setup. The kit pins it by **tag** (currently `v1.0.1`), never by branch, so a kit run always gets the same files. Raw file URLs take the form `https://raw.githubusercontent.com/AI-Acceleration/cc-starter-pack/v1.0.1/<path>`. New versions ship as new tags; tags are never moved or re-pointed, so `v1.0.0` still resolves to its original files. See [`CHANGELOG.md`](CHANGELOG.md) for what changed between tags.

---

## What's Inside

| Skill | Purpose | External Setup |
|---|---|---|
| **`/session-close`** | Close sessions cleanly — update project briefs, run retro eval, log state for cross-session recovery | `git` + `jq` |
| **`/load-context`** | Estimate context window usage, list the session's topics, and flag when to compact (Claude Code's built-in `/context` shows exact numbers) | — |
| **`/retro`** | Run a retrospective routed by session mode (Programming or Vault Management) | — |
| **`/skill-create`** | Guided interactive creation of new Claude Code skills | — |
| **`/project-create`** | Create a Project or Program brief with research, Q&A, and cross-linking | — |
| **`/deep-research`** | Four-phase research pipeline: broad sweep → deep dive → synthesis → brief | — |
| **`/deep-planning`** | Mode-based planning pipeline (Quick / Build / Strategic) that orchestrates brainstorm → plan before you build | Superpowers + Compound Engineering plugins; `/last30days` optional |
| **`/fermi-decomposition`** | Break "immeasurable" quantities into estimable factors (market sizing, cost/deal estimation) — *How To Measure Anything* method | — |
| **`/inbox-clear`** | Clear your inbox with the GTD decision tree — classify every item, approve each move by checkbox | — |

No skill in this pack edits, opens or prints your Claude Code settings files, adds permission rules, reads credentials, or tells Claude to skip permission prompts. If you want a lasting permission rule, add one exact rule yourself through Claude Code's built-in `/permissions` screen.

Every `SKILL.md` in this repo declares its dependencies per the [Skill Dependencies Declaration convention](#dependencies-convention). Open any SKILL.md and scroll to `## Dependencies` to see exactly what the skill needs, what's optional, and what it explicitly does **not** require.

---

## Install

### Option A — Copy (recommended)

```bash
git clone --depth 1 --branch v1.0.1 https://github.com/AI-Acceleration/cc-starter-pack.git
cd cc-starter-pack
./install.sh
```

This copies each skill directory into `~/.claude/skills/`. Restart Claude Code and the skills appear in your skill list.

### Option B — Symlink (live updates via `git pull`)

```bash
git clone https://github.com/AI-Acceleration/cc-starter-pack.git ~/cc-starter-pack
cd ~/cc-starter-pack
./install.sh symlink
```

Later, `cd ~/cc-starter-pack && git pull` updates all skills in place. This option follows `main` rather than a pinned tag, so you get changes as they land.

### Option C — Manual

Copy any individual skill directory into `~/.claude/skills/<skill-name>/`. No install script required.

### Upgrading from v1.0.0

A plain `./install.sh` skips every skill you already have, so run `./install.sh force` to pick up the updated `session-close` and `retro`. v1.0.1 dropped `extract` and `permissions` and renamed `context` to `load-context`; the installer never deletes them, it only prints a note if it finds them in `~/.claude/skills/`. Delete those folders yourself if you no longer want them. See [`CHANGELOG.md`](CHANGELOG.md).

After any install method: **restart Claude Code**, then verify with `/load-context` — if it runs, you're set.

---

## External Dependencies

Only one skill has external CLI requirements:

### `/session-close` needs `jq` + `git`

- **macOS**: `brew install jq`
- **Windows**: `choco install jq` or `winget install jqlang.jq`
- **Linux**: `apt install jq` / `dnf install jq`
- **Git** is pre-installed on most systems; if missing, install from https://git-scm.com (Windows) or run `xcode-select --install` (macOS).

If `jq` is absent, `/session-close` still runs — it just skips appending to the session-log ledger and continues normally. If `git` is absent, the Phase 2.5 Infrastructure Version Control check silently skips when no `.git` directory is present in your working tree.

### All other skills work out of the box

`/load-context`, `/retro`, `/skill-create`, `/project-create`, `/deep-research` depend only on Claude Code's built-in tools (Read, Write, Edit, WebSearch, WebFetch, Grep, Glob, Bash, AskUserQuestion).

---

## Vault-Aware Skills (Optional Context)

Three skills reference a **PARA-style Obsidian vault** (`Projects/`, `Areas/`, `Resources/`, `Archives/`, `Inbox/`):

- `/session-close` — updates project briefs, Area MOCs, Program briefs
- `/retro` — reads protocol files from your vault's Claude Code resources folder (see `retro/SKILL.md` for the exact path convention)
- `/project-create` — writes drafts to your inbox folder, commits to `Projects/`

**If you did the Phase 0 Obsidian vault setup**, the vault paths resolve automatically and these skills run end-to-end.

**If you don't have the vault set up**, the skills still run but degrade gracefully:
- `/session-close` skips vault-specific phases (brief updates, Area MOCs, inbox sweep) and only runs the mode-agnostic parts (Deep Work detection, session log, retro evaluation).
- `/retro` falls back to its `_bundled/protocols/` copies of the retrospective protocols (included in this repo).
- `/project-create` writes drafts to wherever you run it from.

The `_bundled/protocols/` directories inside `/session-close/` and `/retro/` contain local copies of the canonical vault protocol docs, so those two skills don't hard-break in a vaultless environment.

---

## Dependencies Convention

Every SKILL.md in this repo has a `## Dependencies` section with four sub-sections:

- **Required** — what MUST be present for the skill to run
- **Optional** — what the skill uses if available, with explicit fallback behavior if not
- **Vault Conventions** — PARA conventions, linking rules, etc. the skill applies
- **Does NOT Require** — explicit anti-dependencies (useful when you might assume a dep exists)

Category labels used for machine parsing: `plugin`, `mcp`, `cli`, `desktop-app`, `python-package`, `node-package`, `external-service`, `shared-node`, `helper-script`, `protocol-doc`, `vault-convention`.

Reading any SKILL.md tells you exactly what it needs — no cross-referencing, no surprise runtime failures. If a skill doesn't have a `## Dependencies` section in this repo, it's a bug — file an issue.

---

## What's in Each Skill Directory

Most skills are a single `SKILL.md` file. A few ship with bundled dependency fallbacks:

- **`session-close/`** — SKILL.md + `_bundled/nodes/` (brief-updater.md, people-resolver.md) + `_bundled/protocols/` (session-closeout-protocol.md)
- **`retro/`** — SKILL.md + `_bundled/protocols/` (retrospective-protocol.md, vault-self-improvement-protocol.md)

The `_bundled/` directories follow the "vault → bundled → skip" resolution pattern — Claude Code tries the vault path first, falls back to the bundled copy if the vault isn't set up, and skips gracefully if neither is available.

---

## Support

- **Issues**: https://github.com/AI-Acceleration/cc-starter-pack/issues
- **Questions**: Ask your facilitator, or in your cohort's support channel

Part of the **AI Acceleration Club Member Starter-Pack Initiative** (2026-04-22).

---

## License

MIT — see `LICENSE`.
