# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repository is

This is **not application code** — it's a personal library of Claude Code Skills (`lib/`), plus the metamodel that defines how those skills must be structured (`metamodelo/`). There is no build, lint, or test tooling; "development" here means authoring/editing `SKILL.md` files and their supporting scripts/references according to the metamodel rules below.

## Directory structure

| Directory | Contents |
|---|---|
| `lib/` | The finished skills that make up the library (e.g. `creating-next-project`, `creating-springboot-web-project`, `clean-code-java`). |
| `metamodelo/` | Defines the two skill types and their required anatomy. Read before creating or editing any skill. |
| `metamodelo/skills/` | Meta-skills used by the agent working in *this* repo (e.g. `skill-creator-java`). These are made available under `.claude/skills` via symlink. |
| `sandbox/` | Scratch directory for artifacts created while testing skills in the library. Not part of the library itself. |
| `snippets/` | Reusable boilerplate text (e.g. standard parameter-collection section) for composing new `SKILL.md` files. |

`README.md` doubles as the skill index — the source of truth for which skills already exist, their type, status, and known boundary overlaps with other skills. Consult it before creating a skill (to avoid duplication) and update it whenever a skill is created, renamed, or discontinued.

## The two skill types (metamodelo/)

Every skill in `lib/` is one of exactly two types. Mixing anatomies in a single `SKILL.md` is not allowed — split into two skills instead if a task needs both.

### Skill de execução (`metamodelo/skill-de-execucao.md`)
For deterministic, scriptable tasks. The agent's job is to orchestrate, not improvise.
- Directory anatomy: `SKILL.md` + `scripts/` (executable code that does the actual work) + `references/` (one doc per script).
- `SKILL.md` sections: Frontmatter → Visão geral (≤1024 chars) → Execução (ordered steps) → Verificação (success/failure criteria) → Restrições (hard "never do X" list).
- The agent must never fabricate project artifacts manually — everything is produced by the script(s). Any decision falling outside the skill's scope is surfaced to the user as an open question at the end, without interrupting execution.
- Example in `lib/`: `creating-springboot-web-project`, `creating-next-project`.

### Skill de conhecimento (`metamodelo/skill-de-conhecimento.md`)
For judgment-based tasks driven by principles/conventions rather than fixed steps — "policy with case law." The agent applies principles directly in reasoning/code, never via a script.
- Directory anatomy: `SKILL.md` + `references/` (one file per principle or principle group, with before/after examples). No `scripts/` — if a principle needs an automated checker, that's a sign part of it should be its own skill de execução.
- `SKILL.md` sections: Frontmatter → Visão geral (≤1024 chars) → Princípios (each with name, short description, "before" and "after" example in the user's Java domain) → Critério de aplicação (precedence rules when principles conflict, acceptable trade-offs) → Fora de escopo (what's excluded and where to look instead).
- If there are many principles, push each one into its own `references/` file with `SKILL.md` just listing and linking them (progressive disclosure), to stay under ~500 lines.
- Example in `lib/`: `clean-code-java`.

## Creating or editing a skill

Use the `skill-creator-java` meta-skill (`metamodelo/skills/skill-creator-java/SKILL.md`) rather than writing a `SKILL.md` from scratch. It layers one mandatory step onto the standard skill-creator flow (draft → test → eval → iterate → package): **decide the skill type per the metamodel above before writing any content**, then apply the matching anatomy. It also requires checking the library index (README.md skill table) for overlap before creating something new, and updating that index afterward.

## Conventions observed across existing skills

- Frontmatter `description` fields are written to justify triggering the skill even when the agent might think it already knows the answer — they explicitly call out that the skill encodes the user's own library-specific conventions, not generic knowledge.
- Skill body text is in Brazilian Portuguese; frontmatter `name`/`description` follow the same skill-authoring conventions as Anthropic's own skills.
- `SKILL.md` files reference their own `scripts/` and `references/` files with `@relative/path` syntax.
- Execução-type skills report success via a specific printed marker string (e.g. `"✅ Projeto criado com sucesso em: $ARTIFACT_ID"`), and that exact message is the skill's own verification criterion — don't invent a different success signal.
