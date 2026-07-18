import { describe, it, expect } from 'vitest';
import { readFileSync } from 'node:fs';
import { dirname, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';

const __dirname = dirname(fileURLToPath(import.meta.url));
const repoRoot = resolve(__dirname, '../..');

function readRepoText(path) {
  return readFileSync(resolve(repoRoot, path), 'utf-8').replace(/\r\n?/g, '\n');
}

// This project is specialized for Claude Code only. There is no multi-platform
// install table anymore — Claude Code installs the plugin via the marketplace
// (`/plugin marketplace add ...`). These tests just guard that the repo stays
// Claude-only and that the plugin manifests point at the right marketplace.
const REPO = 'huycoder2103/Graph-Understanf-for-claudeCodeCLI';

describe('Claude-only specialization', () => {
  it('root marketplace manifest is owned by the right account', () => {
    const marketplace = JSON.parse(readRepoText('.claude-plugin/marketplace.json'));
    expect(marketplace.owner.name).toBe('huycoder2103');
    expect(marketplace.plugins.some((p) => p.name === 'understand-anything')).toBe(true);
  });

  it('plugin manifests point at this repo', () => {
    for (const path of [
      '.claude-plugin/plugin.json',
      'understand-anything-plugin/.claude-plugin/plugin.json',
    ]) {
      const plugin = JSON.parse(readRepoText(path));
      expect(plugin.homepage).toContain(REPO);
      expect(plugin.repository).toContain(REPO);
    }
  });

  it('README installs via the Claude Code marketplace', () => {
    const readme = readRepoText('README.md');
    expect(readme).toContain(`/plugin marketplace add ${REPO}`);
    expect(readme).toContain('/plugin install understand-anything');
  });
});
