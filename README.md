# ⚡ Cursor Rules Pack — Community Edition

<div align="center">

[![GitHub Stars](https://img.shields.io/github/stars/GoodEpochHQ/cursor-rules?style=for-the-badge&logo=github&color=FFD700)](https://github.com/GoodEpochHQ/cursor-rules/stargazers)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)](LICENSE)
[![Last Updated](https://img.shields.io/badge/Updated-2026-blue.svg?style=for-the-badge)](https://github.com/GoodEpochHQ/cursor-rules/commits/main)
[![TypeScript](https://img.shields.io/badge/TypeScript-Ready-3178C6.svg?style=for-the-badge&logo=typescript)](https://www.typescriptlang.org/)
[![Frameworks](https://img.shields.io/badge/Frameworks-7+-purple.svg?style=for-the-badge)](#included-rules)

**Production-quality Cursor AI rules for modern TypeScript projects.**
Drop in a single file. Ship better code instantly.

[🚀 Quick Start](#quick-start) · [📦 Included Rules](#included-rules) · [💎 Premium Pack](#-want-more-the-premium-pack) · [🤝 Contributing](#contributing)

</div>

---

## What is this?

This is a curated set of `.cursorrules` files that teach Cursor AI how to write **idiomatic, production-ready code** for the most popular TypeScript frameworks and tools. Stop wrestling with AI that doesn't understand your stack — these rules encode real-world best practices so Cursor writes code that actually belongs in your codebase.

Each rule file is **self-contained**, **framework-specific**, and **immediately usable**. Copy one file into your project root and your AI coding experience upgrades instantly.

---

## Quick Start

**Option 1 — Copy a single file (30 seconds)**

```bash
# Next.js project
curl -o .cursorrules https://raw.githubusercontent.com/GoodEpochHQ/cursor-rules/main/rules/nextjs.mdc

# React project
curl -o .cursorrules https://raw.githubusercontent.com/GoodEpochHQ/cursor-rules/main/rules/react.mdc

# Node/Express API
curl -o .cursorrules https://raw.githubusercontent.com/GoodEpochHQ/cursor-rules/main/rules/nodejs.mdc
```

**Option 2 — Clone and use the combine script**

```bash
git clone https://github.com/GoodEpochHQ/cursor-rules.git
cd cursor-rules

# Combine multiple rules into one custom .cursorrules file
./scripts/combine.sh nextjs react typescript > /your/project/.cursorrules
```

**Option 3 — Browse and copy manually**

Browse the [`/rules`](./rules/) directory, find your framework, copy the contents into your project's `.cursorrules` file.

> **That's it.** Restart Cursor and your AI assistant now understands your stack at a deeper level.

---

## Included Rules

All files in this repo are **MIT licensed** and free forever.

| File | Framework / Tool | What It Covers |
|------|-----------------|----------------|
| [`global.mdc`](rules/global.mdc) | 🌐 Global (all projects) | TypeScript strictness, naming conventions, error handling patterns, import style, code organization principles that apply everywhere |
| [`nextjs.mdc`](rules/nextjs.mdc) | ▲ Next.js 14+ | App Router, Server/Client Components, Server Actions, metadata API, image optimization, route handlers, caching strategy |
| [`react.mdc`](rules/react.mdc) | ⚛️ React 18+ | Hooks best practices, component composition, memo/useCallback patterns, controlled vs uncontrolled, accessibility defaults |
| [`typescript.mdc`](rules/typescript.mdc) | 🔷 TypeScript 5+ | Strict mode patterns, utility types, discriminated unions, type narrowing, `satisfies` operator, `as const`, generics |
| [`nodejs.mdc`](rules/nodejs.mdc) | 🟢 Node.js / Express | REST conventions, middleware patterns, async error handling, env config, logging, graceful shutdown |
| [`prisma.mdc`](rules/prisma.mdc) | 🔺 Prisma ORM | Schema design, query optimization, relation handling, migrations, type-safe queries, N+1 prevention |
| [`tailwind.mdc`](rules/tailwind.mdc) | 🎨 Tailwind CSS | Class organization, component extraction thresholds, responsive patterns, dark mode, custom variants |
| [`testing.mdc`](rules/testing.mdc) | 🧪 Testing (Vitest/Jest) | Describe/it structure, mock patterns, testing-library conventions, what to test vs skip, CI-friendly patterns |
| [`combine.sh`](scripts/combine.sh) | 🔧 Combine Script | Merges multiple rule files into a single `.cursorrules` with deduplication and section headers |

### Quick Picks by Project Type

| Building a... | Use these rules |
|--------------|----------------|
| Next.js SaaS app | `global` + `nextjs` + `react` + `typescript` + `tailwind` |
| REST API | `global` + `nodejs` + `typescript` + `testing` |
| React + Vite app | `global` + `react` + `typescript` + `tailwind` |
| Prisma data layer | `global` + `prisma` + `typescript` |

---

## 💎 Want More? The Premium Pack

The Community Edition covers the most popular individual frameworks. The **[GoodEpoch Cursor Rules Premium Pack](https://goodepochhq.gumroad.com/l/cursor-rules)** goes much deeper:

### What's in the Premium Pack

| Category | Files | Examples |
|----------|-------|---------|
| **Full-Stack Stacks** | 8 files | Next.js + Prisma + Tailwind + Auth.js, T3 Stack, MERN, Remix + Supabase |
| **Cross-Cutting Concerns** | 6 files | Authentication flows, payment integration (Stripe), email (Resend), file uploads, real-time (Pusher/Ably) |
| **Code Style Profiles** | 4 files | Functional-first, OOP patterns, startup-speed (ship fast), enterprise-quality (strict review-ready) |
| **Bonus: Prompt Library** | 20+ prompts | Scaffold a feature, refactor to hooks, add error boundaries, generate types from API |

### Why Pay?

- **Stack rules = 10x the value** — instead of mixing rules yourself, get pre-tuned combinations that don't conflict
- **Concern rules = features you ship correctly the first time** — auth, payments, and file uploads done right
- **Style profiles = team alignment** — everyone's AI outputs the same style before code review
- **One-time purchase, lifetime updates** — every rule update ships to you automatically

**[→ Get the Premium Pack on Gumroad](https://goodepochhq.gumroad.com/l/cursor-rules)** — Pay once, use forever.

---

## How Cursor Rules Work

Cursor reads a `.cursorrules` file (or `.cursor/rules/*.mdc` files) in your project root and uses the contents as persistent instructions for every AI interaction in that project.

**Without rules:** Cursor uses generic coding knowledge.
**With rules:** Cursor knows your exact patterns, conventions, and preferences — and applies them consistently.

```
your-project/
├── .cursorrules          ← Cursor reads this automatically
├── src/
├── package.json
└── ...
```

Or with the newer MDC format (recommended for Cursor 0.40+):

```
your-project/
├── .cursor/
│   └── rules/
│       ├── global.mdc    ← Always applied
│       ├── nextjs.mdc    ← Applied to matching files
│       └── ...
├── src/
└── ...
```

---

## Contributing

Community contributions for framework rules are **very welcome**. The goal is to have the best free cursor rules for every major TypeScript framework.

### What we'd love to see

- Rules for frameworks not yet covered (SvelteKit, Astro, Hono, Fastify, tRPC, Drizzle ORM, etc.)
- Improvements to existing rules based on framework updates
- Bug fixes for rules that generate bad patterns

### How to contribute

1. Fork the repo
2. Create a branch: `git checkout -b rules/sveltekit`
3. Add your rule file to `/rules/` following the [rule format guide](CONTRIBUTING.md)
4. Test it against real Cursor prompts and document what it improves
5. Open a PR with examples of before/after AI output

### Rule quality bar

We maintain a quality bar to keep rules genuinely useful:
- ✅ Based on official framework docs and real-world patterns
- ✅ Tested in Cursor against common prompts
- ✅ Includes brief inline comments explaining non-obvious guidance
- ❌ No vendor-specific opinions without community backing
- ❌ No rules that conflict with framework best practices

See [`CONTRIBUTING.md`](CONTRIBUTING.md) for the full guide.

---

## Rule Format

Rules use Cursor's MDC format. Each file follows this structure:

```markdown
---
description: Brief description of what this rule covers
globs: ["**/*.ts", "**/*.tsx"]   # Files this rule applies to
alwaysApply: false                # true for global rules
---

# Rule Name

Brief explanation of why this rule exists.

## Core Principles

- Principle 1
- Principle 2

## Patterns

### Do this
\`\`\`typescript
// good example
\`\`\`

### Not this
\`\`\`typescript
// bad example
\`\`\`
```

---

## Changelog

| Version | Date | Changes |
|---------|------|---------|
| 1.0.0 | 2026-06 | Initial community release — global + 7 framework rules |

---

## License

MIT © [GoodEpoch](https://github.com/GoodEpochHQ)

Free to use, modify, and distribute. Attribution appreciated but not required.

---

<div align="center">

**Built with ❤️ by [GoodEpoch](https://github.com/GoodEpochHQ)**

[⭐ Star this repo](https://github.com/GoodEpochHQ/cursor-rules) if it saved you time · [💎 Upgrade to Premium](https://goodepochhq.gumroad.com/l/cursor-rules) · [🐛 Report an Issue](https://github.com/GoodEpochHQ/cursor-rules/issues)

</div>
