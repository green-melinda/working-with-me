#!/usr/bin/env bash
# Link this repo into ~/.claude so Claude Code loads it in every session.
#
#   ./install.sh
#
# Everything here is a symlink, so a "git pull" updates it with no other step.
# Projects need nothing. Skills uploaded to the Claude account already sync into
# every session, so there is no per-repo copy to keep in sync.

set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$REPO/.claude/skills"
USER_SKILLS="$HOME/.claude/skills"

if [ ! -d "$SRC" ]; then
  echo "No skills found at $SRC" >&2
  exit 1
fi

mkdir -p "$USER_SKILLS"

for skill in "$SRC"/*/; do
  name="$(basename "$skill")"
  target="$USER_SKILLS/$name"

  if [ -e "$target" ] && [ ! -L "$target" ]; then
    backup="$target.backup.$(date +%Y%m%d%H%M%S)"
    mv "$target" "$backup"
    echo "moved existing $name to $backup"
  fi

  ln -sfn "$skill" "$target"
  echo "linked $name to $target"
done

# The personal CLAUDE.md only loads when Claude Code runs inside a directory that
# holds it. Linking it to ~/.claude/CLAUDE.md makes it load in every session on
# this machine, which is what keeps the unslop rule always on.
if [ -f "$REPO/claude.md" ]; then
  GLOBAL_MD="$HOME/.claude/CLAUDE.md"
  if [ -e "$GLOBAL_MD" ] && [ ! -L "$GLOBAL_MD" ]; then
    backup="$GLOBAL_MD.backup.$(date +%Y%m%d%H%M%S)"
    mv "$GLOBAL_MD" "$backup"
    echo "moved existing global CLAUDE.md to $backup"
  fi
  ln -sfn "$REPO/claude.md" "$GLOBAL_MD"
  echo "linked claude.md to $GLOBAL_MD"
fi

echo
echo "Done. Restart Claude Code to pick up the changes."
