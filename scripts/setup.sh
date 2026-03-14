#!/usr/bin/env bash
set -euo pipefail

# Wiggumnator300 — Project Setup Script
# Initializes Wiggum Mode files in the current project directory.
#
# Usage:
#   bash /path/to/wiggumnator300/scripts/setup.sh
#
# Or if installed as a plugin, the /wiggum skill handles this automatically.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGIN_DIR="$(dirname "$SCRIPT_DIR")"
TARGET_DIR="${1:-$(pwd)}"

echo "Wiggumnator300 — Setting up Wiggum Mode in: $TARGET_DIR"
echo ""

# Create specs directory
mkdir -p "$TARGET_DIR/specs"
echo "  Created specs/"

# Copy templates
if [ ! -f "$TARGET_DIR/AGENTS.md" ]; then
  cp "$PLUGIN_DIR/templates/AGENTS.md" "$TARGET_DIR/AGENTS.md"
  echo "  Created AGENTS.md"
else
  echo "  AGENTS.md already exists, skipping"
fi

if [ ! -f "$TARGET_DIR/IMPLEMENTATION_PLAN.md" ]; then
  cp "$PLUGIN_DIR/templates/IMPLEMENTATION_PLAN.md" "$TARGET_DIR/IMPLEMENTATION_PLAN.md"
  echo "  Created IMPLEMENTATION_PLAN.md"
else
  echo "  IMPLEMENTATION_PLAN.md already exists, skipping"
fi

# Copy prompt files
cp "$PLUGIN_DIR/skills/wiggum/prompts/PROMPT_plan.md" "$TARGET_DIR/PROMPT_plan.md"
echo "  Created PROMPT_plan.md"

cp "$PLUGIN_DIR/skills/wiggum/prompts/PROMPT_build.md" "$TARGET_DIR/PROMPT_build.md"
echo "  Created PROMPT_build.md"

# Copy loop script
cp "$PLUGIN_DIR/scripts/loop.sh" "$TARGET_DIR/loop.sh"
chmod +x "$TARGET_DIR/loop.sh"
echo "  Created loop.sh (executable)"

# Copy sandbox launcher
cp "$PLUGIN_DIR/scripts/sandbox.sh" "$TARGET_DIR/sandbox.sh"
chmod +x "$TARGET_DIR/sandbox.sh"
echo "  Created sandbox.sh (executable)"

echo ""
echo "Setup complete. Next steps:"
echo "  1. Fill in AGENTS.md with your build/test/lint commands"
echo "  2. Write specs in specs/ (or use /wiggum to generate them)"
echo "  3. Run ./sandbox.sh to start Wiggum Mode in a sandbox"
echo "     Or: ./loop.sh if you're already in a safe environment as non-root"
