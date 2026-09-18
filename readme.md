# Working With Me

This repository contains my `CLAUDE.md` — a configuration file that gives Claude Code persistent context about how I work, think, and design. It loads automatically at the start of every Claude Code session, so I'm not re-explaining myself from scratch each time.

If you're not familiar with Claude Code: think of `CLAUDE.md` as a brief for an AI collaborator. The better the brief, the better the work.

---

## Why this is public

Two reasons — well, 2 reasons beyond I NEED A JOB and its dependency on my being able to explain how well I can tell a machine to do my job. 

First, the practical one: a `CLAUDE.md` that lives only on my machine is useful. One that lives on GitHub travels with me across environments, stays version-controlled, and evolves as my practice does.

Second, the honest one: I think designers should be more transparent about how they work, not just what they've made. Process is design. The decisions that happen before Figma opens are often the most important ones.

---

## My design philosophy, since you're here

I came to UX through journalism and content strategy. That path shaped everything — I still think in language before I think in layout. For me, content isn't what fills a design after the structure is decided. Content *is* the structure. Get the words right and the hierarchy usually follows.

I'm drawn to complex, data-heavy problems — the ones where the real design challenge is making something feel simple without actually being simple. Legacy systems. Internal tools built for experts. High-stakes workflows where a bad UX decision has real consequences for real people. This is where I've done my best work.

Information architecture is where I start. Before wireframes, before components, before anything visual — I want to understand the user's mental model, the shape of the information they're navigating, and the tasks they're actually trying to complete. Journey mapping isn't a deliverable for me, it's how I think.

I care about ethics in design the way some designers care about aesthetics. Dark patterns aren't a gray area. Designing for engagement at the expense of user wellbeing isn't a tradeoff worth making. These aren't positions I hold loosely.

Plain language is a design material, not an afterthought. Accessibility is about how you talk to people as much as it's about color contrast and screen readers. These things are connected.

---

## On working with AI

I use Claude Code as a collaborator, not a generator. The distinction matters. A generator produces output. A collaborator pushes back, asks questions, and makes the work better through friction as much as through assistance.

The `CLAUDE.md` is how I make that collaboration consistent. It captures my working style, my constraints, my differentiators — the things I'd tell a new collaborator on day one. It means every session starts with shared context instead of starting from zero.

I'm still learning what AI-fluent design practice actually looks like. This file is part of that investigation.

---

## Contents

- `CLAUDE.md` — personal working context for Claude Code sessions
- `design-system/design-system.md` — Civic Ink design system: tokens, typography, components, patterns
- `design-system/CHANGELOG.md` — version history for the design system
- `.claude/skills/unslop/SKILL.md` - the unslop skill, originally cloned from the Pstack repo to improve writing and overall output quality, with my own edits and protocols. It lives at this path because that is where Claude Code looks for skills. A file at the repo root never loads.
- `install.sh` - links the skills in this repo into `~/.claude/skills` so every session on my machine picks them up, and copies them into project repos on request

---

## Installing the skills

There are two routes and they cover different things.

**Account upload, which reaches everything.** Upload `unslop.skill` at claude.ai under Settings,
Capabilities, Skills. An account skill syncs down into every session on every surface: claude.ai
chat, the desktop app, Claude Code on this machine, and Claude Code on the web in any repo,
including repos that do not exist yet. Rebuild the upload bundle after editing the skill with:

```
zip -r unslop.skill unslop -x '.*' && mv unslop.skill ../..
```

run from `.claude/skills`. One upload replaces all of the per-repo wiring below.

**Local install, which is the backup and adds the CLAUDE.md link.**

```
git clone https://github.com/green-melinda/working-with-me.git
cd working-with-me
./install.sh
```

That links every skill in `.claude/skills` into `~/.claude/skills`, and links `claude.md` to `~/.claude/CLAUDE.md` so my working context loads in every session instead of only when I am working inside this repo. Any existing file at either path gets moved to a timestamped backup first. A `git pull` here then updates both everywhere. Pass project paths to copy the skills into those repos as well, which is what makes them work in cloud sessions that clone a repo fresh:

```
./install.sh ~/code/find-a-film ~/code/ai-practice-site
```

---

## About me

Senior/Lead UX and Product Designer based in Somerville, MA. A decade of experience designing complex systems for research integrity, loyalty platforms, healthcare, and civic technology. Currently exploring the intersection of AI tooling and my design practice.

[Portfolio](https://mynameisgreenmelinda.com) · [LinkedIn](https://linkedin.com/in/greenmelinda) · [GitHub](https://github.com/green-melinda)
