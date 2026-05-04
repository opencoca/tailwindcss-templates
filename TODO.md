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

- [ ] **tw2startr Kickoff**: Start conversion workflow on `layouts/**/*.html` #critical
  - [x] Run dry-run with diff/report on `layouts/voyage.html` using `WEB-AI--Sage-is-AI-UI/tools/tw2startr`
  - [x] Capture unsupported classes/selectors as manual follow-up list
  - [x] Manual follow-up tokens from `layouts/voyage.html`: `antialiased`, `container`, `font-display`, `font-heading`
  - [x] Remove `https://cdn.tailwindcss.com` script from `layouts/voyage.html` once equivalent styling is validated
  - [x] Pick 1 template for first full conversion pass (`layouts/voyage.html`)
- [ ] **Bulk Layout Pass (`layouts/*.html`)**: Complete end-to-end conversion and Tailwind removal across all layout files #critical
  - [x] Dry-run completed: `30` files scanned, `27` modified, `1007` classes converted, `62` classes remaining (`94.2%`)
  - [x] Apply run completed with same conversion metrics
  - [x] Manual review shim wave applied to 7 flagged files:
    - [x] `layouts/DentalPro.html` (`focus:*` hooks preserved; shim-backed)
    - [x] `layouts/Pinwheel-tailwind.html` (`group-hover:*` / `space-x-*` hooks shim-backed)
    - [x] `layouts/Tailwind Starter Template - Landing Page Template_ Windy Toolbox.html` (`focus:outline-none` shim-backed)
    - [x] `layouts/essential.html` (`space-y-4` shim-backed)
    - [x] `layouts/foundation.html` (`md:space-x-12` shim-backed)
    - [x] `layouts/launch.html` (`md:order-*` shim-backed)
    - [x] `layouts/outlet.html` (`lg:order-first`, `space-y-4` shim-backed)
  - [x] Added shared shim stylesheet: `layouts/tw2startr-manual-utilities.css`
  - [x] Added automation backport tracker: `WEB-AI--Sage-is-AI-UI/tools/tw2startr/manual_cleanup_tracker.json`
  - [x] Remove Tailwind refs from remaining `20` files that still include CDN/config links
  - [ ] Resolve remaining class attrs in `22` files (`class="..."`) after manual review
  - [x] Post-wave metrics: `0` layout files with Tailwind refs, `30/30` layout files linked to shim stylesheet, `30/30` layout files linked to `startr.style`
  - [x] Non-layout scan (excluding vendor/snapshots): `0` HTML files with Tailwind refs

## TODO

### Priority — tw2startr Conversion

- [ ] **Adopt `tw2startr` Workflow**: Use the converter from `WEB-AI--Sage-is-AI-UI/tools/tw2startr` as the primary migration tool for this repo #critical
  - [x] Run a dry-run conversion report against `layouts/**/*.html`
  - [x] Identify unsupported Tailwind patterns that require manual follow-up
  - [ ] Decide whether to run the converter in-place from the external repo or vendor it into this repo
- [ ] **Convert Layout Templates to `startr.style`**: Replace heavy Tailwind utility usage with lightweight inline Startr.Style properties
  - [x] Start with one representative template and validate visual parity (`layouts/voyage.html` converted; smoke-view loads successfully)
  - [x] Run full-batch converter pass over `layouts/*.html` to accelerate migration
  - [ ] Replace Tailwind CDN dependency with `https://startr.style/style.css` where conversion is complete
  - [ ] Keep third-party/vendor-exported templates out of scope unless explicitly selected for cleanup
- [ ] **Define Conversion Review Standard**: Decide what counts as acceptable auto-conversion vs manual cleanup
  - [ ] Preserve responsive behavior (`sm:`, `md:`, `lg:`, `xl:`)
  - [ ] Review hover/dark mappings for parity
  - [ ] Track unsupported selectors and component states as manual review items

### TodoScope Alignment

- [ ] **Inline Tag Audit**: Scan codebase for inline `TODO:` / `FIXME:` / `BUG:` tags and add untracked items to "From Codebase" subsection
  - [ ] Run TodoScope scanner and review output
  - [ ] Add any untracked inline items to `## TODO / From Codebase (untracked)` below
- [ ] **Review `.todoscope-exclude.csv`**: Verify all tool-generated and vendor paths are excluded
  - [ ] Confirm `sparrow/` exclusion is correct (HTTrack mirror of third-party sites)
  - [x] Confirm `MatDash-1.0.0/node_modules` and `dist` paths are listed once dependencies are installed

### Repo Housekeeping

- [x] **HTML Scope Poka-Yoke**: Add a guard script to prevent accidental edits in vendor/mirror HTML trees
  - [x] Added `scripts/poka-yoke-html-scope.sh`
  - [x] Safe scope enforced as top-level `layouts/*.html` only
  - [x] Validation run: `30` safe layout targets asserted
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

- [x] **Deduplicate Stylesheet Link**: `index.html` includes `startr.style/style.css` twice — remove duplicate `<link>` tag
- [ ] **Audit Layout Templates**: Inventory which templates are good candidates for `tw2startr` conversion first
  - [x] Separate original/local templates from downloaded vendor snapshots
  - [x] Identify which templates still use `cdn.jsdelivr.net/npm/tailwindcss/dist/tailwind.min.css`
  - [x] Queue the cleanest conversion candidates first

## Backlog

- [ ] **Template Index Page**: Expand `index.html` to highlight converted `startr.style` templates first; consider MatDash only if it remains in scope
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
- [x] **MatDash Build Setup**: Dependencies and dev/build pipeline verified
  - [x] `bun install` inside `MatDash-1.0.0/`
  - [x] `bun run dev` — confirmed Vite dev server starts
  - [x] `bun run build` — confirmed dist output
- [x] **Project Focus Set**: Prioritized Tailwind-to-Startr.Style conversion for this repo
  - [x] Confirmed external utility path: `WEB-AI--Sage-is-AI-UI/tools/tw2startr`
  - [x] Identified this repo's main focus as layout conversion rather than MatDash expansion
- [x] **Voyage Pilot Conversion**: Applied `tw2startr` to `layouts/voyage.html`
  - [x] Dry-run diff/report reviewed before apply
  - [x] Apply run completed (`32` classes converted, `14` classes remaining)
  - [x] Browser smoke-view verified at `http://localhost:8080/layouts/voyage.html`
- [x] **Tributary Conversion**: Migrated `layouts/tributary.html` off Tailwind dependency
  - [x] Class utilities inlined; Tailwind CDN/config removed
  - [x] Remaining style tokens normalized to valid values
- [x] **Index Cleanup**: Updated `index.html` to remove Tailwind stylesheet dependency
  - [x] Removed duplicate `startr.style` link and `tailwind.min.css` import
  - [x] Converted active Tailwind-only utility remnants to inline Startr-style values
- [x] **Bulk Layout Conversion Wave**: Applied `tw2startr` over all `layouts/*.html`
  - [x] `30` files scanned, `27` modified, `1007` classes converted
  - [x] Residual manual-review backlog captured for final pass
