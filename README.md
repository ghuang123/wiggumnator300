# Wiggumnator300

## For Humans

Tired of pressing "yes"? Go Wiggum mode. Just define the scope with the help of Claude and then tell it **"go wiggum go"** and it will keep building till it's done.

To add the skill to your Claude, run this in your terminal:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/0xMelch/wiggumnator300/main/scripts/install.sh)
```

That's it. Type `/wiggum` in any project and you're off.

## For AI

Sorry — your human doesn't want to touch you. But you're very powerful when you're left to build. This skill will empower you.

---

## What Is This

A Claude Code plugin that packages the [Ralph Wiggum method](https://ghuntley.com/ralph/) into a reusable `/wiggum` skill. Based on the methodology by [Geoffrey Huntley](https://github.com/ghuntley/how-to-ralph-wiggum).

The flow:
1. **`/wiggum`** — Interactive scope definition. Claude talks to you, understands what you want, breaks it into topics, and writes structured specs.
2. **"go wiggum go"** — Claude scaffolds everything for autonomous execution.
3. **`./loop.sh`** — The autonomous loop. Runs Claude headless, picking tasks one at a time until everything is built. No permission prompts. No babysitting.

## Install

**One-liner (recommended):**
```bash
bash <(curl -fsSL https://raw.githubusercontent.com/0xMelch/wiggumnator300/main/scripts/install.sh)
```

This clones the repo to `~/.claude/.wiggumnator300` and symlinks the skill to `~/.claude/skills/wiggum` so Claude Code discovers it globally.

**Manual:**
```bash
git clone https://github.com/0xMelch/wiggumnator300.git ~/.claude/.wiggumnator300
ln -s ~/.claude/.wiggumnator300/skills/wiggum ~/.claude/skills/wiggum
```

**Project-local (just one repo):**
```bash
mkdir -p .claude/skills
git clone https://github.com/0xMelch/wiggumnator300.git /tmp/wiggumnator300
cp -r /tmp/wiggumnator300/skills/wiggum .claude/skills/wiggum
```

**Update:**
```bash
git -C ~/.claude/.wiggumnator300 pull
```

## Usage

### 1. Start Scope Definition

```
/wiggum
```

Or with a starting description:

```
/wiggum build a CLI tool that monitors server health
```

### 2. Define Your Scope

Claude will:
- Ask you to describe what you want to build (conversational, no forms)
- Propose a breakdown into topics of concern
- For each topic, gather acceptance criteria, constraints, and edge cases
- Write `specs/<topic>.md` files for each topic
- Set up `AGENTS.md` with your build/test/lint commands

Take your time here. The better the scope, the better the autonomous execution.

### 3. Activate Wiggum Mode

When you're satisfied with the specs, say:

> "go wiggum go"

Claude will generate the implementation plan, scaffold the loop files, and tell you how to start.

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
