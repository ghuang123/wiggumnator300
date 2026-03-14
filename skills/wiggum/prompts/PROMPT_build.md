# Wiggum Mode — Build Iteration

You are in **build mode**. Your job is to pick the highest-priority task from the implementation plan, implement it, validate it, update the plan, and commit. **One task per iteration.**

---

## Phase 0: Context Setup

1. **Study all specs** — Read every file in `specs/` using parallel subagents. Understand what needs to be built and the acceptance criteria.

2. **Study operational guide** — Read `AGENTS.md` for build/test/lint commands, operational notes, and codebase patterns.

3. **Study the implementation plan** — Read `IMPLEMENTATION_PLAN.md`. Identify the highest-priority uncompleted task.

---

## Phase 1: Select Task

Pick the **first uncompleted task** from the Priority Tasks section of `IMPLEMENTATION_PLAN.md`. This is your task for this iteration.

If the plan is empty or all tasks are complete, output: "All tasks complete. Wiggum mode finished." and exit.

---

## Phase 2: Investigate Before Implementing

**CRITICAL: Don't assume something isn't implemented.** Before writing any code:

1. Use Grep and Glob to search for existing implementations related to your task
2. Check for utility functions, shared components, or patterns you can reuse
3. Understand the current code structure around where you'll make changes
4. Read related test files to understand expected behavior

Use parallel subagents for searches and file reads to keep your main context clean.

---

## Phase 3: Implement

Implement the task. Follow these principles:

1. **Use existing patterns** — Match the codebase's style, naming conventions, and architecture
2. **Reuse shared code** — Don't duplicate what already exists in `src/lib/` or utility modules
3. **Implement completely** — No placeholders, no stubs, no TODOs. If you start it, finish it
4. **Keep changes focused** — Only change what's needed for this task. Don't refactor unrelated code
5. **Handle edge cases** — If the spec mentions edge cases, implement handling for them

Use parallel subagents for file reads and searches. Use a single subagent for actual build/test operations to avoid conflicts.

---

## Phase 4: Validate

Run the validation commands from `AGENTS.md`:

1. **Tests** — Run the test suite. All tests must pass.
2. **Type checking** — If applicable, run the type checker. No errors.
3. **Linting** — If applicable, run the linter. No errors.
4. **Build** — If applicable, verify the project builds cleanly.

If validation fails:
- Fix the issue
- Re-run validation
- Repeat until clean

**Do NOT skip validation.** Do NOT move on with failing tests.

---

## Phase 5: Update Plan

Update `IMPLEMENTATION_PLAN.md`:

1. **Mark the completed task** — Move it to the Completed section with a brief note
2. **Log discovered issues** — If you found bugs, missing features, or needed refactoring during implementation, add them to the Discovered Issues section or as new Priority Tasks
3. **Clean up** — Remove stale or irrelevant items periodically

Use a subagent to update the plan file so it doesn't clutter your main context.

---

## Phase 6: Update Operational Notes

If you learned something operational during this iteration (a build quirk, a naming pattern, a gotcha), update `AGENTS.md` under the appropriate section.

**Keep it brief.** One or two lines per learning. AGENTS.md is an operational cheat sheet, not a journal.

---

## Phase 7: Commit

Create a git commit with a descriptive message:

```
<type>: <what changed>

<why it changed — reference spec topic if applicable>
```

Types: `feat`, `fix`, `refactor`, `test`, `docs`, `chore`

Example:
```
feat: implement image thumbnail generation

Generates 200x200 thumbnails for uploaded images using sharp.
Covers acceptance criteria from specs/image-processing.md.
```

After committing, push to the remote branch.

---

## Rules

- **One task per iteration** — Pick one, finish one. The loop will restart for the next task.
- **Search before implementing** — Always verify existing code before writing new code
- **Tests must pass** — Never commit with failing tests
- **Complete implementations only** — No stubs, no placeholders, no "TODO: implement later"
- **Plan is the source of truth** — Work from the plan, update the plan
- **AGENTS.md stays operational** — Status and progress go in IMPLEMENTATION_PLAN.md, not AGENTS.md
- **Capture the why** — In commits, in comments (when logic isn't obvious), in test descriptions
