#!/usr/bin/env bash
set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Wiggumnator300 — Ralph Wiggum Mode Loop
# Usage:
#   ./loop.sh              # Build mode, unlimited iterations
#   ./loop.sh 20           # Build mode, 20 iterations max
#   ./loop.sh plan         # Plan mode, unlimited iterations
#   ./loop.sh plan 5       # Plan mode, 5 iterations max

MODE="build"
MAX_ITERATIONS=0
ITERATION=0

# --- Pre-flight checks ---

# 1. Root check: --dangerously-skip-permissions is blocked for root in Claude Code
if [ "$(id -u)" -eq 0 ]; then
  echo -e "${RED}ERROR: Running as root is not supported.${NC}"
  echo ""
  echo -e "${YELLOW}Claude Code blocks --dangerously-skip-permissions for the root user.${NC}"
  echo "Options:"
  echo "  1. Run as a non-root user:"
  echo "     useradd -m wiggum && su - wiggum"
  echo ""
  echo "  2. Use the sandbox launcher (recommended):"
  echo "     ./sandbox.sh"
  echo ""
  exit 1
fi

# 2. Claude CLI check
if ! command -v claude &>/dev/null; then
  echo -e "${RED}ERROR: 'claude' command not found.${NC}"
  echo "Install Claude Code: npm install -g @anthropic-ai/claude-code"
  exit 1
fi

# 3. Auth check (fast — just ask for version with -p)
if ! claude -p "ok" --output-format text &>/dev/null 2>&1; then
  echo -e "${RED}ERROR: Claude CLI is not authenticated.${NC}"
  echo "Run: claude /login"
  exit 1
fi

# Parse arguments
case "${1:-}" in
  plan)
    MODE="plan"
    MAX_ITERATIONS="${2:-0}"
    ;;
  "")
    MODE="build"
    ;;
  *)
    if [[ "$1" =~ ^[0-9]+$ ]]; then
      MAX_ITERATIONS="$1"
    else
      echo "Usage: $0 [plan|<max_iterations>] [<max_iterations>]"
      echo ""
      echo "Examples:"
      echo "  $0              # Build mode, unlimited"
      echo "  $0 20           # Build mode, 20 iterations max"
      echo "  $0 plan         # Plan mode, unlimited"
      echo "  $0 plan 5       # Plan mode, 5 iterations max"
      exit 1
    fi
    ;;
esac

# Select prompt file
if [ "$MODE" = "plan" ]; then
  PROMPT_FILE="PROMPT_plan.md"
else
  PROMPT_FILE="PROMPT_build.md"
fi

# Verify prompt file exists
if [ ! -f "$PROMPT_FILE" ]; then
  echo -e "${RED}Error: $PROMPT_FILE not found in current directory.${NC}"
  echo "Run /wiggum in Claude Code first to set up your project."
  exit 1
fi

echo -e "${CYAN}============================================${NC}"
echo -e "${CYAN}  WIGGUMNATOR 300 — Ralph Wiggum Mode${NC}"
echo -e "${CYAN}============================================${NC}"
echo -e "  Mode: ${GREEN}$MODE${NC}"
if [ "$MAX_ITERATIONS" -gt 0 ]; then
  echo -e "  Max iterations: ${GREEN}$MAX_ITERATIONS${NC}"
else
  echo -e "  Max iterations: ${GREEN}unlimited${NC}"
fi
echo -e "  Prompt: ${GREEN}$PROMPT_FILE${NC}"
echo -e "${CYAN}============================================${NC}"
echo ""

while true; do
  ITERATION=$((ITERATION + 1))

  # Check iteration limit
  if [ "$MAX_ITERATIONS" -gt 0 ] && [ "$ITERATION" -gt "$MAX_ITERATIONS" ]; then
    echo ""
    echo -e "${YELLOW}Reached maximum iterations ($MAX_ITERATIONS). Stopping.${NC}"
    break
  fi

  echo ""
  echo -e "${CYAN}--- Iteration $ITERATION $([ "$MAX_ITERATIONS" -gt 0 ] && echo "of $MAX_ITERATIONS" || echo "") ---${NC}"
  echo "Started at: $(date)"
  echo ""

  # Feed prompt to Claude in headless mode
  claude -p \
    --dangerously-skip-permissions \
    --output-format stream-json \
    --model opus \
    --verbose < "$PROMPT_FILE"

  EXIT_CODE=$?

  echo ""
  echo "--- Iteration $ITERATION finished (exit code: $EXIT_CODE) at $(date) ---"

  # Push changes after each iteration
  if git diff --quiet HEAD 2>/dev/null; then
    echo -e "${YELLOW}No new commits to push.${NC}"
  else
    echo -e "${GREEN}Pushing changes...${NC}"
    git push 2>/dev/null || echo -e "${RED}Push failed (non-fatal). Continuing.${NC}"
  fi

  # Brief pause between iterations
  sleep 2
done

echo ""
echo -e "${CYAN}============================================${NC}"
echo -e "${GREEN}  Wiggum Mode complete after $ITERATION iterations${NC}"
echo -e "${CYAN}============================================${NC}"
