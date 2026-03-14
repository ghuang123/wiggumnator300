# Wiggumnator300

A Claude Code plugin that packages the [Ralph Wiggum method](https://ghuntley.com/ralph/) into a reusable `/wiggum` skill. Define your project scope interactively, then let Wiggum mode build it autonomously through iterative loops.

Based on the methodology by [Geoffrey Huntley](https://github.com/ghuntley/how-to-ralph-wiggum).

## What It Does

1. **`/wiggum`** — Interactive scope definition. Claude guides you through defining what you want to build, breaks it into topics of concern, and writes structured specs.
2. **Activation** — When you're happy with the scope, say "go wiggum go" and the skill scaffolds everything needed for autonomous execution.
3. **`./loop.sh`** — The autonomous loop. Runs Claude in headless mode with `--dangerously-skip-permissions`, picking tasks from the implementation plan one at a time until everything is built.

## Quick Install

```bash
claude plugin add github.com/0xMelch/wiggumnator300
```

## Manual Install

Clone this repo and add it as a local plugin:

```bash
git clone https://github.com/0xMelch/wiggumnator300.git ~/.claude/plugins/wiggumnator300
```

Or symlink into your project's `.claude/skills/` directory:

```bash
mkdir -p .claude/skills
ln -s /path/to/wiggumnator300/skills/wiggum .claude/skills/wiggum
```

## Usage

### 1. Start Scope Definition

In any project with Claude Code:

```
/wiggum
```

Or with a starting description:

```
/wiggum build a CLI tool that monitors server health
```

### 2. Define Your Scope

Claude will:
- Ask you to describe what you want to build (conversational)
- Propose a breakdown into topics of concern
- For each topic, gather acceptance criteria, constraints, and edge cases
- Write `specs/<topic>.md` files for each topic
- Set up `AGENTS.md` with your build/test/lint commands

Take your time here. The better the scope, the better the autonomous execution.

### 3. Activate Wiggum Mode

When you're satisfied with the specs:

> "go wiggum go"

Claude will:
- Generate `IMPLEMENTATION_PLAN.md` with prioritized tasks
- Copy `loop.sh`, `PROMPT_plan.md`, `PROMPT_build.md` to your project root
- Tell you how to start the loop

### 4. Run the Loop

```bash
./loop.sh              # Build mode, unlimited iterations
./loop.sh 20           # Build mode, 20 iterations max
./loop.sh plan         # Planning mode (re-analyze specs vs code)
./loop.sh plan 5       # Planning mode, 5 iterations max
```

Each iteration:
1. Reads specs and the implementation plan
2. Picks the highest-priority task
3. Implements it
4. Runs tests/lint/typecheck
5. Updates the plan
6. Commits and pushes
7. Loop restarts with a fresh context window

### Safety

The loop runs with `--dangerously-skip-permissions`. **Run it in a sandboxed environment:**

- Docker container
- VM
- Fly.io / E2B sandbox
- Hetzner Cloud instance

Don't run it on a machine with sensitive data or credentials beyond what the project needs.

## Project Structure After Setup

```
your-project/
├── specs/                    # Requirement specs (one per topic)
│   ├── authentication.md
│   ├── data-model.md
│   └── api-endpoints.md
├── AGENTS.md                 # Build/test/lint commands + operational notes
├── IMPLEMENTATION_PLAN.md    # Prioritized task list (shared state between iterations)
├── PROMPT_plan.md            # Planning mode prompt
├── PROMPT_build.md           # Building mode prompt
├── loop.sh                   # The autonomous loop script
└── src/                      # Your application code
```

## Customization

### Prompt Templates

Edit `PROMPT_plan.md` and `PROMPT_build.md` in your project root to adjust how Wiggum mode operates. Common tweaks:

- Change the model (default: `opus`)
- Adjust subagent usage
- Add project-specific rules
- Modify commit message format

### AGENTS.md

This file is loaded every iteration. Add operational learnings here — build quirks, naming conventions, environment setup notes. Keep it lean.

### Specs

Specs can be edited at any time. Re-run `./loop.sh plan` after changing specs to regenerate the implementation plan.

## How It Works

The Ralph Wiggum method separates **planning** from **building** and uses a persistent implementation plan as shared state between isolated loop iterations. Each iteration gets a fresh context window (~176K usable tokens from 200K), keeping the AI in its "smart zone" by never accumulating stale context.

The key insight: context is everything. By resetting the context each iteration and loading only what's needed (specs + plan + relevant code), every iteration operates at peak effectiveness.

## License

MIT
