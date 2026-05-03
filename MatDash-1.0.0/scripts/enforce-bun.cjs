#!/usr/bin/env node

const ua = process.env.npm_config_user_agent || "";
const execPath = process.env.npm_execpath || "";
const isBunExecPath = /(^|[\\/])bun(\.exe)?$/.test(execPath);
const isBun = ua.startsWith("bun/") || isBunExecPath;

// Fail fast when scripts are launched via npm, pnpm, or yarn.
if (!isBun) {
  console.error("\nThis project is Poka-Yoke locked to Bun.");
  if (ua) {
    console.error(`Detected package manager: ${ua}`);
  }
  console.error("Use: bun install\n");
  process.exit(1);
}
