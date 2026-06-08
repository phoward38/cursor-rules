# Contributing to Cursor Rules Pack

Thanks for wanting to contribute! Community PRs for new framework rules are very welcome.

---

## What We Accept

✅ **New framework rules** — Any popular TypeScript framework not yet covered (SvelteKit, Astro, Hono, Fastify, tRPC, Drizzle ORM, Bun, etc.)
✅ **Improvements to existing rules** — Corrections, additions for new framework versions, pattern improvements
✅ **Bug fixes** — Rules that generate incorrect or outdated patterns
✅ **Documentation improvements** — README clarity, examples, table fixes

❌ **Framework-agnostic style opinions** — These belong in `global.mdc` and need broader consensus
❌ **Rules for non-TypeScript languages** — This pack is TypeScript-focused
❌ **Rules that conflict with official framework docs** — We follow the framework's own guidance

---

## Rule File Format

Each rule file lives in `/rules/` and uses Cursor's MDC format:

```
rules/
├── global.mdc
├── nextjs.mdc
├── react.mdc
└── your-framework.mdc   ← your new file goes here
```

### MDC File Structure

```markdown
---
description: One-line description of what this rule covers
globs: ["**/*.ts", "**/*.tsx"]
alwaysApply: false
---

# Framework Name Rules

One paragraph: why these rules exist and what problem they solve.

## Core Principles

- Bullet point principles (5–10 max)

## Patterns

### Pattern Name

Explain what this pattern is and why it's preferred.

\`\`\`typescript
// ✅ Do this
const example = ...

// ❌ Not this
const badExample = ...
\`\`\`

## Anti-Patterns

Common AI mistakes this rule corrects.
```

### Rules for Rules

- **Cite the source** — If a pattern comes from official docs, link to it in a comment
- **Explain the why** — Don't just say "do X", say "do X because Y"
- **Be specific** — "Use Server Components by default" beats "write good components"
- **Keep it focused** — One file per framework. Don't add a React section to the Next.js file.
- **Version it** — If a pattern is version-specific, note it: `# Next.js 14+ (App Router)`

---

## Testing Your Rule

Before submitting, test your rule against at least 5 real Cursor prompts:

1. Open a relevant project in Cursor
2. Add your rule to `.cursorrules` or `.cursor/rules/`
3. Try prompts like:
   - "Create a new [component/route/service] for X"
   - "Refactor this to follow best practices"
   - "Add error handling to this function"
4. Verify the AI output follows the patterns you encoded
5. Include 1–2 before/after examples in your PR description

---

## PR Process

1. **Fork** the repo
2. **Branch** from `main`: `git checkout -b rules/sveltekit`
3. **Add** your file to `/rules/`
4. **Update** the table in `README.md` to include your new rule
5. **Open a PR** with:
   - What framework it covers and what version
   - 1–2 before/after Cursor output examples
   - Link to the official docs you based it on

PRs are reviewed by the GoodEpoch team. We aim to review within 7 days.

---

## Questions?

Open an [issue](https://github.com/GoodEpochHQ/cursor-rules/issues) or start a [discussion](https://github.com/GoodEpochHQ/cursor-rules/discussions).
