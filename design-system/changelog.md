# Changelog

All notable changes to this design system are documented here.  
Format: `## v[version] — [month year]` followed by a brief list.

---

## v1.6 — July 2026
- Added `civic-ink-type-rule-v1.6.md` — typographic roles addendum. Instrument Sans is structure (chrome), Playfair Display is voice (only where Melinda is saying something), a toy's display face stays inside the toy's own surfaces
- Headers sit on multiples of 8 (16 / 24 / 32, 40 in reserve); body and small labels align to the 8pt grid via line-height, not font size
- No token changes; `tokens.css` is unchanged from v1.5
- Decided 2026-07-16 while designing the Field Notes homepage

## v1.5 — July 2026
- Added `tokens.css` — canonical machine-readable token file (light + dark). Downstream projects snapshot it instead of hand-transcribing the doc; keep it and the doc in sync
- Restored `--radius-sm: 4px` and `--radius-pill: 100px` declarations to the border tokens block (added in v1.3, dropped from the doc's CSS in a later revision while still referenced throughout)
- First consumer: the Field Notes site (github.com/green-melinda/ai-practice-site)

## v1.4 — May 2026

Updated --text-display-xl from 72px to 64px
Updated --text-display-lg from 48px to 40px

## v1.3 — May 2026
- Added `--radius-sm: 4px` and `--radius-pill: 100px` border-radius tokens
- Updated all rectangular elements from `border-radius: 0` to `--radius-sm`
- Updated tag component to `inline-flex` with center alignment
- Updated border rules and anti-patterns to reflect two-value radius system
- Built component playground (`component-playground.html`)

## v1.2 — May 2026
- Added Form Elements section (inputs, textarea, select, checkbox, radio)
- Added Alarm Red (`#DC2626`) as semantic error color — light and dark variants
- Added `--color-alarm-bg` surface token for error message containers
- Updated anti-patterns table with six form-specific rules
- Updated Quick Reference with Alarm in both palette modes
- Moved `design-system.md` into `design-system/` folder
- Added `CHANGELOG.md` to `design-system/` folder
- Added `README.md` at repo root

## v1.1 — May 2026
- Added Dark Mode palette: Civic Ink — Night (`#111008` warm void surface)
- Added Cobalt (`#1B4FD8` light / `#4B7FFF` dark) as second accent color
- Defined semantic split: Acid = action, Cobalt = information
- Added dark mode `@media` block with all token overrides
- Updated all component patterns for both accent colors

## v1.0 — May 2026
- Initial system
- Civic Ink palette: Ink, Paper, Acid, Warm Rule, Charcoal
- Typography: Instrument Sans (body) + Playfair Display (display)
- 8pt spacing scale (`--space-1` through `--space-9`)
- Layout grid, breakpoints, border tokens
- Component patterns: buttons, tags, cards, pull quote, eyebrow label, callout
- Interaction states, iconography (Tabler), motion, accessibility, voice & tone
- Anti-patterns table
