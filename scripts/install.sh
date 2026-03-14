#!/usr/bin/env bash
set -euo pipefail

# Wiggumnator300 — Install Script
# Installs the /wiggum skill globally for Claude Code.
#
# Usage:
#   bash <(curl -fsSL https://raw.githubusercontent.com/0xMelch/wiggumnator300/main/scripts/install.sh)

REPO_DIR="$HOME/.claude/.wiggumnator300"
SKILL_DIR="$HOME/.claude/skills/wiggum"
REPO_URL="https://github.com/0xMelch/wiggumnator300.git"

echo "Wiggumnator300 — Installing Ralph Wiggum Mode"
echo ""

# Clone or update the repo
if [ -d "$REPO_DIR" ]; then
  echo "Updating existing installation..."
  git -C "$REPO_DIR" pull --ff-only
else
  echo "Cloning repo..."
  mkdir -p "$(dirname "$REPO_DIR")"
  git clone "$REPO_URL" "$REPO_DIR"
fi

# Symlink the skill to where Claude Code expects it
mkdir -p "$HOME/.claude/skills"
if [ -L "$SKILL_DIR" ]; then
  rm "$SKILL_DIR"
elif [ -d "$SKILL_DIR" ]; then
  echo "Warning: $SKILL_DIR already exists as a directory. Backing up to ${SKILL_DIR}.bak"
  mv "$SKILL_DIR" "${SKILL_DIR}.bak"
fi

ln -s "$REPO_DIR/skills/wiggum" "$SKILL_DIR"

echo ""
echo "Installed:"
echo "  Repo:  $REPO_DIR"
echo "  Skill: $SKILL_DIR -> $(readlink "$SKILL_DIR")"
echo ""
echo "Type /wiggum in any Claude Code session to get started."
echo "To update later: git -C $REPO_DIR pull"
