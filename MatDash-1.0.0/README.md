# MatDash (Vite + React + TypeScript)

This folder contains the MatDash app used in this repository.

## Package Manager

This project uses Bun.

Poka-Yoke guardrails are enabled:
- `packageManager` is pinned to Bun in `package.json`
- `preinstall` blocks `npm`, `pnpm`, and `yarn`

## Development

Install dependencies:

```bash
bun install
```

Start the Vite dev server:

```bash
bun run dev
```

## Build

Create a production build:

```bash
bun run build
```

Preview the production build:

```bash
bun run preview
```

## Lint

Run ESLint:

```bash
bun run lint
```

## Deploy

Build and publish with `gh-pages`:

```bash
bun run deploy
```
