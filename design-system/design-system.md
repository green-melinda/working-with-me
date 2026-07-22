# Melinda Green — Personal Design System
**Version 1.7** · Sharp & Civic · Editorial Brutalism · Light + Dark

> This file is the source of truth for all personal Claude projects. Upload at the start of any session to establish a baseline visual and structural consistency.

---

## Philosophy

Design that is **legible, direct, and never decorative for decoration's sake.** Every visual decision earns its place. The system borrows from civic design (trustworthy, accessible, structured) and editorial brutalism (raw hierarchy, exposed grids, high contrast). (Maybe because I live in Boston and really DO love our City Hall.) Physical is primary, digital is optional. No filler. No flourish that doesn't function.

---

## Color System

### Two Bold Accents — Different Jobs

This system uses two accent colors with distinct semantic roles. They are not interchangeable.

| Accent | Color | Hex | Job |
|---|---|---|---|
| **Acid** | Yellow-green | `#D6E000` | Action, CTAs, highlight, selected/active states |
| **Cobalt** | Electric blue | `#1B4FD8` | Links, information, secondary nav, category tags |

Acid is the gut punch. Cobalt is the authority. (I also have a deep love for Yves Klein Blue.) 

---

### Light Mode Palette: Civic Ink

| Token | Name | Hex | Usage |
|---|---|---|---|
| `--color-ink` | Ink | `#0D0D0D` | Primary text, borders, dominant surfaces |
| `--color-paper` | Paper | `#F5F0E8` | Default background |
| `--color-acid` | Acid | `#D6E000` | Action, CTAs, highlight, active states |
| `--color-cobalt` | Cobalt | `#1B4FD8` | Links, information, tags, secondary states |
| `--color-warm-rule` | Warm Rule | `#E8E0D0` | Subtle borders, dividers, secondary backgrounds |
| `--color-charcoal` | Charcoal | `#2A2A2A` | Secondary text, muted UI elements |
| `--color-alarm` | Alarm | `#DC2626` | Error states, destructive actions, validation failures |

```css
:root {
  --color-ink:        #0D0D0D;
  --color-paper:      #F5F0E8;
  --color-acid:       #D6E000;
  --color-cobalt:     #1B4FD8;
  --color-warm-rule:  #E8E0D0;
  --color-charcoal:   #2A2A2A;
  --color-alarm:      #DC2626;
  --color-alarm-bg:   #FFF5F5;
}
```

---

### Dark Mode Palette: Civic Ink — Night

Dark mode is not an inversion. It is a different mood — the same system working late. Warm near-black surface, Acid gets more aggressive, Cobalt brightens to stay electric.

| Token | Name | Hex | Usage |
|---|---|---|---|
| `--color-ink` | Off-white | `#F0EBE0` | Primary text |
| `--color-paper` | Warm void | `#111008` | Default background |
| `--color-acid` | Acid | `#D6E000` | Unchanged — hits harder on dark |
| `--color-cobalt` | Electric | `#4B7FFF` | Lightened for dark surface contrast |
| `--color-warm-rule` | Deep rule | `#2A2620` | Subtle borders, dividers |
| `--color-charcoal` | Muted | `#8A8478` | Secondary text, muted UI |
| `--color-alarm` | Alarm | `#F87171` | Error states — lightened for dark surface legibility |

```css
@media (prefers-color-scheme: dark) {
  :root {
    --color-ink:        #F0EBE0;
    --color-paper:      #111008;
    --color-acid:       #D6E000;
    --color-cobalt:     #4B7FFF;
    --color-warm-rule:  #2A2620;
    --color-charcoal:   #8A8478;
    --color-alarm:      #F87171;
    --color-alarm-bg:   #1C0A0A;
  }
}
```

---

### Color Usage Rules

- **Acid (`#D6E000`) is earned.** One dominant use per screen. Never decorative.
- **Cobalt is informational.** Links, tags, states that mean "there is more to know here."
- **Never Acid as text color on Paper.** Contrast ratio fails. Acid is always a background or border with Ink text on top.
- **Never Cobalt on Ink background** in light mode — insufficient contrast. Use Cobalt on Paper or Warm Rule surfaces only.
- **Dark mode Cobalt (`#4B7FFF`) on `#111008`** passes AA contrast. Do not swap back to `#1B4FD8` in dark mode.
- **No gradients.** Ever.
- **No opacity on Ink.** If you need lighter, use a token — don't fake it with alpha.
- **Acid and Cobalt never appear on the same element.** They can coexist on a screen — they cannot share a component.

---

## Typography

### Typefaces

| Role | Typeface | Weight(s) | When to Use |
|---|---|---|---|
| **Body (dominant)** | Schibsted Grotesk | 400, 500, 600 | All UI text, body copy, labels, navigation, captions |
| **Display (impact)** | Playfair Display | 700, 900 | Case study titles, section headers, pull quotes, hero text |

### Google Fonts Import

```css
@import url('https://fonts.googleapis.com/css2?family=Schibsted+Grotesk:wght@400;500;600&family=Playfair+Display:wght@700;900&display=swap');
```

### Type Scale (8pt base)

All sizes are multiples of 8 or 4 (half-step). **Never Arial. Never system-ui as a primary font.**

```css
:root {
  /* Display — Playfair Display */
  --text-display-xl:  64px;   /* Hero, name, one-word statements */
  --text-display-lg:  40px;   /* Case study titles, section openers */
  --text-display-md:  32px;   /* Subheadings, pull quotes */

  /* Body — Schibsted Grotesk */
  --text-body-xl:     24px;   /* Large intros, lead paragraphs */
  --text-body-lg:     20px;   /* Section subheadings */
  --text-body-md:     16px;   /* Default body copy */
  --text-body-sm:     14px;   /* Captions, labels, metadata */
  --text-body-xs:     12px;   /* Legal, footnotes, timestamps */

  /* Line height */
  --leading-tight:    1.1;    /* Display type only */
  --leading-normal:   1.5;    /* Body copy default */
  --leading-loose:    1.75;   /* Long-form reading */

  /* Letter spacing */
  --tracking-tight:  -0.02em; /* Large display text */
  --tracking-normal:  0;      /* Body */
  --tracking-wide:    0.08em; /* All-caps labels, tags */
  --tracking-wider:   0.15em; /* Eyebrow text */
}
```

### Font Stacks

```css
:root {
  --font-display: 'Playfair Display', 'Georgia', 'Times New Roman', serif;
  --font-body:    'Schibsted Grotesk', 'Helvetica Neue', 'Helvetica', sans-serif;
  --font-mono:    'Courier New', 'Courier', monospace;
}
```

### Typography Rules

- **Never use Arial.** At any size. For any reason. Non-negotiable.
- **Playfair Display is for impact moments only.** If you're reaching for it on a label or caption, stop.
- **Eyebrow labels** are always: Schibsted Grotesk, 11–12px, 600 weight, all-caps, `--tracking-wider`, `--color-charcoal`.
- **Pull quotes** use Playfair Display 700, `--text-display-md`, 4px left border in `--color-acid`.
- **Links** are always `--color-cobalt`, underlined on hover, never decorated at rest.
- **No centered body text** longer than two lines. Centered display text is fine.

---

## Spacing — 8pt Grid

Everything lives on multiples of 8px. Half-steps (4px) are for tight component internals only. No magic numbers.

```css
:root {
  --space-1:   4px;   /* Half-step: tight internal padding only */
  --space-2:   8px;   /* Base unit: icon gaps, tight padding */
  --space-3:  16px;   /* Component padding, small gaps */
  --space-4:  24px;   /* Card padding, section internal spacing */
  --space-5:  32px;   /* Between components */
  --space-6:  48px;   /* Section breathing room */
  --space-7:  64px;   /* Major section breaks */
  --space-8:  96px;   /* Page-level vertical rhythm */
  --space-9: 128px;   /* Hero padding, large whitespace moments */
}
```

### Spacing Rules

- **Start with more space than you think you need.** Brutalism earns its rawness through confident whitespace, not compression.
- **Padding inside components:** `--space-3` (16px) minimum. Never less.
- **Between related elements** (label + field, icon + text): `--space-2` (8px).
- **Between unrelated sections:** `--space-7` or `--space-8`. Make the break felt.
- **If you can't name the token, you shouldn't use the value.**

---

## Layout

### Grid

```css
:root {
  --grid-columns:      12;
  --grid-gutter:       24px;   /* --space-4 */
  --grid-margin:       32px;   /* --space-5, scales up at breakpoints */
  --container-max:    1200px;
  --container-narrow:  720px;  /* Long-form reading, case studies */
}
```

### Breakpoints

```css
:root {
  --bp-sm:  480px;   /* Large mobile */
  --bp-md:  768px;   /* Tablet */
  --bp-lg: 1024px;   /* Desktop */
  --bp-xl: 1280px;   /* Wide desktop */
}
```

### Layout Rules

- **Every touchpoint completable in under 10 seconds.** If it takes longer, simplify it.
- **Channel parity required.** Whatever works on desktop works on mobile. No desktop-only features.
- **Physical is primary, digital is optional.** For dual-channel experiences, the physical version stands alone.
- **Narrow container for reading.** Case studies and long-form content never exceed `--container-narrow` (720px).

---

## Borders & Rules

Borders are structural, not decorative. They define edges, separate content, and mark hierarchy.

```css
:root {
  --border-thin:        0.5px solid var(--color-ink);
  --border-mid:           1px solid var(--color-ink);
  --border-heavy:         2px solid var(--color-ink);
  --border-rule:          1px solid var(--color-warm-rule);
  --border-accent-acid:   4px solid var(--color-acid);
  --border-accent-cobalt: 4px solid var(--color-cobalt);

  --radius-sm:   4px;    /* All rectangular elements */
  --radius-pill: 100px;  /* Pills only: status chips, location tags */
}
```

### Border Rules

- **Default border-radius is `4px` (`--radius-sm`)** on all rectangular elements — cards, buttons, inputs, tags. Intentional but not harsh.
- **Pills only** use `--radius-pill` (`border-radius: 100px`) — status chips, location tags.
- **Avatars** use `border-radius: 50%`.
- **Never use values between 4px and 100px.** No 8px, no 12px, no 16px border-radius. The system has two settings: subtle (4px) and pill (100px).
- **Exposed borders are good.** Showing the grid is a feature, not a bug.
- **`--border-accent-acid`** — pull quotes, active nav states, primary selected components.
- **`--border-accent-cobalt`** — informational callouts, active link states, category-filtered views.

---

## Component Patterns

### Buttons

```css
/* Primary — Acid hover */
.btn-primary {
  font-family:    var(--font-body);
  font-size:      var(--text-body-sm);
  font-weight:    600;
  letter-spacing: var(--tracking-wide);
  text-transform: uppercase;
  background:     var(--color-ink);
  color:          var(--color-paper);
  padding:        var(--space-2) var(--space-4);
  border:         var(--border-mid);
  border-radius:  var(--radius-sm);
  cursor:         pointer;
  transition:     background 100ms ease, color 100ms ease;
}

.btn-primary:hover {
  background:   var(--color-acid);
  color:        var(--color-ink);
  border-color: var(--color-ink);
}

/* Secondary / Ghost */
.btn-secondary {
  font-family:    var(--font-body);
  font-size:      var(--text-body-sm);
  font-weight:    600;
  letter-spacing: var(--tracking-wide);
  text-transform: uppercase;
  background:     transparent;
  color:          var(--color-ink);
  padding:        var(--space-2) var(--space-4);
  border:         var(--border-mid);
  border-radius:  var(--radius-sm);
  cursor:         pointer;
  transition:     background 100ms ease;
}

.btn-secondary:hover {
  background: var(--color-warm-rule);
}

/* Info / Cobalt variant */
.btn-info {
  background:   var(--color-cobalt);
  color:        var(--color-paper);
  border-color: var(--color-cobalt);
}

.btn-info:hover {
  background:   transparent;
  color:        var(--color-cobalt);
  border-color: var(--color-cobalt);
}
```

### Tags / Labels

```css
.tag {
  font-family:    var(--font-body);
  font-size:      var(--text-body-xs);
  font-weight:    600;
  letter-spacing: var(--tracking-wide);
  text-transform: uppercase;
  display:        inline-block;
  padding:        var(--space-1) var(--space-2);
  border:         var(--border-thin);
  border-radius:  var(--radius-sm);
  color:          var(--color-ink);
  background:     transparent;
}

/* Acid = selected/active */
.tag--active {
  background:   var(--color-acid);
  border-color: var(--color-acid);
  color:        var(--color-ink);
}

/* Cobalt = category/informational */
.tag--info {
  background:   var(--color-cobalt);
  border-color: var(--color-cobalt);
  color:        var(--color-paper);
}
```

### Cards

```css
.card {
  background:    var(--color-paper);
  border:        var(--border-mid);
  padding:       var(--space-4);
  border-radius:  var(--radius-sm);
}

/* Acid accent — primary/featured */
.card--accent-acid {
  border-left: var(--border-accent-acid);
}

/* Cobalt accent — informational */
.card--accent-cobalt {
  border-left: var(--border-accent-cobalt);
}
```

### Pull Quote

```css
.pull-quote {
  font-family:  var(--font-display);
  font-size:    var(--text-display-md);
  font-weight:  700;
  line-height:  var(--leading-tight);
  color:        var(--color-ink);
  border-left:  var(--border-accent-acid);
  padding-left: var(--space-4);
  margin:       var(--space-6) 0;
}
```

### Eyebrow Label

```css
.eyebrow {
  font-family:    var(--font-body);
  font-size:      11px;
  font-weight:    600;
  letter-spacing: var(--tracking-wider);
  text-transform: uppercase;
  color:          var(--color-charcoal);
  margin-bottom:  var(--space-2);
}
```

### Callout / Info Block

```css
.callout {
  border-left:   var(--border-accent-cobalt);
  background:    var(--color-warm-rule);
  padding:       var(--space-3) var(--space-4);
  border-radius:  var(--radius-sm);
}

.callout p {
  font-size:   var(--text-body-sm);
  color:       var(--color-ink);
  margin:      0;
  line-height: var(--leading-normal);
}
```

---

## Links

```css
a {
  color:           var(--color-cobalt);
  text-decoration: none;
  transition:      text-decoration-color 100ms ease;
}

a:hover {
  text-decoration:       underline;
  text-decoration-color: var(--color-cobalt);
  text-underline-offset: 3px;
}

a:visited {
  color: var(--color-cobalt);
  opacity: 0.75;
}
```

---

## Interaction States

```css
/* Focus — always visible, never hidden for aesthetics */
:focus-visible {
  outline:        2px solid var(--color-acid);
  outline-offset: 2px;
}

/* Active / selected — Acid for primary, Cobalt for informational */
.is-active {
  border-left: var(--border-accent-acid);
}

.is-active--info {
  border-left: var(--border-accent-cobalt);
}

/* Disabled */
[disabled] {
  opacity:        0.4;
  cursor:         not-allowed;
  pointer-events: none;
}
```

---

## Iconography

- **Library:** Tabler Icons, outline style only. Never filled variants.
- **Never Font Awesome** in personal projects — style conflict with editorial brutalism direction.
- **Sizes:** always a multiple of 8: `16px`, `24px`, `32px`.
- **Icons never stand alone** on critical actions — always pair with a visible label or `aria-label`.
- **Color:** inherits from parent by default. For emphasis, use `--color-acid` or `--color-cobalt` explicitly.
- **Import:**

```html
<link rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/tabler-icons.min.css" />
```

```html
<!-- Usage -->
<i class="ti ti-arrow-right" aria-hidden="true"></i>
```

---

## Motion

Animation is functional or it doesn't exist.

```css
:root {
  --duration-fast:  100ms;
  --duration-mid:   200ms;
  --duration-slow:  350ms;
  --ease-sharp:     cubic-bezier(0.4, 0, 0.2, 1);
  --ease-out:       cubic-bezier(0, 0, 0.2, 1);
}
```

### Motion Rules

- **No bounce, no spring, no elastic.** This is not a toy.
- **State changes** (hover, active, focus): `--duration-fast`, `--ease-sharp`.
- **Page transitions / reveals:** `--duration-slow`, `--ease-out`.
- **No animation purely for delight.** If it doesn't communicate something, cut it.
- **Always respect `prefers-reduced-motion`:**

```css
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration:  0.01ms !important;
    transition-duration: 0.01ms !important;
  }
}
```

---

## Accessibility

- **Color alone never conveys meaning.** Acid and Cobalt are accents, not solo status indicators.
- **Minimum contrast:** 4.5:1 for body text, 3:1 for large text and UI components.
- **Dark mode Cobalt (`#4B7FFF`) on `#111008`** passes AA. Do not substitute.
- **Focus styles are never removed.** If it's ugly, redesign it — don't hide it.
- **Touch targets minimum 44×44px.** Always.
- **Alt text is content, not description.** Write what the image communicates, not what it depicts.
- **Plain language first.** If a 10-year-old can't understand the label, rewrite it.

---

## Voice & Tone

- **Direct.** Say the thing. No hedging, no softening language that means nothing.
- **Civic.** Assume the reader is intelligent and deserves full information.
- **Dry wit is allowed.** Forced friendliness is not.
- **Error messages are honest.** "Something went wrong" is not acceptable — tell users what happened and what to do.
- **CTA copy is action-first.** "Submit" is lazy. "Send application," "View case study," "Download resume" — verbs with intention.

---

## Anti-Patterns

| ❌ Don't | ✓ Instead |
|---|---|
| Use Arial | Use Schibsted Grotesk |
| Use gradients | Use flat color |
| Use border-radius values other than 4px or 100px | Use `--radius-sm` (4px) or `--radius-pill` (100px) only |
| Use Acid as text color | Use Acid as background or border only |
| Use Cobalt on Ink background (light mode) | Use Cobalt on Paper or Warm Rule only |
| Put Acid and Cobalt on the same element | One accent per element, always |
| Use light mode Cobalt (`#1B4FD8`) in dark mode | Use dark mode Cobalt (`#4B7FFF`) |
| Hide focus states | Redesign them to look intentional |
| Use magic number spacing | Use a named token from the 8pt scale |
| Use icons without labels on critical actions | Pair icon + text or add `aria-label` |
| Animate for delight | Animate to communicate |
| Use "Submit" as button copy | Use a specific action verb |
| Center long body text | Left-align everything longer than 2 lines |
| Use Font Awesome in personal projects | Use Tabler Icons (outline only) |
| Use asterisks for required fields | Label optional fields with `(optional)` instead |
| Write "Required" as an error message | Say what's wrong and how to fix it |
| Use placeholder text as a label | Always use a visible `<label>` element |
| Disable the submit button to prevent errors | Let users submit, then show inline errors |
| Use Alarm for anything other than errors | Alarm is semantic — errors and destructive actions only |

---

## Quick Reference

```
LIGHT MODE
  Background:   #F5F0E8  (Paper)
  Text:         #0D0D0D  (Ink)
  Accent 1:     #D6E000  (Acid)     → action, CTAs, selected
  Accent 2:     #1B4FD8  (Cobalt)   → links, info, categories
  Border:       #E8E0D0  (Warm Rule)
  Muted text:   #2A2A2A  (Charcoal)
  Error:        #DC2626  (Alarm)    → errors, destructive actions only

DARK MODE
  Background:   #111008  (Warm Void)
  Text:         #F0EBE0  (Off-white)
  Accent 1:     #D6E000  (Acid)     → unchanged, hits harder
  Accent 2:     #4B7FFF  (Electric) → lightened for dark contrast
  Border:       #2A2620  (Deep Rule)
  Muted text:   #8A8478
  Error:        #F87171  (Alarm)    → lightened for dark surface legibility

FONTS
  Body:    Schibsted Grotesk 400/500/600
  Display: Playfair Display 700/900
  Mono:    Courier New

SPACING
  4 · 8 · 16 · 24 · 32 · 48 · 64 · 96 · 128px
```

---

## File Conventions (for Claude Projects)

When starting a new Claude session with this system:

1. Upload this file first.
2. State the project type (portfolio piece, UI prototype, deck, etc.).
3. State any overrides for the specific project.
4. Claude will apply this system as the default visual language unless told otherwise.

**Filename:** `melinda-design-system.md`
**GitHub:** Repo root as `design-system.md`

---

*Version 1.5 · July 2026 · Melinda Green · mynameisgreenmelinda.com*

---

## Form Elements

Forms in this system are honest about what they need. All fields are required unless explicitly marked optional. No asterisks. No ambiguity.

### Semantic Error Color

| Token | Light Mode | Dark Mode | Usage |
|---|---|---|---|
| `--color-alarm` | `#DC2626` | `#F87171` | Error text, error borders, destructive states |
| `--color-alarm-bg` | `#FFF5F5` | `#1C0A0A` | Error message background surface |

Alarm is a semantic-only color. It lives outside the main palette and has one job. Never use it for emphasis, decoration, or anything that isn't a genuine error or destructive action.

### Required vs. Optional Convention

- **All fields are required by default.** No marker needed.
- **Optional fields** get a quiet `(optional)` in parentheses after the label — Schibsted Grotesk, 400 weight, same size as label, no uppercase, no special color.
- **Never use asterisks.** Not even with a legend. Label the exception, not the rule.

```html
<!-- Required field — no marker -->
<label class="form-label">Full name</label>

<!-- Optional field — quiet parenthetical -->
<label class="form-label">Phone number <span class="form-label-optional">(optional)</span></label>
```

### Base Styles

```css
.form-group {
  display:        flex;
  flex-direction: column;
  gap:            var(--space-2);   /* 8px */
  margin-bottom:  var(--space-4);   /* 24px */
}

.form-label {
  font-family:    var(--font-body);
  font-size:      var(--text-body-xs);   /* 12px */
  font-weight:    600;
  letter-spacing: var(--tracking-wide);
  text-transform: uppercase;
  color:          var(--color-ink);
}

.form-label-optional {
  font-weight:    400;
  font-size:      var(--text-body-xs);
  letter-spacing: var(--tracking-normal);
  text-transform: none;
  color:          var(--color-charcoal);
  margin-left:    var(--space-1);
}

.form-hint {
  font-family:  var(--font-body);
  font-size:    var(--text-body-xs);   /* 12px */
  font-weight:  400;
  color:        var(--color-charcoal);
  line-height:  var(--leading-normal);
  margin:       0;
}
```

### Input — Text, Email, URL, Number

```css
.form-input {
  font-family:      var(--font-body);
  font-size:        var(--text-body-md);   /* 16px */
  font-weight:      400;
  color:            var(--color-ink);
  background:       var(--color-paper);
  border:           var(--border-mid);     /* 1px solid ink */
  border-radius:    var(--radius-sm);
  padding:          var(--space-2) var(--space-3);   /* 8px 16px */
  width:            100%;
  box-sizing:       border-box;
  transition:       border-color 100ms var(--ease-sharp);
  appearance:       none;
}

.form-input::placeholder {
  color:   var(--color-charcoal);
  opacity: 0.6;
}

.form-input:hover {
  border-color: var(--color-charcoal);
}

.form-input:focus {
  outline:      none;
  border-color: var(--color-cobalt);
  box-shadow:   0 0 0 2px var(--color-cobalt);
}

/* Error state */
.form-input.is-error {
  border-color: var(--color-alarm);
  border-width: 2px;
}

.form-input.is-error:focus {
  border-color: var(--color-alarm);
  box-shadow:   0 0 0 2px var(--color-alarm);
}

/* Disabled */
.form-input:disabled {
  opacity:        0.4;
  cursor:         not-allowed;
  pointer-events: none;
}
```

### Textarea

```css
.form-textarea {
  font-family:   var(--font-body);
  font-size:     var(--text-body-md);
  font-weight:   400;
  color:         var(--color-ink);
  background:    var(--color-paper);
  border:        var(--border-mid);
  border-radius:  var(--radius-sm);
  padding:       var(--space-2) var(--space-3);
  width:         100%;
  box-sizing:    border-box;
  min-height:    120px;
  resize:        vertical;
  line-height:   var(--leading-normal);
  transition:    border-color 100ms var(--ease-sharp);
  appearance:    none;
}

.form-textarea:hover  { border-color: var(--color-charcoal); }

.form-textarea:focus {
  outline:      none;
  border-color: var(--color-cobalt);
  box-shadow:   0 0 0 2px var(--color-cobalt);
}

.form-textarea.is-error {
  border-color: var(--color-alarm);
  border-width: 2px;
}
```

### Select

```css
.form-select {
  font-family:      var(--font-body);
  font-size:        var(--text-body-md);
  font-weight:      400;
  color:            var(--color-ink);
  background-color: var(--color-paper);
  border:           var(--border-mid);
  border-radius:    var(--radius-sm);
  padding:          var(--space-2) var(--space-5) var(--space-2) var(--space-3);
  width:            100%;
  box-sizing:       border-box;
  appearance:       none;
  cursor:           pointer;
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%230D0D0D' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpath d='M6 9l6 6 6-6'/%3E%3C/svg%3E");
  background-repeat:   no-repeat;
  background-position: right var(--space-3) center;
  transition:          border-color 100ms var(--ease-sharp);
}

.form-select:hover  { border-color: var(--color-charcoal); }

.form-select:focus {
  outline:      none;
  border-color: var(--color-cobalt);
  box-shadow:   0 0 0 2px var(--color-cobalt);
}

.form-select.is-error {
  border-color: var(--color-alarm);
  border-width: 2px;
}
```

### Checkbox & Radio

Sharp corners on checkboxes. No rounded softness. The checked state uses Acid — it's a selected/active moment.

```css
.form-check {
  display:     flex;
  align-items: flex-start;
  gap:         var(--space-2);   /* 8px */
  cursor:      pointer;
}

.form-check-input {
  appearance:    none;
  width:         16px;
  height:        16px;
  min-width:     16px;
  border:        var(--border-mid);
  border-radius:  var(--radius-sm);
  background:    var(--color-paper);
  cursor:        pointer;
  margin-top:    2px;
  transition:    background 100ms var(--ease-sharp), border-color 100ms var(--ease-sharp);
}

/* Radio — only exception to sharp corners */
.form-check-input[type="radio"] {
  border-radius: 50%;
}

.form-check-input:checked {
  background:   var(--color-acid);
  border-color: var(--color-ink);
}

/* Checkmark via background image */
.form-check-input[type="checkbox"]:checked {
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='10' height='10' viewBox='0 0 24 24' fill='none' stroke='%230D0D0D' stroke-width='3' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpath d='M20 6L9 17l-5-5'/%3E%3C/svg%3E");
  background-repeat:   no-repeat;
  background-position: center;
}

/* Radio inner dot */
.form-check-input[type="radio"]:checked {
  background-image: radial-gradient(circle, var(--color-ink) 40%, var(--color-acid) 40%);
}

.form-check-input:focus-visible {
  outline:        2px solid var(--color-acid);
  outline-offset: 2px;
}

.form-check-label {
  font-family:  var(--font-body);
  font-size:    var(--text-body-md);
  font-weight:  400;
  color:        var(--color-ink);
  line-height:  var(--leading-normal);
  cursor:       pointer;
}
```

### Error Message

The error message lives directly below the field it belongs to. It names the problem and tells the user what to do. "This field is required" is not an error message — it's a placeholder for one.

```css
.form-error {
  display:      flex;
  align-items:  flex-start;
  gap:          var(--space-1);   /* 4px */
  font-family:  var(--font-body);
  font-size:    var(--text-body-xs);   /* 12px */
  font-weight:  500;
  color:        var(--color-alarm);
  line-height:  var(--leading-normal);
  margin:       0;
}

/* Optional: error with background surface for grouped errors */
.form-error-block {
  background:  var(--color-alarm-bg);
  border-left: 4px solid var(--color-alarm);
  padding:     var(--space-3) var(--space-4);
  margin:      var(--space-4) 0;
}

.form-error-block p {
  font-family: var(--font-body);
  font-size:   var(--text-body-sm);
  font-weight: 500;
  color:       var(--color-alarm);
  margin:      0;
}
```

### Complete Form Example

```html
<form novalidate>

  <div class="form-group">
    <label class="form-label" for="name">Full name</label>
    <input class="form-input" type="text" id="name" autocomplete="name" />
  </div>

  <div class="form-group">
    <label class="form-label" for="email">
      Email address
      <span class="form-label-optional">(optional)</span>
    </label>
    <p class="form-hint">We'll only use this to follow up on your submission.</p>
    <input class="form-input is-error" type="email" id="email"
           value="melinda@" aria-describedby="email-error" />
    <p class="form-error" id="email-error" role="alert">
      <i class="ti ti-alert-circle" aria-hidden="true"></i>
      Enter a complete email address — for example, name@domain.com.
    </p>
  </div>

  <div class="form-group">
    <label class="form-label" for="topic">Topic</label>
    <select class="form-select" id="topic">
      <option value="" disabled selected>Choose one</option>
      <option value="ux">UX design</option>
      <option value="civic">Civic tech</option>
      <option value="other">Other</option>
    </select>
  </div>

  <div class="form-group">
    <label class="form-label" for="message">Message</label>
    <textarea class="form-textarea" id="message" rows="5"></textarea>
  </div>

  <div class="form-group">
    <label class="form-check">
      <input class="form-check-input" type="checkbox" />
      <span class="form-check-label">I agree to the terms of service.</span>
    </label>
  </div>

  <button class="btn-primary" type="submit">Send message</button>

</form>
```

### Form Rules

- **All fields required unless labeled `(optional)`.** No asterisks. Ever.
- **Error messages are specific.** Say what's wrong and how to fix it. "Required" alone is not enough.
- **Error messages use `role="alert"`** so screen readers announce them without the user having to navigate to them.
- **Focus state uses Cobalt** — it's an informational moment. Error focus uses Alarm.
- **Labels are always visible.** No placeholder-as-label. Placeholders disappear the moment someone starts typing.
- **Hint text goes between the label and the input,** not below it. Users read top to bottom; they should see the hint before they make a mistake.
- **Group related fields.** Shipping address is one group. Billing is another. Don't orphan fields.
- **Submit button copy is specific.** "Send message," "Submit application," "Save changes" — not "Submit."
- **`novalidate` on the `<form>` tag.** Browser default validation is ugly and uncontrollable. Handle it yourself.
- **Never disable the submit button** as a validation strategy. Let users attempt submission, then show errors inline. Disabled buttons don't explain themselves.

