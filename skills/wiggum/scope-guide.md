# Scope Definition Methodology

This document is a reference for the Wiggum Mode scope definition process. It provides the frameworks and patterns used to decompose a user's idea into well-defined, actionable specs.

## Jobs to Be Done (JTBD)

A JTBD is the high-level outcome the user needs. It's not a feature list — it's the *why*.

**Good JTBDs:**
- "I need to collect and organize photos from multiple sources into themed albums"
- "I need a CLI tool that monitors my servers and alerts me when something's wrong"
- "I need to migrate our REST API to GraphQL without breaking existing clients"

**Bad JTBDs (too vague or too specific):**
- "I need a web app" (what does it *do*?)
- "I need a React component with a useState hook" (that's an implementation detail, not a job)

## Topics of Concern

A topic of concern is a distinct, self-contained aspect of the JTBD. Each topic should:

1. **Be describable in one sentence without "and"** — If you need "and", split it
2. **Have clear boundaries** — You should know what's in scope and what's not
3. **Be independently testable** — You can verify it works without other topics
4. **Map to a coherent set of changes** — Not scattered across unrelated areas

### Decomposition Examples

**JTBD:** "Build a photo album app"

| Topic | One-Sentence Description |
|-------|--------------------------|
| Image ingestion | Import photos from local filesystem and URLs |
| Album management | Create, rename, delete, and reorder albums |
| Image processing | Generate thumbnails and optimize images for web |
| Sharing | Generate shareable links for albums with optional password protection |
| Search | Find photos by date, tag, or visual similarity |

**Anti-pattern — topics too broad:**
- "Backend" (what part of the backend?)
- "Frontend and API" (two things joined by "and")
- "Everything else" (not a topic)

**Anti-pattern — topics too granular:**
- "Add the upload button" (that's a task, not a topic)
- "Write the database migration for the photos table" (implementation detail)

## Spec Format

Each topic gets a spec file at `specs/<topic-slug>.md`:

```markdown
# <Topic Name>

## Description
<One clear sentence describing this topic's scope>

## Acceptance Criteria
- [ ] <Specific, testable condition 1>
- [ ] <Specific, testable condition 2>
- [ ] <Specific, testable condition 3>

## Technical Approach
<High-level implementation notes — frameworks, patterns, key decisions>

## Dependencies
<Other topics this depends on, or "None">

## Edge Cases
<What could go wrong and how to handle it>

## Notes
<Additional context, references, or constraints>
```

### Writing Good Acceptance Criteria

Acceptance criteria should be **specific**, **testable**, and **binary** (done or not done).

**Good:**
- "Uploading a 10MB JPEG completes within 5 seconds"
- "Albums with 0 photos display an empty state message"
- "Shared links expire after 30 days by default"

**Bad:**
- "Upload works well" (how do you test "well"?)
- "The UI looks good" (subjective — use specific visual requirements)
- "It should be fast" (how fast? Under what conditions?)

### Handling Ambiguity

When the user is vague about a topic:
1. **Propose a reasonable default** and flag it as an assumption
2. **Ask for clarification** if the default could be wrong in important ways
3. **Don't block on perfection** — specs can be revised. A good-enough spec now beats a perfect spec later

## Priority Ordering

When generating the implementation plan, order tasks by:

1. **Foundation first** — Shared utilities, data models, configuration
2. **Dependencies** — If topic B depends on topic A, A comes first
3. **Risk** — Risky or uncertain items early (fail fast)
4. **Value** — High-value features before nice-to-haves
5. **Complexity** — Simple wins early to build momentum

## The One-Sentence Test

Before finalizing any topic, apply this test:

> "Can I describe this topic in one sentence without using 'and'?"

If no → split it.
If the sentence is vague → sharpen it.
If the sentence describes an implementation detail → zoom out to the capability level.
