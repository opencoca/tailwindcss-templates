#!/usr/bin/env node

const ua = process.env.npm_config_user_agent || "";

// Bun sets user-agent with a leading "bun/"; fail fast for other package managers.
if (!ua.startsWith("bun/")) {
  console.error("\nThis project is Poka-Yoke locked to Bun.");
  console.error("Use: bun install\n");
  process.exit(1);
}
