# TODO — tailwindcss-templates

> **Convention** — Sections below map to kanban columns. Inline source-code
> tags use the same vocabulary so items stay cross-referenced between this
> file and the codebase. `KANBAN.canvas` auto-generates from this file and
> inline tags — do not hand-edit it.
>
> | Column      | Markdown section  | Inline tag  |
> |-------------|-------------------|-------------|
> | Backlog     | `## Backlog`      |             |
> | TODO        | `## TODO`         | `# TODO:`   |
> | In Progress | `## In Progress`  | `# FIXME:`  |
> | Bugs        | `## Bugs`         | `# BUG:`    |
> | Done        | `- [x]` items / `## Done` | —   |
>
> `# DEPRECATED:` tags should be tracked as TODO items for removal at the
> stated version.

## In Progress

_Nothing actively in flight. Move items here when work begins._

## TODO

### TodoScope Alignment

- [ ] **Inline Tag Audit**: Scan codebase for inline `TODO:` / `FIXME:` / `BUG:` tags and add untracked items to "From Codebase" subsection
  - [ ] Run TodoScope scanner and review output
  - [ ] Add any untracked inline items to `## TODO / From Codebase (untracked)` below
- [ ] **Review `.todoscope-exclude.csv`**: Verify all tool-generated and vendor paths are excluded
  - [ ] Confirm `sparrow/` exclusion is correct (HTTrack mirror of third-party sites)
  - [x] Confirm `MatDash-1.0.0/node_modules` and `dist` paths are listed once dependencies are installed

### Repo Housekeeping

- [ ] **Update `index.html` Title**: Replace upstream `By Digizu` attribution with Startr LLC branding
  - [ ] Update `<title>` tag
  - [ ] Update `<meta name="description">` tag
- [x] **MatDash README**: Replace Create React App boilerplate README with project-specific docs
  - [x] Describe what MatDash is and its purpose in this repo
  - [x] Document `bun run dev` / `bun run build` commands
- [ ] **Copyright Header Pass**: Add `Copyright (c) 2026 Startr LLC` comment header to original source files in `MatDash-1.0.0/src/`
  - [ ] `src/layouts/full/sidebar/Sidebaritems.ts`
  - [ ] `src/types/auth/auth.ts`
  - [ ] `src/types/layout/sidebar.ts`

### layouts/ Templates

- [ ] **Deduplicate Stylesheet Link**: `index.html` includes `startr.style/style.css` twice — remove duplicate `<link>` tag
- [ ] **Audit Layout Templates**: Review all HTML files in `layouts/` for outdated CDN references (Tailwind via old jsdelivr CDN)
  - [ ] Identify which templates still use `cdn.jsdelivr.net/npm/tailwindcss/dist/tailwind.min.css`
  - [ ] Update to current Tailwind CDN or document intentional pin

## Backlog

- [ ] **MatDash Build Setup**: Install dependencies and verify dev/build pipeline works
  - [x] `bun install` inside `MatDash-1.0.0/`
  - [ ] `bun run dev` — confirm Vite dev server starts
  - [x] `bun run build` — confirm dist output
- [ ] **Template Index Page**: Expand `index.html` to include previews of `MatDash-1.0.0` and any new Sparrow layouts
- [ ] **CI — Link Check**: Add a simple CI workflow to catch dead CDN links across layout files

## Bugs

_No known bugs. Use `# BUG:` inline tags to flag defects in source._

## Done

- [x] **Copyright Attribution**: Added Startr LLC to `LICENSE.md` and `README.md`
  - [x] Updated `LICENSE.md` with `Copyright (c) [2024-2026] [Startr LLC]`
  - [x] Added Startr LLC to Authors section in `README.md`
- [x] **Bun Migration**: Moved MatDash package management from npm to Bun
  - [x] Migrated lockfile to `bun.lock`
  - [x] Removed `package-lock.json`
  - [x] Switched scripts and docs to Bun commands
- [x] **Poka-Yoke Package Manager Guard**: Prevent accidental npm/pnpm/yarn usage in MatDash
  - [x] Added install-time guard script (`scripts/enforce-bun.cjs`)
  - [x] Added runtime script guards (`predev`, `prebuild`, `prelint`, `prepreview`)
