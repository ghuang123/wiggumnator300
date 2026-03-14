#!/usr/bin/env bash
set -euo pipefail

# Wiggumnator300 — Sandbox Launcher
# Spins up a Docker container, copies your project in, and runs the loop
# as a non-root user. No manual setup needed.
#
# Usage:
#   ./sandbox.sh              # Build mode, unlimited iterations
#   ./sandbox.sh 20           # Build mode, 20 iterations max
#   ./sandbox.sh plan         # Plan mode
#   ./sandbox.sh plan 5       # Plan mode, 5 iterations max

PROJECT_DIR="$(pwd)"
CONTAINER_NAME="wiggum-$(basename "$PROJECT_DIR")-$$"
CLAUDE_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"

# --- Pre-flight ---

if ! command -v docker &>/dev/null; then
  echo "ERROR: Docker not found. Install Docker to use the sandbox."
  echo "https://docs.docker.com/get-docker/"
  exit 1
fi

if [ ! -f "$CLAUDE_DIR/.credentials.json" ] && [ ! -f "$CLAUDE_DIR/credentials.json" ]; then
  echo "ERROR: No Claude credentials found at $CLAUDE_DIR"
  echo "Run 'claude /login' first, then try again."
  exit 1
fi

if [ ! -f "PROMPT_build.md" ] && [ ! -f "PROMPT_plan.md" ]; then
  echo "ERROR: No prompt files found. Run /wiggum in Claude Code first to set up your project."
  exit 1
fi

echo "============================================"
echo "  WIGGUMNATOR 300 — Sandbox Launcher"
echo "============================================"
echo "  Project: $PROJECT_DIR"
echo "  Container: $CONTAINER_NAME"
echo "  Args: ${*:-build (default)}"
echo "============================================"
echo ""

# --- Build a minimal container ---

DOCKERFILE=$(mktemp)
cat > "$DOCKERFILE" <<'DOCKER'
FROM node:22-slim

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*
RUN npm install -g @anthropic-ai/claude-code@latest

# Create non-root user
RUN useradd -m -s /bin/bash wiggum

USER wiggum
WORKDIR /home/wiggum/project
DOCKER

echo "Building sandbox image..."
docker build -t wiggumnator-sandbox -f "$DOCKERFILE" . --quiet
rm -f "$DOCKERFILE"

# --- Find credentials file ---

CRED_FILE=""
if [ -f "$CLAUDE_DIR/.credentials.json" ]; then
  CRED_FILE="$CLAUDE_DIR/.credentials.json"
elif [ -f "$CLAUDE_DIR/credentials.json" ]; then
  CRED_FILE="$CLAUDE_DIR/credentials.json"
fi

SETTINGS_FILE=""
if [ -f "$CLAUDE_DIR/settings.json" ]; then
  SETTINGS_FILE="$CLAUDE_DIR/settings.json"
fi

# --- Launch ---

echo "Starting sandbox..."
echo ""

DOCKER_ARGS=(
  run --rm
  --name "$CONTAINER_NAME"
  -v "$PROJECT_DIR:/home/wiggum/project"
)

# Mount credentials read-only
if [ -n "$CRED_FILE" ]; then
  DOCKER_ARGS+=(-v "$CRED_FILE:/home/wiggum/.claude/.credentials.json:ro")
fi
if [ -n "$SETTINGS_FILE" ]; then
  DOCKER_ARGS+=(-v "$SETTINGS_FILE:/home/wiggum/.claude/settings.json:ro")
fi

# Pass through any API keys that might be set
for var in ANTHROPIC_API_KEY CLAUDE_API_KEY; do
  if [ -n "${!var:-}" ]; then
    DOCKER_ARGS+=(-e "$var=${!var}")
  fi
done

DOCKER_ARGS+=(
  wiggumnator-sandbox
  bash -c "./loop.sh $*"
)

docker "${DOCKER_ARGS[@]}"
