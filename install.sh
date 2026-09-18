#!/usr/bin/env bash
# Install the skills in this repo so Claude Code loads them everywhere.
#
#   ./install.sh                      link skills into ~/.claude/skills
#   ./install.sh ~/code/some-project  also copy them into that repo's .claude/skills
#
# The link means a "git pull" in this repo updates the skill in every session
# on this machine. Project copies are real files because a cloud session clones
# the repo fresh and cannot follow a link that points outside it. Re-run this
# script with the project paths whenever the skill changes.

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

for project in "$@"; do
  if [ ! -d "$project" ]; then
    echo "skipped $project, not a directory" >&2
    continue
  fi
  mkdir -p "$project/.claude/skills"
  for skill in "$SRC"/*/; do
    name="$(basename "$skill")"
    rm -rf "${project:?}/.claude/skills/$name"
    cp -R "$skill" "$project/.claude/skills/$name"
    echo "copied $name into $project/.claude/skills"
  done
done

echo
echo "Done. Restart Claude Code, then run /skills to confirm unslop is listed."
