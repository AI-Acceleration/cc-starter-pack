#!/usr/bin/env bash
# Install cc-starter-pack skills into ~/.claude/skills/
# Usage:
#   ./install.sh           -> copy skills, skip any already installed (recommended)
#   ./install.sh force      -> overwrite (use to pick up updated skills)
#   ./install.sh symlink   -> symlink (live updates via git pull)
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="$HOME/.claude/skills"
mkdir -p "$TARGET"
SKILLS="session-close load-context retro skill-create project-create deep-research deep-planning fermi-decomposition inbox-clear"
# Removed or renamed in v1.0.1. Never deleted automatically; the user is told and decides.
RETIRED="context permissions extract"
MODE="${1:-copy}"
for s in $SKILLS; do
  if [[ -e "$TARGET/$s" && "$MODE" != "force" ]]; then
    echo "SKIP: $TARGET/$s already exists — run './install.sh force' to overwrite, or remove manually"
    continue
  fi
  [[ "$MODE" == "force" && -e "$TARGET/$s" ]] && rm -rf "$TARGET/$s"
  if [[ "$MODE" == "symlink" ]]; then
    ln -s "$SCRIPT_DIR/$s" "$TARGET/$s"
    echo "symlinked: $TARGET/$s"
  else
    cp -r "$SCRIPT_DIR/$s" "$TARGET/$s"
    echo "copied: $TARGET/$s"
  fi
done
for s in $RETIRED; do
  if [[ -e "$TARGET/$s" ]]; then
    echo "NOTE: $TARGET/$s may be left over from cc-starter-pack v1.0.0; the pack no longer ships it (see CHANGELOG.md). Remove it yourself if you no longer want it."
  fi
done
echo ""
echo "Done. Restart Claude Code to pick up the skills."
echo "Then try: /load-context, /project-create, /deep-planning — they're now available."
